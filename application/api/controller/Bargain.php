<?php
namespace app\api\controller;
use think\Validate;
use \think\Cache;
class Bargain extends Common
{	
    /**砍价模块**/

    /**
     * [index 商品列表]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function index()
    {   
        $list = model('BargainGoods')->order('add_time desc,pay_num desc')->field('id,title,pic,price,old_price,pay_num,min_price')->page(input('page'),20)->select();
        foreach($list as $key=>$vo){
            $order = model('BargainOrder')->where(['uid'=>$this->uid,'bargain_status'=>1,'end_time'=>['gt',time()],'goods_id'=>$vo['id']])->find();
            if($order){
                $list[$key]['is_order'] = 2;
                $list[$key]['order_id'] = $order['id'];
            }else {
                $list[$key]['is_order'] = 1;
                $list[$key]['order_id'] = 0;
            }
        }
        return_ajax(200,'获取成功',$list);
    }

    /**
     * [add_order 发起砍价]
     * @Author   PengJun
     * @DateTime 2019-07-13
     */
    public function add_order()
    {
        $post = input('post.');

        //自动验证
        $rule = [
            ['goods_id','require','缺少商品ID'],
            ['name','require','缺少收货信息'],
            ['tel','require','缺少收货信息'],
            ['province','require','缺少收货信息'],
            ['city','require','缺少收货信息'],
            ['area','require','缺少收货信息'],
            ['address','require','缺少收货信息'],
            ['form_id','require','缺少form_id'],
        ];
        $validate = new Validate($rule);

        if(!$validate->check($post)){
            return_ajax(400,$validate->getError());
        } else {
            $goods = model('BargainGoods')::get($post['goods_id']);
            if(empty($goods)){ return_ajax(400,'商品不存在'); }

            $order_sn = order_sn('BargainOrder');
            $data = [
                'order_sn'    => $order_sn,
                'uid'         => $this->uid,
                'order_price' => $goods['price'],
                'pay_money'   => $goods['price'],
                'min_price'   => $goods['min_price'],
                'goods_id'    => $goods['id'],
                'goods_title' => $goods['title'],
                'goods_price' => $goods['price'],
                'goods_pic'   => $goods['pic'],
                'min_money'   => $goods['min_money'],
                'max_money'   => $goods['max_money'],
                'name'        => $post['name'],
                'tel'         => $post['tel'],
                'province'    => $post['province'],
                'city'        => $post['city'],
                'area'        => $post['area'],
                'form_id'        => $post['form_id'],
                'address'     => $post['address'],
                'end_time'    => time() + (60*60*$goods['hour']) + (60*$goods['minute']),
            ];

            $add = save('BargainOrder',$data,true);
            if($add){
                return_ajax(200,'操作成功',['order_id'=>$add,'price'=>$goods['price']]);
            } else {
                return_ajax(400,'操作失败，请稍后重试！');
            }
        }
    }

