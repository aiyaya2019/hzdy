<?php
namespace app\admin\controller;
use app\common\model\Goods as GoodsModel;
use app\common\model\GroupOrder;
use app\common\model\GroupSale;
use app\common\model\Logistics;
use app\common\model\User;
use think\Db;

Class Group extends Common{

    /**
     * [index 商品列表]
     * @Author   PengJun
     * @DateTime 2019-01-24
     * @return   [type]     [description]
     */
    public function index()
    {   
        if(request()->isAjax()){
            $post = input('post.');
            $where = [];

            //商品名称搜索
            if(!empty($post['title'])){
                $post['where']['title'] = ['like','%'.$post['title'].'%'];
            }

            $post['field'] = 'id,title,pic,price,old_price,fare_price,pay_num,stock,is_show,add_time';
            $list = $this->selectAll('group_goods',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }

        return $this->fetch();
    }

    /**
     * [save 添加/编辑商品]
     * @Author   PengJun
     * @DateTime 2019-01-24
     * @return   [type]     [description]
     */
    public function save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            //封面上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }

            if(!empty($post['files'])){
                $post['images'] = implode(',',$post['files']);
            }

            //商品标签
            if(!empty($post['label_id'])){
                $post['label_id'] = implode(',',$post['label_id']);
            } else {
                $post['label_id'] = '';
            }

            $this->saves('group_goods',$post);
           
        }

        $goods = $this->getFind('group_goods',$id);
        //商品标签
        $label = $this->selectAll('goods_label');
        
        return $this->fetch('',[
            'goods'  => $goods,
            'label'  => $label['list'],
        ]);
    }

    /**
     * 拼团订单
     * @author vevay
     * @time: 2019/6/29 15:38
     */
    public function order(){
        if(request()->isPost()){
            $post = input('post.');

            $post['where'] = 'is_deleted = 0';
            if(!empty($post['keywords'])){
                $post['where'] .= ' and order_sn like "%'.$post['keywords'].'%" OR tel like "%'.$post['keywords'].'%" OR logistics_no like "%'.$post['keywords'].'%" OR goods_title like "%'.$post['keywords'].'%"';
            }

            if (!empty($post['user_keywords'])){
                $map = 'number like "%'.$post['user_keywords'].'%" OR nickname like "%'.emojiEncode($post['user_keywords']).'%"';
                $id = User::where($map)->column('id');
                if (count($id) > 0){
                    $id = implode(',',$id);
                    $post['where'] .= ' and uid in('.$id.')';
                }
            }

            if (!empty($post['start_time']) && !empty($post['end_time']))
            {
                $start_time = strtotime($post['start_time']);
                $end_time = strtotime($post['end_time']);
                $post['where'] .= ' and add_time >= '.$start_time.' and add_time <= '.$end_time.'';
            }


            $list = $this->selectAll('group_order',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch();
    }

    //退款详情
    public function refund_info()
    {

        $id = input('id');
        $data = GroupSale::with('order')->where('id',$id)->find();

        return $this->fetch('',['data'=>$data]);

    }

    /**
     * 拼团订单详情
     * @author vevay
     * @time: 2019/7/1 16:41
     */
    public function info(){
        $id = input('id');
        $data = GroupOrder::get($id);
//        dump($data->toArray());die;
        return $this->fetch('',['data'=>$data]);
    }

    /**
     * 订单发货
     * @author vevay
     * @time: 2019/7/15 10:39
     */
    public function delivery(){
        if($this->request->isPost()){
            $post = $this->request->post();
            // 查询物流信息
            $logistics = Logistics::get($post['logistics_id']);
            // 更新订单信息
            $post['logistics_state'] = 1;
            $post['logistics_name'] = $logistics['name'];
            $post['logistics_code'] = $logistics['code'];
            $post['logistics_time'] = time();
            $post['update_time'] = time();
            $post['status'] = 3;
            save('group_order',$post);
        }
        $logistics = Logistics::where(['is_deleted'=>0,'status'=>1])->select();
        return $this->fetch('',['logistics'=>$logistics]);
    }

    /**
     * 退款记录列表
     * @author vevay
     * @time: 2019/7/15 16:25
     */
    public function refund(){
        if(request()->isPost()){
            $post = input('post.');
            if(isset($post['status']) && $post['status'] != 10){
                $post['where']['status'] = $post['status'];
            }
            if(!empty($post['order_sn'])){
                $post['where']['order_sn'] = ['like','%'.$post['order_sn'].'%'];
            }
            $post['with'] = 'order';
            $list = $this->selectAll('group_sale',$post);
            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch();
    }

    /**
     * 退款审核
     * @author vevay
     * @time: 2019/7/15 16:59
     */
    public function refundAudit(){
        $post = $this->request->post();
        // 查询订单信息
        $data['field'] = '*';
        $data['where']['id'] = $post['id'];
        $order = $this->getFind('group_sale',$data);
        $pay_type = GroupOrder::where('id',$order['order_id'])->value('pay_type');
        if ($order['money'] == 0){
            $money = $order['price'];
        }else{
            $money = $order['money'];
        }
        if($post['status'] == 1){
            if($pay_type == 1){
                //微信支付
                $order_sn = GroupOrder::where('id',$order['order_id'])->value('order_sn');
                $res = controller('api/Weix')->refund($order_sn,$money);
                if ($res['result_code'] != 'SUCCESS') {
                    return_ajax(400,$res['err_code_des'],$res);
                }else{
                    GroupOrder::where('id',$order['order_id'])->update(['status'=>6,'update_time'=>time()]);
                    GroupSale::where('id',$post['id'])->setField('status',1);
                    return_ajax(200,'退款成功');
                }
            }else{
                // 余额支付
                $rs1 = price(1,$order['uid'],$money,'拼团订单退款');
                $rs2 = GroupOrder::where('id',$order['order_id'])->update(['status'=>6,'update_time'=>time()]);
                $rs3 = GroupSale::where('id',$post['id'])->update(['status'=>1]);
                if($rs1 && $rs2 && $rs3){
                    return_ajax(200,'退款成功');
                }else{
                    return_ajax(400,'退款操作失败！！');
                }
            }
        }else{
            // 拒绝退款
            $rs1 = GroupOrder::where('id',$post['order_id'])->update(['status'=>7,'update_time'=>time()]);
            // 更新退款记录
            $rs2 = GroupSale::where('id',$post['id'])->update(['status'=>2]);
            if($rs1 && $rs2){
                return_ajax(200,'拒绝退款成功');
            }else{
                return_ajax(400,'拒绝退款操作失败！！');
            }
        }
    }

    /**
     * [order_excel 导出订单]
     * @Author   PengJun
     * @DateTime 2019-01-29
     * @return   [type]     [description]
     */
    public function order_excel()
    {
        ini_set('memory_limit','3072M');
        set_time_limit(0);

        $post = input('post.');
        $where = '';

        if (!empty($post['start_time']) && !empty($post['end_time'])){
            $start_time = strtotime($post['start_time']);
            $end_time = strtotime($post['end_time']);
            $where = 'add_time >= '.$start_time.' and add_time <= '.$end_time.'';
        }

        $order = GroupOrder::order('id desc')->where($where)->select();

        $head = ['编号','订单号','团单号','应付','实付','收货人','手机号','收货地址','拼团状态','拼团结束时间','订单状态','下单时间'];
        $data = [];
        foreach($order as $key=>$vo){
            $data[] = [
                $vo['id'],
                $vo['order_sn'],
                $vo['group_no'],
                $vo['order_price'],
                $vo['pay_money'],
                $vo['name'],
                $vo['tel'],
                $vo['address'],
                $vo['group_status_name'],
                $vo['end_time'],
                $vo['status_name'],
                $vo['add_time'],
            ];
        }

        excelExport('订单信息',$head,$data);

    }
  


    /**
     * 修改订单地址价格
     */
    public function order_save(){

        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            $post['update_time'] = time();
            if(empty($post['id'])){
                return_ajax(400,'编辑失败,请稍后重试');
            } else {
                $id = $post['id'];
                unset($post['id']);
                //编辑
                $res = Db::name('group_order')->where('id', $id)->update($post);
                if($res){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $data = Db::name('group_order')->where('id',$id)->find();
        return $this->fetch('',[
            'data'  => $data,
        ]);
    }

    public function closeOrder(){
        if(request()->isPost()){
            $post = input('post.');
            if ($post['type'] == 1){
                //确认付款
                $rs = GroupOrder::where('id', $post['id'])->update(['status' => 2, 'group_status'=>2, 'update_time' => time()]);
            }else{
                //关闭订单
                $rs = GroupOrder::where('id', $post['id'])->update(['status' => 8, 'update_time' => time()]);
            }

            if($rs){
                return_ajax(200,'操作成功');
            }else{
                return_ajax(400,'网络繁忙！！');
            }
        }
    }
  
}