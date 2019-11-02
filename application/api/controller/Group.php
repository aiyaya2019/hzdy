<?php
namespace app\api\controller;
use think\Validate;
use \think\Cache;
class Group extends Common
{	
    /**拼团模块**/

    /**
     * [index 商品列表]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function index()
    {   
        $list = model('GroupGoods')->where(['is_show'=>1])->order('add_time desc,pay_num desc')->field('id,title,pic,price,old_price,pay_num')->page(input('page'),20)->select();

        return_ajax(200,'获取成功',$list);
    }

    /**
     * [info 商品详情]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function info()
    {
        $id = input('goods_id');
        if(!$id){ return_ajax(400,'缺少商品ID'); }

        $info = model('GroupGoods')->where('id',$id)->field('id,title,pic,images,price,old_price,fare_price,pay_num,desc,parameter,label_id')->find();

//        $info['desc'] = str_replace('src="/uploads','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['HTTP_HOST'].'/uploads/',$info['desc']);
//        $info['desc'] = str_replace('<img',"<img style='width:100%'",$info['desc']);
      
        $tabel = model('GoodsLabel')->where('id','IN',$info['label_id'])->column('title');
        $info['table'] = $tabel;
        $info['help'] = model('GoodsHelp')::value('desc');

        return_ajax(200,'获取成功',$info);
    }

    /**
     * [add_order 发起拼团]
     * @Author   PengJun
     * @DateTime 2019-07-13
     */
    public function add_order()
    {
        $post = input('post.');

        //自动验证
        $rule = [
            ['goods_id','require','缺少商品ID'],
            ['pay_type','require','请选择支付类型'],
            ['number','require','缺少商品数量'],
            ['name','require','缺少收货信息'],
            ['tel','require','缺少收货信息'],
            ['province','require','缺少收货信息'],
            ['city','require','缺少收货信息'],
            ['area','require','缺少收货信息'],
            ['address','require','缺少收货信息'],
        ];
        $validate = new Validate($rule);

        if(!$validate->check($post)){
            return_ajax(400,$validate->getError());
        } else {
            $goods = model('GroupGoods')::get($post['goods_id']);
            if(empty($goods)){ return_ajax(400,'商品不存在'); }

            $order_sn = order_sn('GroupOrder');

            if(empty($post['group_no'])){
                $group_no = date('YmdHi').rand_number();
                $is_main = 1;
                $goods_num = $goods['num'];
                $end_time = time() + (60*60*$goods['hour']) + (60*$goods['minute']);
            } else {
                $order = model('GroupOrder')::where(['group_no'=>$post['group_no'],'is_main'=>1])->find();
                $group_no = $post['group_no'];
                $is_main = 2;
                $goods_num = $order['goods_num'];
                $end_time = $order->getData('end_time');
            }

            $data = [
                'order_sn'    => $order_sn,
                'group_no'    => $group_no,
                'uid'         => $this->uid,
                'order_price' => $goods['price'] * $post['number'] + $goods['fare_price'],
                'pay_money'   => $goods['price'] * $post['number'] + $goods['fare_price'],
                'goods_id'    => $goods['id'],
                'goods_title' => $goods['title'],
                'goods_price' => $goods['price'],
                'goods_pic'   => $goods['pic'],
                'goods_num'   => $goods_num,
                'fare_price'  => $goods['fare_price'],
                'number'      => $post['number'],
                'name'        => $post['name'],
                'tel'         => $post['tel'],
                'province'    => $post['province'],
                'pay_type'    => $post['pay_type'],
                'city'        => $post['city'],
                'area'        => $post['area'],
                'form_id'        => $post['form_id'],
                'address'     => $post['address'],
                'remark'      => $post['remark'],
                'is_main'     => $is_main,
                'end_time'    => $end_time,
            ];
            $add = save('GroupOrder',$data,true);
            if($add){
                return_ajax(200,'下单成功',['order_id'=>$add,'price'=>$data['pay_money']]);
            } else {
                return_ajax(400,'下单失败，请稍后重试！');
            }
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
        if(!$id){ return_ajax(400,'缺少订单ID'); }

        $order = model('GroupOrder')::get($id);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] != 1){ return_ajax(400,'订单状态无法发起支付'); }
        if($order->getData('end_time') < time()){ return_ajax(400,'拼团已结束'); }

        $openid = model('User')->where('id',$this->uid)->value('openid');
        $url = 'https://'.$_SERVER['SERVER_NAME'].'/api/Weix/GroupCallback';
        $wexxin = controller('Weix');
        $res = $wexxin->wxpay('订单支付',$order['order_sn'],$order['pay_money'],$openid,$url,'GroupOrder');

