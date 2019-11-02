<?php
namespace app\admin\controller;
use app\common\model\PointGoods;
use app\common\model\PointOrder;
use app\common\model\Logistics;
use app\common\model\User;
use think\Db;


Class Point extends Common{

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
                $where['title'] = ['like','%'.$post['title'].'%'];
            }

            $list = PointGoods::where($where)->order('add_time desc')->page(input('page'),20)->select();
            $count = PointGoods::where($where)->count();
            return_ajax(200,'获取成功',$list,$count);
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
            $goods = new PointGoods;

            //封面上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }

            if(!empty($post['files'])){
                $post['images'] = implode(',',$post['files']);
            }

            $post['update_time'] = time();
            if(empty($post['id'])){
                //新增
                if($goods->allowField(true)->save($post)){
                    return_ajax(200,'添加成功',$goods->id);
                } else {
                    return_ajax(400,'添加失败,请稍后重试');
                }
            } else {
                //编辑
                if($goods->allowField(true)->save($post,['id'=>$post['id']])){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $goods = PointGoods::get($id);

        // p(toArray($goods));
        return $this->fetch('',[
            'goods'  => $goods,
        ]);
    }

    //积分商品订单
    public function order(){
        if(request()->isPost()){
            $post = input('post.');

            $post['where'] = 'id > 0';
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
            $list = $this->selectAll('point_order',$post);
            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch();
    }

    //查看积分商品订单
    public function info(){
        $id = input('id');
        $data = PointOrder::get($id);
        if ($data) {
            $user = User::where('id', $data['uid'])->find();
            $data['number']   = $user['number'];
            $data['nickname'] = emojiDecode($user['nickname']);
        }
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
            $post['status'] = 2;
            save('point_order',$post);
        }
        $logistics = Logistics::where(['is_deleted'=>0,'status'=>1])->select();
        return $this->fetch('',['logistics'=>$logistics]);
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

        $order = PointOrder::order('id desc')->where($where)->select();

        $head = ['编号','订单编号','兑换积分','收货人','手机号','收货地址','订单状态','下单时间'];
        $data = [];
        foreach($order as $key=>$vo){
            $data[] = [
                $vo['id'],
                $vo['order_sn'],
                $vo['point'],
                $vo['name'],
                $vo['tel'],
                $vo['address'],
                $vo['status_name'],
                $vo['add_time'],
            ];
        }

        excelExport('订单信息',$head,$data);

    }


    /**
     * 关闭订单
     */
    public function closeOrder(){
        if(request()->isPost()){
            $post = input('post.');

            $rs = PointOrder::where('id', $post['id'])->update(['status' => $post['status'], 'update_time' => time()]);
            if($rs){
                return_ajax(200,'关闭成功');
            }else{
                return_ajax(400,'关闭失败！！');
            }
        }
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
                $res = Db::name('point_order')->where('id', $id)->update($post);
                if($res){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $data = Db::name('point_order')->where('id',$id)->find();
        return $this->fetch('',[
            'data'  => $data,
        ]);
    }



}