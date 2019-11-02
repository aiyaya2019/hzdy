<?php
namespace app\api\controller;
use app\common\model\LimitTime;
use app\common\model\LimitGoods;
use app\common\model\LimitOrder;
use app\common\model\User;
use app\common\model\Order;
use app\common\model\UserGrade;
use app\common\model\LimitOrderRefund;
use \think\Cache;

class Limit extends Common
{

    /**
     * [index 限时打折]
     * @Author   谜一样的男人
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function index()
    {
        if(request()->isPost()){

            $post = input('post.');

            $time = time();
            $time_id = LimitTime::where(''.$time.' < end_time')->value('id');

            if ($time_id){

                $post['field'] = 'id,title,pic,price,old_price,add_time,time_id,discount';
                $post['with'] = 'time';
                $post['count'] = 10;
                $post['where'] = 'time_id = '.$time_id.'';
                $list = $this->selectAll('limit_goods',$post);
            }else{
                return_ajax(400,'暂无活动');
            }

            if ($list){
                return_ajax(200,'获取成功',$list);
            }else{
                return_ajax(400,'暂无数据');
            }

        }
    }

    /**
     * [details 限时打折详情]
     * @Author   谜一样的男人
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function details()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }

            $post['where']['id'] = $post['id'];
            $post['with'] = 'time';

            $list = $this->getFind('limit_goods',$post);
            $list['desc'] = str_replace('src="/uploads','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['HTTP_HOST'].'/uploads/',$list['desc']);
            $list['desc'] = str_replace('<img',"<img style='width:100%'",$list['desc']);
            $list['parameter'] = str_replace('src="/uploads','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['HTTP_HOST'].'/uploads/',$list['parameter']);
            $list['parameter'] = str_replace('<img',"<img style='width:100%'",$list['parameter']);
            if (count($list['label_id']) > 0){
                $label_id = implode(',',$list['label_id']);
                $arr['where'] = 'id in('.$label_id.')';
                $arr['field'] = 'id,title,desc';
                $list['label'] = $this->selectAll('goods_label',$arr);
            }

            //获取咨询与售后
            $list['help'] = $this->getFind('goods_help');

            return_ajax(200,'获取成功',$list);
        }
    }

    /**
     * [addOrder 下单]
     * @Author   谜一样的男人
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function addorder()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少商品id'); }
            if (empty($post['pay_type'])) { return_ajax(400,'缺少必传参数pay_type'); }

            //查询库存是否充足
            $stock = LimitGoods::where('id',$post['id'])->value('stock');

            if ($stock == 0){
                return_ajax(400,'库存不足');
            }

            if ($post['pay_type'] == 1){
                //获取
                $post['field'] = 'id,title,pic,price,old_price,fare_price,discount';
                $post['where']['id'] = $post['id'];
                $list = $this->getFind('limit_goods',$post);
                return_ajax(200,'获取成功',$list);
            }else{
                //添加
                if (empty($post['goods_pic'])) { return_ajax(400,'缺少必传参数goods_pic'); }
                if (empty($post['fare_price'])) { return_ajax(400,'缺少必传参数fare_price'); }
                if (empty($post['goods_title'])) { return_ajax(400,'缺少必传参数goods_title'); }
                if (empty($post['goods_price'])) { return_ajax(400,'缺少必传参数goods_price'); }
                if (empty($post['name'])) { return_ajax(400,'请输入收货人姓名'); }
                if (empty($post['type'])) { return_ajax(400,'请选择支付类型'); }
                if (empty($post['tel'])) { return_ajax(400,'请输入电话'); }
                if (empty($post['address'])) { return_ajax(400,'请输入详细地址'); }
                $post['order_sn'] = order_sn('limit_order');
                $post['uid'] = $this->uid;
                $post['order_price'] = $post['goods_price'];

                $post['pay_money'] = sprintf('%.2f',$post['goods_price'] * ($post['discount'] / 10)+ $post['fare_price']);
                $post['goods_id'] = $post['id'];
                unset($post['id']);
                $res = save('limit_order',$post,true);
                if ($res){
                    $arr['order_sn'] = $post['order_sn'];
                    $arr['id'] = $res;
                    return_ajax(200,'下单成功',$arr);
                }else{
                    return_ajax(400,'下单失败');
                }
            }
        }
    }

    //获取支付信息
    public function spikepay()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['order_sn'])) { return_ajax(400,'缺少必传参数order_sn'); }
            $openid = User::where('id',$this->uid)->value('openid');
            $url = 'https://hzdy.kailly.com/api/Weix/limit_callback';
            $wexxin = controller('Weix');
            $res = $wexxin->wxpay('订单支付',$post['order_sn'],0.01,$openid,$url,'limit_order');
            return_ajax(200,'获取成功',$res);
        }
    }

    //余额支付
    public function money()
    {
        if(request()->isPost()) {
            $post = input('post.');
            if (empty($post['order_sn'])) { return_ajax(400,'缺少必传参数order_sn'); }
            if (empty($post['money'])) { return_ajax(400,'缺少必传参数money'); }
            $money = User::where('id',$this->uid)->value('money');
            if ($post['money'] > $money){
                return_ajax(400,'余额不足');
            }else{
                //查询订单信息
                $order = LimitOrder::get(['order_sn'=>$post['order_sn']]);

                if($order['status'] == 1){
                    //修改订单状态 给商品减库存
                    $order->status = 2;
                    $order->pay_no = $post['order_sn'];
                    $order->pay_at = time();
                    $order->pay_price = $post['money'];
                    if($order->save()){
                        //查询订单商品
                        $spike = LimitGoods::get(['id'=>$order['goods_id']]);
                        LimitGoods::where('id',$spike['id'])->setDec('stock',1);
                        //写入余额变化表
                        price(2,$this->uid,'-'.$post['money'],'订单支付');
                        controller('Weix')->send($order['order_sn'],5,1);
                        return_ajax(200,'支付成功');
                    }
                }
            }
        }
    }

    //获取订单信息
    public function getorder()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (!empty($post['status'])){
                $where = 'status = '.$post['status'].'';
            }else{
                $where = '';
            }
            $data = LimitOrder::field('id,order_sn,goods_title,goods_pic,goods_price,status,add_time,type,fare_price,discount')->order('id desc')->where('uid',$this->uid)->where($where)->select();
            if ($data){
                return_ajax(200,'获取成功',$data);
            }else{
                return_ajax(400,'暂无订单');
            }
        }
    }

    //删除订单
    public function delete_order()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }
            $res = LimitOrder::where(['id'=>$post['id'],'uid'=>$this->uid])->delete();
            if ($res){
                return_ajax(200,'删除成功');
            }else{
                return_ajax(400,'删除失败');
            }
        }
    }

    //订单详情
    public function order_detail()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }
            $res = LimitOrder::where('id',$post['id'])->find();
            if ($res){
                return_ajax(200,'获取成功',$res);
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    //确认收货
    public function confirm_order()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }
            $res = LimitOrder::where(['id'=>$post['id'],'uid'=>$this->uid])->setField('status',4);
            if ($res){

//                $data['where'] = 'id = '.$this->uid.'';
//                $user = $this->getFind('user',$data);
//                //查出下一个等级需要的金额
//                $id = $user['grade_id']+1;
//                $price = Order::where('uid',$this->uid)->sum('pay_money');
//                $money = UserGrade::where('id',$id)->value('full_price');
//                if ($price > $money){
//                    User::where('id',$this->uid)->setField('grade_id',$id);
//                }
                return_ajax(200,'操作成功');
            }else{
                return_ajax(400,'操作失败');
            }
        }
    }

    //申请售后
    public function order_after()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['order_id'])) { return_ajax(400,'缺少必传参数order_id'); }
            if (empty($post['goods_title'])) { return_ajax(400,'缺少必传参数goods_title'); }
            if (empty($post['goods_pic'])) { return_ajax(400,'缺少必传参数goods_pic'); }
            if (empty($post['goods_price'])) { return_ajax(400,'缺少必传参数goods_price'); }
            if (empty($post['order_sn'])) { return_ajax(400,'缺少必传参数order_sn'); }
            if (empty($post['discount'])) { return_ajax(400,'缺少必传参数discount'); }
            if (empty($post['type'])) { return_ajax(400,'缺少必传参数type'); }
            if (!empty($post['money'])){
                if ($post['money'] > $post['goods_price']){
                    return_ajax(400,'申请的金额不能超过实付金额');
                }
            }
            $post['uid'] = $this->uid;

            $res = save('limit_order_refund',$post,true);
            if ($res){
                LimitOrder::where('id',$post['order_id'])->setField('status',5);
                return_ajax(200,'申请成功');
            }else{
                return_ajax(400,'申请失败');
            }
        }
    }
}
