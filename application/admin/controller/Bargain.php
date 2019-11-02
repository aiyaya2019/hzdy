<?php
namespace app\admin\controller;

use app\common\model\BargainOrder;
use app\common\model\BargainSale;
use app\common\model\Logistics;
use app\common\model\User;
use think\Db;

Class Bargain extends Common{

	/**
	 * [index 商品列表]
	 * @Author   PengJun
	 * @DateTime 2019-05-09
	 * @return   [type]     [description]
	 */
	public function index()
	{
		if(request()->isPost()){
			$post = input('post.');

			//商品名称搜索
            if(!empty($post['title'])){
                $post['where']['title'] = ['like','%'.$post['title'].'%'];
            }

			$list = $this->selectAll('bargain_goods',$post);

			return_ajax(200,'获取成功',$list['list'],$list['count']);
		}
		return $this->fetch();
	}

	/**
	 * [save 添加/编辑砍价商品]
	 * @Author   PengJun
	 * @DateTime 2019-05-08
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

			$this->saves('bargain_goods',$post);
		}

		$goods = $this->getFind('bargain_goods',$id);

		return $this->fetch('',[
			'goods' => $goods,
		]);
	}

	/**
	 * [order 砍价订单]
	 * @Author   PengJun
	 * @DateTime 2019-05-09
	 * @return   [type]     [description]
	 */
	public function order()
	{
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

			$list = $this->selectAll('bargain_order',$post);

			return_ajax(200,'获取成功',$list['list'],$list['count']);
		}
		return $this->fetch();
	}


    //退款详情
    public function refund_info()
    {

        $id = input('id');
        $data = BargainSale::with('order')->where('id',$id)->find();

        return $this->fetch('',['data'=>$data]);

    }

	/**
	 * [help 砍价记录]
	 * @Author   PengJun
	 * @DateTime 2019-05-09
	 * @return   [type]     [description]
	 */
	public function help()
	{
		if(request()->isPost()){
			$post = input('post.');

			$post['with'] = 'user';
			$post['where']['order_id'] = $post['id'];
			$list = $this->selectAll('bargain_help',$post);

			return_ajax(200,'获取成功',$list['list'],$list['count']);
		}

		return $this->fetch();
	}

	/**
	 * [rule 砍价规则说明]
	 * @Author   PengJun
	 * @DateTime 2019-05-10
	 * @return   [type]     [description]
	 */
	public function rule()
	{
		if(request()->isPost()){
            $post = input('post.');
            $this->saves('config',$post);
        }

        $list = $this->getFind('config');

        return $this->fetch('',[
            'list' => $list
        ]);
	}

    /**
     * @return 砍价订单详情
     * @author vevay
     * @time: 2019/7/4 9:07
     */
	public function info(){
        $id = input('id');
        $data = BargainOrder::get($id);
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
            save('bargain_order',$post);
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
            $list = $this->selectAll('bargain_sale',$post);
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
        $order = $this->getFind('bargain_sale',$data);
        $pay_type = BargainOrder::where('id',$order['order_id'])->value('pay_type');
        if ($order['money'] == 0){
            $money = $order['price'];
        }else{
            $money = $order['money'];
        }
        if($post['status'] == 1){
            if($pay_type == 1){
                //微信支付
                $order_sn = BargainOrder::where('id',$order['order_id'])->value('order_sn');
                $res = controller('api/Weix')->refund($order_sn,$money);
                if ($res['result_code'] != 'SUCCESS') {
                    return_ajax(400,$res['err_code_des']);
                }else{
                    BargainOrder::where('id',$order['order_id'])->update(['status'=>6,'update_time'=>time()]);
                    BargainSale::where('id',$post['id'])->setField('status',1);
                    return_ajax(200,'退款成功');
                }
            }else{
                // 余额支付
                $rs1 = price(1,$order['uid'],$money,'砍价订单退款');
                $rs2 = BargainOrder::where('id',$order['order_id'])->update(['status'=>6,'update_time'=>time()]);
                $rs3 = BargainSale::where('id',$post['id'])->update(['status'=>1]);
                if($rs1 && $rs2 && $rs3){
                    return_ajax(200,'退款成功');
                }else{
                    return_ajax(400,'退款操作失败！！');
                }
            }
        }else{
            // 拒绝退款
            $rs1 = BargainOrder::where('id',$post['order_id'])->update(['status'=>7,'update_time'=>time()]);
            // 更新退款记录
            $rs2 = BargainSale::where('id',$post['id'])->update(['status'=>2]);
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

        $order = BargainOrder::order('id desc')->where($where)->select();

        $head = ['编号','订单编号','应付','实付','次数','金额','截止时间','收货人','手机号','收货地址','砍价状态','订单状态','下单时间'];
        $data = [];
        foreach($order as $key=>$vo){
            $data[] = [
                $vo['id'],
                $vo['order_sn'],
                $vo['order_price'],
                $vo['pay_money'],
                $vo['bargain_num'],
                $vo['bargain_price'],
                $vo['end_time'],
                $vo['name'],
                $vo['tel'],
                $vo['address'],
                $vo['bargain_status_name'],
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
                $res = Db::name('bargain_order')->where('id', $id)->update($post);
                if($res){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $data = Db::name('bargain_order')->where('id',$id)->find();
        return $this->fetch('',[
            'data'  => $data,
        ]);
    }

    public function closeOrder(){
        if(request()->isPost()){
            $post = input('post.');
            if ($post['type'] == 1){
                //确认付款
                $rs = BargainOrder::where('id', $post['id'])->update(['status' => 2, 'bargain_status'=>4, 'update_time' => time()]);
            }else{
                //关闭订单
                $rs = BargainOrder::where('id', $post['id'])->update(['status' => 8, 'update_time' => time()]);
            }

            if($rs){
                return_ajax(200,'操作成功');
            }else{
                return_ajax(400,'网络繁忙！！');
            }
        }
    }
  
  
}