    /**
     * [info 砍价详情]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function info()
    {
        $id = input('goods_id');
        $oid = input('order_id');
        if(!$id && !$oid){ return_ajax(400,'缺少参数'); }

        if($oid){
            $where['id'] = $oid;
        } else {
            $where['uid'] = $this->uid;
            $where['goods_id'] = $id;
            $where['bargain_status'] = 1;
        }

        $list = model('BargainOrder')->where($where)->field('id,uid,goods_title,goods_pic,goods_price,bargain_price,min_price,status,add_time,bargain_status,end_time')->find();
        if(!$list){ return_ajax(400,'无砍价信息'); }

        if($list->getData('end_time') < time() && $list['bargain_status'] == 1){
            model('BargainOrder')->where('id',$list['id'])->update(['bargain_status'=>3]);
            $list['bargain_status'] = 3;
        }

        if($list['uid'] != $this->uid){
            $data['is_my'] = 1;
        } else {
            $data['is_my'] = 2;
        }
        //助力记录
        $help = model('BargainHelp')->with('user')->where(['order_id'=>$list['id']])->order('add_time desc')->select();
        $data['goods'] = $list;
        $data['help'] = $help;
        $data['order_id'] = $list['id'];
        $data['time'] = $list->getData('end_time') - time();
        $data['user'] = $this->getUser('nickname,head_img,sex');
        //判断是否已经砍过
        $help = model('BargainHelp')->where(['uid'=>$this->uid,'order_id'=>$oid])->find();
        $data['is_help'] = empty($help)?1:2;
        $data['rule'] = model('Config')->value('bargain_desc');

        return_ajax(200,'获取成功',$data);
    }

    /**
     * [help 砍价]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function help()
    {
        $id = input('order_id');
        if(!$id){ return_ajax(400,'缺少订单ID'); }
        $table = model('BargainHelp');

        $order = model('BargainOrder')::get($id);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] != 1 || $order['bargain_status'] != 1 || $order->getData('end_time') < time()){ return_ajax(400,'砍价已结束'); }

        $help = model('BargainHelp')->where(['uid'=>$this->uid,'order_id'=>$id])->find();
        if($help){ return_ajax(400,'您已经砍过价了，分享给好友帮忙吧！'); }

        $price = randomFloat($order['min_money'],$order['max_money']);
        $spread = $order['pay_money'] - $order['min_price'];
        if($price > $spread){ 
            $price = $spread;
            $order->bargain_status = 2;
        }

        //查询距离砍价次数 还差多少次
        $order->update_time = time();
        $order->pay_money = $order['pay_money'] - $price;
        $order->bargain_price = $order['bargain_price'] + $price;
        $order->bargain_num = $order['bargain_num'] + 1;

        $data = [
            'uid'      => $this->uid,
            'order_id' => $order['id'],
            'price'    => $price,
        ];
        if($table->save($data) && $order->save()){
            return_ajax(200,'砍价成功',$price);
        } else {
            return_ajax(400,'砍价失败，请稍后重试');
        }
    }  

    /**
     * [order 订单列表]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function order()
    {   
        //修改过期订单状态
        model('BargainOrder')->where(['uid'=>$this->uid,'end_time'=>['lt',time()],'bargain_status'=>1])->update(['bargain_status'=>3]);
        $type = input('type');
        if(!empty($type)){
            $where['bargain_status'] = $type;
        }
        $where['uid'] = $this->uid;
        $list = model('BargainOrder')->where($where)->field('id,order_sn,order_price,pay_money,goods_id,goods_title,goods_price,goods_pic,bargain_status,status,add_time')->order('add_time desc')->select();

        return_ajax(200,'获取成功',$list);
    }

    /**
     * [order_info 订单详情]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function order_info()
    {
        $id = input('order_id');
        if(!$id){ return_ajax(400,'缺少订单ID'); }

        $info = model('BargainOrder')->where(['id'=>$id])->find();
        $sale = model('BargainSale')->where(['order_id'=>$id])->find();
        $info['sale'] = $sale;

        return_ajax(200,'获取成功',$info);
    }

    /**
     * [cancel 取消订单]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function cancel()
    {
        $id = input('order_id');
        if(!$id){ return_ajax(400,'缺少订单ID'); }

        $order = model('BargainOrder')::get($id);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] == 1){ return_ajax(400,'订单状态不可取消'); }

        $order->status = 8;
        if($order->save()){
            return_ajax(200,'订单取消成功');
        } else {
            return_ajax(400,'订单取消失败，请稍后重试！');
        }
    }

    /**
     * [retu 申请售后]
     * @Author   PengJun
     * @DateTime 2019-07-15
     * @return   [type]     [description]
     */
    public function after_sale()
    {
        $post = input('post.');
        if(empty($post['order_id'])){ return_ajax(400,'缺少订单ID'); }
        if(empty($post['type'])){ return_ajax(400,'缺少退款类型'); }

        $order = model('BargainOrder')::get($post['order_id']);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] == 1 || $order['bargain_status'] != 2){ return_ajax(400,'订单状态不可申请售后'); }
        if($order['status'] == 5){ return_ajax(400,'请勿重复申请'); }

        $post['order_sn'] = order_sn('BargainSale');
        $post['price'] = $order['pay_money'];
        if (!empty($post['money'])){
            if ($post['money'] > $post['price']){
                return_ajax(400,'申请的金额不能超过实付金额');
            }
        }
        $order->status = 5;
        if(save('BargainSale',$post,true) && $order->save()){
            return_ajax(200,'申请成功');
        } else {
            return_ajax(400,'申请失败，请稍后重试!');
        }
    }

    /**
     * [pay 获取支付信息]
     * @Author   PengJun
     * @DateTime 2019-07-14
     * @return   [type]     [description]
     */
    public function pay()
    {   
        $post = input('post.');
        $id = input('order_id');
        $type = input('type');
        if(!$id){ return_ajax(400,'缺少订单ID'); }
        if (!empty($type)){
            model('BargainOrder')->where(['id'=>$id])->setField('bargain_status',4);
        }
        $order = model('BargainOrder')::get($id);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['bargain_status'] == 3){ return_ajax(400,'订单状态不可支付'); }

        $openid = model('User')->where('id',$this->uid)->value('openid');
        $url = 'https://'.$_SERVER['SERVER_NAME'].'/api/Weix/BargainCallback';
        $wexxin = controller('Weix');
        $res = $wexxin->wxpay('订单支付',$order['order_sn'],$order['pay_money'],$openid,$url,'BargainOrder');

        return_ajax(200,'获取成功',$res);
    }

    /**
     * [over_pay 余额支付]
     * @Author   PengJun
     * @DateTime 2019-07-15
     * @return   [type]     [description]
     */
    public function over_pay()
    {
        $post = input('post.');
        if(empty($post['order_id'])){ return_ajax(400,'缺少订单ID'); }

        $order = model('BargainOrder')::get($post['order_id']);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['bargain_status'] != 2 || $order['status'] != 1){ return_ajax(400,'订单状态不可支付'); }

        $user = $this->getUser('money');
        if($user['money'] < $order['pay_money']){ return_ajax(400,'余额不足，请充值'); }

        $order->pay_type = 2;
        $order->pay_state = 1;
        $order->pay_at = time();
        $order->status = 2;
        if($order->save()){
            price(2,$this->uid,'-'.$order['pay_money'],'余额支付订单');
            model('BargainGoods')->where(['id'=>$order['goods_id']])->setInc('pay_num');
            controller('Weix')->send($order['order_sn'],2,1);
            return_ajax(200,'支付成功');
        } else {
            return_ajax(400,'支付失败，请稍后重试！');
        }
    }

    /**
     * [receipt 确认收货]
     * @Author   PengJun
     * @DateTime 2019-07-15
     * @return   [type]     [description]
     */
    public function receipt()
    {
        $post = input('post.');
        if(empty($post['order_id'])){ return_ajax(400,'缺少订单ID'); }

        $order = model('BargainOrder')::get($post['order_id']);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] != 3){ return_ajax(400,'订单状态无法收货'); }

        $order->status = 4;
        $order->receipt_time = time();
        if($order->save()){
            return_ajax(200,'确认收货成功');
        } else {
            return_ajax(400,'确认收货失败');
        }
    }
}