        return_ajax(200,'获取成功',$res);
    }

    /**
     * [group_info 拼团详情]
     * @Author   PengJun
     * @DateTime 2019-07-14
     * @return   [type]     [description]
     */
    public function group_info()
    {
        $id = input('order_id');
        $group_no = input('group_no');
        if(!$id && !$group_no){ return_ajax(400,'缺少订单信息'); }

        if($id){
            $where['id'] = $id;
        } else {
            $where['group_no'] = $group_no;
        }
        $order = model('GroupOrder')::get($where);
        if(!$order){ return_ajax(400,'订单不存在'); }

        $num = model('GroupOrder')->where(['group_no'=>$order['group_no'],'pay_state'=>1])->field('id,uid')->order('is_main asc')->select();
        
        if($order['uid'] != $this->uid){
            $is_my = 1;
        } else {
            $is_my = 2;
        }
        //判断是否已经参团
        $join = model('GroupOrder')->where(['uid'=>$this->uid,'group_no'=>$order['group_no']])->find();

        $data['goods'] = [
            'id'                => $order['id'],
            'group_no'          => $order['group_no'],
            'goods_id'          => $order['goods_id'],
            'goods_title'       => $order['goods_title'],
            'goods_price'       => $order['goods_price'],
            'goods_pic'         => $order['goods_pic'],
            'goods_num'         => $order['goods_num'],
            'number'            => $order['number'],
            'status'            => $order['status'],
            'status_name'       => $order['status_name'],
            'fare_price'       => $order['fare_price'],
            'group_status'      => $order['group_status'],
            'group_status_name' => $order['group_status_name'],
            'end_time'          => $order->getData('end_time') - time(),
            'ren'               => $order['goods_num'] - count($num),
            'is_my'             => $is_my,
            'is_join'           => empty($join)?1:2,
        ];
        $user = [];
        foreach($num as $vo){
            $user[] = model('User')->where('id',$vo['uid'])->field('id,nickname,head_img,sex')->find();
        }
        $data['user'] = $user;

        return_ajax(200,'获取成功',$data);
    }

    /**
     * [reco  推荐商品]
     * @Author   PengJun
     * @DateTime 2019-07-14
     * @return   [type]     [description]
     */
    public function reco()
    {   
        $list = model('GroupGoods')->where(['is_show'=>1])->order('pay_num desc')->limit(4)->field('id,title,pic,price,old_price,pay_num')->select();

        return_ajax(200,'获取成功',$list);
    }

    /**
     * [order 订单列表]
     * @Author   PengJun
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function order()
    {   
        $type = input('type');
        
        //修改过期订单状态
        model('GroupOrder')->where(['uid'=>$this->uid,'end_time'=>['lt',time()],'group_status'=>1])->update(['group_status'=>3]);
        if(!empty($type)){
            $where['group_status'] = $type;
        }
        $where['uid'] = $this->uid;
        $list = model('GroupOrder')->where($where)->field('id,order_sn,group_no,order_price,pay_money,goods_id,goods_title,goods_price,goods_pic,goods_num,number,group_status,status,add_time')->order('add_time desc')->select();

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

        $info = model('GroupOrder')->where(['id'=>$id])->find();
        $uid = model('GroupOrder')->where(['group_no'=>$info['group_no'],'pay_state'=>1])->field('id,uid')->order('is_main asc')->select();
        $user = [];
        foreach($uid as $vo){
            $user[] = model('User')->where('id',$vo['uid'])->field('id,nickname,head_img,sex')->find();
        }
        $info['user'] = $user;
        $info['time'] = $info->getData('end_time') - time();

        $sale = model('GroupSale')->where(['order_id'=>$id])->find();
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

        $order = model('GroupOrder')::get($id);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] == 1){ return_ajax(400,'订单状态不可取消'); }

        $order->status = 6;
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

        $order = model('GroupOrder')::get($post['order_id']);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] == 1 || $order['group_status'] != 2){ return_ajax(400,'订单状态不可申请售后'); }
        if($order['status'] == 5){ return_ajax(400,'请勿重复申请'); }

        $post['order_sn'] = order_sn('GroupSale');
        $post['price'] = $order['pay_money'];
        if (!empty($post['money'])){
            if ($post['money'] > $post['price']){
                return_ajax(400,'申请的金额不能超过实付金额');
            }
        }
        $order->status = 5;
        if(save('GroupSale',$post,true) && $order->save()){
            return_ajax(200,'申请成功');
        } else {
            return_ajax(400,'申请失败，请稍后重试!');
        }
    }

    /**
     * [over_pay 余额支付]
     * @Author   PengJun
     * @DateTime 2019-07-15
     * @return   [type]     [description]
     */
    public function over_pay()
    {   
        $id = input('order_id');
        if(!$id){ return_ajax(400,'缺少订单ID'); }

        $order = model('GroupOrder')::get($id);
        if(!$order){ return_ajax(400,'订单不存在'); }
        if($order['status'] != 1){ return_ajax(400,'订单状态无法发起支付'); }
        if($order->getData('end_time') < time()){ return_ajax(400,'拼团已结束'); }

        $user = $this->getUser('money');
        if($user['money'] < $order['pay_money']){ return_ajax(400,'余额不足，请充值'); }
        
        $order->status = 2;
        $order->pay_state = 1;
        $order->pay_at = time();
        $order->pay_type = 2;
        if($order->save()){
            price(2,$this->uid,'-'.$order['pay_money'],'余额支付订单');
            //判断团人数是否足够
            $num = model('GroupOrder')->where(['group_no'=>$order['group_no'],'status'=>2,'pay_state'=>1])->count();
            if($num == $order['goods_num']){
                model('GroupOrder')->where(['group_no'=>$order['group_no'],'status'=>2,'pay_state'=>1])->update(['group_status'=>2]);
            }
            model('GroupGoods')->where(['id'=>$order['goods_id']])->setInc('pay_num');
            controller('Weix')->send($order['order_sn'],3,1);
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

        $order = model('GroupOrder')::get($post['order_id']);
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
