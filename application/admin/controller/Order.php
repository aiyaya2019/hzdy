<?php
/**
 * Created by PhpStorm.
 * User: vevay
 * Time: 2019/7/5 9:25
 */

namespace app\admin\controller;
use app\common\model\Logistics;
use app\api\controller\Weix;
use app\common\model\Order as OrderModel;
use app\common\model\OrderList;
use app\common\model\OrderRefund;
use app\common\model\User;
use think\Db;
/**
 * 订单管理
 * Class Order
 * @package app\admin\controller
 */
class Order extends Common
{
    /**
     * 订单列表
     * @author vevay
     * @time: 2019/7/5 9:59
     */
    public function index(){
        if(request()->isPost()){
            $post = input('post.');
            if(!empty($post['order_no'])){
                $post['where']['order_no|userphone|uid|username|logistics_no'] = ['like','%'.$post['order_no'].'%'];
            }

            if(!empty($post['user_keywords'])){
                $w_user = 'number like "%'.$post['user_keywords'].'%" or nickname like "%'.emojiEncode($post['user_keywords']).'%"';
                $uid    = User::where($w_user)->field('id')->select();
                if ($uid) {
                    $uid = array_column($uid, 'id', 'id');
                    $post['where']['uid'] = ['in', $uid];
                }
            }

            if(!empty($post['goods_title'])){
                $w['goods_title'] = ['like', '%'.$post['goods_title'].'%'];
                $oid = OrderList::where($w)->field('order_id')->group('order_id')->select();
                if ($oid) {
                    $oid = array_column($oid, 'order_id', 'order_id');
                    $post['where']['id'] = ['in', $oid];
                }
            }

            if(!empty($post['status'])){
                $post['where']['status'] = $post['status'];
            }

            if(!empty($post['start_time']) || !empty($post['end_time'])){
                // 时间筛选
                if ($post['start_time'] && $post['end_time']) {
                    $post['start_time'] = strtotime($post['start_time']);
                    $post['end_time']   = strtotime($post['end_time']);
                    $post['where']['add_time']   = ['between', [$post['start_time'], $post['end_time']]];
                }elseif ($post['start_time'] && !$post['end_time']) {
                    $post['start_time'] = strtotime($post['start_time']);
                    $post['where']['add_time']     = ['egt', $post['start_time']];
                }elseif (!$post['start_time'] && $post['end_time']) {
                    $post['end_time']   = strtotime($post['end_time']);
                    $post['where']['add_time']     = ['elt', $post['end_time']];
                }
            }


            $post['where']['is_deleted'] = 0;
            $list = $this->selectAll('order', $post);

            return_ajax(200, '获取成功', $list['list'], $list['count']);
        }
        return $this->fetch();
    }

    /**
     * 订单详情
     * @author vevay
     * @time: 2019/7/5 10:12
     */
    public function info(){
        $id = input('id');
        $data = OrderModel::with('goods')->where('id',$id)->find();

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
     * @time: 2019/7/5 10:15
     */
    // public function delivery(){
    //     $post = $this->request->get();
    //     $info = Logistics::get($post['logistics_id']);
    //     if(!$info){ return_ajax(400,'快递公司不存在'); }
    //     $order = OrderModel::get($post['id']);
    //     if (empty($order)) return_ajax(400,'订单查询异常，请稍候再试！');

    //     $post['logistics_state'] = 2;
    //     $post['logistics_name'] = $info['name'];
    //     $post['logistics_code'] = $info['code'];
    //     $post['logistics_time'] = time();
    //     $post['status'] = 3;
    //     if(OrderModel::where('id',$post['id'])->strict(false)->update($post)){
    //         return_ajax(200,'发货成功');
    //     } else {
    //         return_ajax(400,'发货失败，请稍后重试！');
    //     }
    // }

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
            $rs = save('order',$post);
            if ($rs) {
                $order = Order::where('id', $post['id'])->find();
                $rs_send = controller('Weix')->send($order['order_no'], '1', '2');
            }
        }
        $logistics = Logistics::where(['is_deleted'=>0,'status'=>1])->select();
        return $this->fetch('',['logistics'=>$logistics]);
    }


    /**
     * 评价管理
     * @author vevay
     * @time: 2019/7/5 18:34
     */
    public function evaluate(){
        if(request()->isPost()){
            $post = input('post.');
            if(!empty($post['goods_title'])){
                $post['where']['goods_title'] = ['like','%'.$post['goods_title'].'%'];
            }
            $post['where']['is_deleted'] = 0;
            $post['where']['is_reply'] = 0;
            // $post['with'] = 'user,order';
            $list = $this->selectAll('order_evaluate',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch();
    }

    /**
     * 回复
     */
    public function reply(){
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            $where['pid']      = $post['id'];
            $where['is_reply'] = '1';
            $check = Db::name('order_evaluate')->where($where)->find();
            // print_r($check);exit;

            if(empty($check)){
                $evaluate = Db::name('order_evaluate')->where('id', $post['id'])->find();
                //新增
                $array = [
                    'uid'         => $evaluate['uid'],
                    // 'head_img'    => $evaluate['head_img'],
                    'order_id'    => $evaluate['order_id'],
                    'goods_id'    => $evaluate['goods_id'],
                    'goods_title' => $evaluate['goods_title'],
                    'content'     => $post['content'],
                    'pid'         => $post['id'],
                    'is_reply'    => '1',
                    'add_time'    => time(),
                ];
                $res = Db::name('order_evaluate')->insert($array);
                if($res){
                    return_ajax(200,'添加成功');
                } else {
                    return_ajax(400,'添加失败,请稍后重试');
                }
            } else {
                //编辑
                $array = [
                    'content'     => $post['content'],
                    'update_time' => time(),
                ];
                $res = Db::name('order_evaluate')->where($where)->update($array);

                if($res){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $where['where']['is_deleted'] = 0;
        $where['where']['is_reply']   = 1;
        $where['where']['pid']        = $id;
        $data = $this->getFind('order_evaluate', $where);
        return $this->fetch('',[
            'data'  => $data,
        ]);
    }

    /**
     * 物流管理
     * @author vevay
     * @time: 2019/7/5 21:28
     */
    public function logistics(){
        if(request()->isPost()){
            $post = input('post.');
            $post['where']['is_deleted'] = 0;
            $list = $this->selectAll('logistics',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch();
    }


    public function logistics_save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $logistics = new Logistics();
            //封面上传
            if(request()->file('icon')){
                $file = imgUpdate('icon');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['icon'] = $file['data'];
            }

            $post['update_time'] = time();
            if(empty($post['id'])){
                //新增
                if($logistics->allowField(true)->save($post)){
                    return_ajax(200,'添加成功');
                } else {
                    return_ajax(400,'添加失败,请稍后重试');
                }
            } else {
                //编辑
                if($logistics->allowField(true)->save($post,['id'=>$post['id']])){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $data = Logistics::get($id);
        return $this->fetch('',[
            'data'  => $data,
        ]);
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
                $res = Db::name('order')->where('id', $id)->update($post);
                if($res){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $data = Db::name('order')->where('id',$id)->find();
        return $this->fetch('',[
            'data'  => $data,
        ]);
    }

    //手动退款
    public function refunds()
    {
        $id = input('id');

        $refund = OrderRefund::where('order_id', $id)->find();
        $order  = OrderModel::where('id', $id)->find();

        if (!$refund) {
            $refund_no = order_no('order_no', 'order_refund');

            $arr = [
                'order_id'  => $order['id'],
                'order_no'  => $order['order_no'],
                'refund_no' => $refund_no,
                'price'     => $order['pay_money'],
                'reason'    => '后台主动退款',
                'explain'   => '后台主动退款',
                'add_time'  => time(),
                'update_time' => time(),
                'refund_money' => $order['pay_money'],
                'pay_type'     => $order['pay_type'] == '1' ? '1' : '2',
            ];

            $refund_id = OrderRefund::insertGetId($arr);

            if ($order['pay_type'] == '1') {//微信支付
                $weix = new Weix;
                $res =  $weix->refund($order['order_no'], $arr['refund_money']);
                if ($res['return_code'] == 'SUCCESS'){
                    OrderModel::where('id',$id)->setField('status',7);
                    OrderRefund::where('id', $refund_id)->setField('is_refund', 2);
                    return_ajax(200,'退款成功');
                }else{
                    return_ajax(400,'系统繁忙');
                }
            }else{
                Db::startTrans();// 启动事务
                $rs_order  = OrderModel::where('id', $id)->setField('status', 7);
                $rs_user   = User::where('id', $order['uid'])->setInc('money', $arr['refund_money']);
                $rs_refund = OrderRefund::where('id', $refund_id)->setField('is_refund', 2);
                if (($rs_order && $rs_user) && $rs_refund) {
                    Db::commit();// 提交事务
                    return_ajax(200,'退款成功');
                }else{
                    Db::rollback();// 回滚事务
                    return_ajax(400,'系统繁忙');
                }
            }
            # code...
        }else{
            // 
            if ($refund['pay_type'] == '1') {//微信支付
                $weix = new Weix;
                $res =  $weix->refund($refund['order_no'], $refund['refund_money']);
                if ($res['return_code'] == 'SUCCESS'){
                    OrderModel::where('id',$id)->setField('status',7);
                    OrderRefund::where('id', $refund['id'])->setField('is_refund', 2);
                    return_ajax(200,'退款成功');
                }else{
                    return_ajax(400,'系统繁忙');
                }
            }else{
                Db::startTrans();// 启动事务
                $rs_order  = OrderModel::where('id', $id)->setField('status', 7);
                $rs_user   = User::where('id', $order['uid'])->setInc('money', $refund['refund_money']);
                $rs_refund = OrderRefund::where('id', $refund['id'])->setField('is_refund', 2);
                if (($rs_order && $rs_user) && $rs_refund) {
                    Db::commit();// 提交事务
                    return_ajax(200,'退款成功');
                }else{
                    Db::rollback();// 回滚事务
                    return_ajax(400,'系统繁忙');
                }
            }
            // 
        }


    }



    /**
     * 导出订单
     */
    public function order_excel(){
        ini_set('memory_limit','3072M');
        set_time_limit(0);

        $post = input('post.');
        $where = '';

        if (!empty($post['start_time']) && !empty($post['end_time'])){
            $start_time = strtotime($post['start_time']);
            $end_time = strtotime($post['end_time']);
            $where = 'add_time >= '.$start_time.' and add_time <= '.$end_time.'';
        }

        $order = OrderModel::order('id desc')->where($where)->select();

        $head = ['编号','订单编号','应付','实付','收货人','手机号','收货地址','订单状态','下单时间'];
        $data = [];
        foreach($order as $key=>$vo){
            $data[] = [
                $vo['id'],
                $vo['order_no'],
                $vo['order_price'],
                $vo['pay_money'],
                $vo['username'],
                $vo['userphone'],
                $vo['address'],
                $vo['status_name'],
                $vo['add_time'],
            ];
        }

        excelExport('订单信息',$head,$data);

    }



    /**
     * 退款记录列表
     */
    public function refundList(){
        if(request()->isPost()){
            $post = input('post.');
            if(isset($post['is_refund']) && $post['is_refund'] != 10){
                $post['where']['is_refund'] = $post['is_refund'];
            }
            if(!empty($post['refund_no'])){
                $post['where']['refund_no'] = ['like','%'.$post['refund_no'].'%'];
            }
            $post['with'] = 'order';
            $list = $this->selectAll('order_refund',$post);
            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch();
    }

    //退款详情
    public function refund_info()
    {

            $id = input('id');
            $data = OrderRefund::with('order')->where('id',$id)->find();

            return $this->fetch('', ['data'=>$data]);

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
        $refund = $this->getFind('order_refund',$data);

        if($post['is_refund'] == 2){
            if($refund['pay_type'] == 1){
                //微信支付
                // $res = controller('api/Weix')->refund($refund['order_no'],$refund['refund_money']);
                // if ($res['result_code'] != 'SUCCESS') {
                //     return_ajax(400,$res['err_code_des']);
                // }else{
                //     LimitOrder::where('id',$refund['id'])->update(['status'=>6,'update_time'=>time()]);
                //     LimitOrderRefund::where('id',$post['id'])->setField('status',1);
                //     return_ajax(200,'退款成功');
                // }

                $weix = new Weix;
                $res  =  $weix->refund($refund['order_no'], $refund['refund_money']);
                if ($res['return_code'] == 'SUCCESS'){
                    OrderModel::where('id', $refund['order_id'])->setField('status', 7);
                    OrderRefund::where('id', $post['id'])->setField('is_refund', 2);

                    return_ajax(200,'退款成功');
                }else{
                    return_ajax(400,'系统繁忙');
                }


            }else{
                // 余额支付
                Db::startTrans();// 启动事务
                $rs_order  = OrderModel::where('id', $refund['order_id'])->setField('status', 7);
                $rs_user   = User::where('id', $refund['uid'])->setInc('money', $refund['refund_money']);
                $rs_refund = OrderRefund::where('id', $post['id'])->setField('is_refund', 2);
                if (($rs_order && $rs_user) && $rs_refund) {
                    Db::commit();// 提交事务
                    return_ajax(200,'退款成功');
                }else{
                    Db::rollback();// 回滚事务
                    return_ajax(400,'系统繁忙');
                }
            }
        }else{
            // 拒绝退款
            $rs_order = OrderModel::where('id', $post['order_id'])->update(['status'=>8,'update_time'=>time()]);
            // 更新退款记录
            $rs_refund = OrderRefund::where('id', $post['id'])->update(['is_refund'=>3]);
            if($rs_order && $rs_refund){
                return_ajax(200,'拒绝退款成功');
            }else{
                return_ajax(400,'拒绝退款操作失败！！');
            }
        }
    }

    /**
     * 关闭订单
     */
    public function closeOrder(){
        if(request()->isPost()){
            $post = input('post.');

            $rs = OrderModel::where('id', $post['id'])->update(['status' => $post['status'], 'update_time' => time()]);
            if($rs){
                return_ajax(200,'关闭成功');
            }else{
                return_ajax(400,'关闭失败！！');
            }
        }
    }


}