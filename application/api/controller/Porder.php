<?php
namespace app\api\controller;

use think\Db;
use think\Session;
use \think\Cache;

use app\common\model\GoodsCount;

/**
 * 普通订单控制器
 */
class Porder extends Common{

	/**
	 * 获取要下单的商品
	 */
	public function getPayGoods(){
        $post = input('post.');
        $uid  = $this->uid;
        $order_price = '0';//订单总金额(应付金额)
        $goods_point = '0';//商品可用总积分

        if (!$uid) {
            return_ajax(400, '缺少uid');
        }

        if ($post['is_car'] == '1') {//从购物车下单
            if (!$post['id']) {
                return_ajax(400, '缺少id');//购物车id 或 商品id
            }

        	$car = Db::name('car')->where('id', 'in', $post['id'])->where('checked', '1')->select();
            if (empty($car)) {
                return_ajax(400, '购物车商品获取失败');
            }
            $data = [];
            $gids = [];
            foreach ($car as $key => $value) {

                $w['goods_id']  = $value['goods_id'];
                $w['attr_spec'] = $value['attr'];
                $check_stock = Db::name('goods_val')->where($w)->value('stock');
                if ($check_stock < $value['num']) {
                    return_ajax(400, '库存不足');
                }

                $data[$key]['id']          = $value['goods_id'];//商品id
                $data[$key]['goods_title'] = $value['goods_title'];//商品标题
                $data[$key]['goods_price'] = $value['goods_price'];//商品价格
                $data[$key]['goods_pic']   = $value['goods_pic'];//商品图片
                $data[$key]['goods_attr']  = json_decode($value['goods_attr'], '1');//商品规格
                $data[$key]['number']      = $value['num'];//购买数量
                $order_price = $order_price + $value['goods_price'] * $value['num'];

                $gids[] = $value['goods_id'];
            }
            if (!empty($gids)) {
                $goods = Db::name('goods')->where('id', 'in', $gids)->select();
                if ($goods) {
                    foreach ($goods as $key => $value) {
                        $goods_point = $goods_point + $value['point'];

                        // foreach ($data as $k => $val) {
                        //     // 判断限购
                        //     if ($val['number'] > $value['quota']) {
                        //         return_ajax(400, '该商品限购' .$value['quota'] .'份');
                        //     }
                        // }
                    }
                }
            }

        }else{//直接下单
            if ($post['goods_id'] == null) {
                return_ajax(400, '缺少goods_id');//商品id
            }
            if ($post['goods_title'] == null) {
                return_ajax(400, '缺少goods_title');//商品名称
            }
            if ($post['goods_price'] == null) {
                return_ajax(400, '缺少goods_price');//商品价格
            }
            if ($post['goods_pic'] == null) {
                return_ajax(400, '缺少goods_pic');//商品图片
            }
            if ($post['goods_attr'] == null) {
                return_ajax(400, '缺少goods_attr');//商品属性
            }

            if ($post['num'] == null) {
                return_ajax(400, '缺少num');//数量
            }
            $data['0'] = [
                'id'          => $post['goods_id'],//商品id
                'goods_title' => $post['goods_title'],//商品标题
                'goods_price' => $post['goods_price'],//商品价格
                'goods_pic'   => $post['goods_pic'],//商品图片
                // 'goods_attr'  => json_decode($post['goods_attr'], '1'),//商品规格
                'goods_attr'  => $post['goods_attr'],//商品规格
                'number'      => $post['num'],//购买数量
            ];
            $order_price = $post['goods_price'] * $post['num'];
            $goods = Db::name('goods')->where('id', $post['goods_id'])->find();
            $goods_point = $goods['point'];

            // // 判断限购
            // if ($post['num'] > $goods['quota']) {
            //     return_ajax(400, '该商品限购' .$goods['quota'] .'份');
            // }

            $gids[] = $post['goods_id'];
        }


        // 判断库存
        foreach ($data as $key => $value) {
            $goods_val = Db::name('goods_val')->where('id', $value['goods_attr']['id'])->find();
            if ($goods_val['stock'] < $value['number']) {
                return_ajax(400, '库存不足');
            }
        }

        // full_price 条件金额
        // is_point 是否允许积分抵扣 1否 2是
        // is_convert 是否允许积分兑换 1否 2是
        // discount 享受折扣
        // birthday_discount 生日折扣
        // is_default 是否设为用户默认等级 1否 2是
        $field = 'u.id, u.status, u.grade_id, u.skin_id, u.point, u.birthday, g.full_price, g.is_point, g.is_convert, g.discount, g.birthday_discount, g.is_default';
        $user = Db::name('user')
            ->alias('u')
            ->field($field)
            ->join('user_grade g', 'u.grade_id = g.id')
            ->where('u.id', $uid)
            ->find();
        if (!$user) {
            return_ajax(400, '配置获取失败');
        }

        $fare_money     = '0';//运费
        $is_discount    = '0';//是否满减：0否；1是
        $reduce_money   = '0';//满减金额
        $point_money    = '0';//积分抵扣金额
        $is_birthday    = '0';//是否生日优惠：0否；1是
        $birthday_money = '0';//生日优惠金额
        $is_members     = '0';//是否会员折扣：0否；1是
        $members_money  = '0';//会员折扣金额
        $discount_money = '0';//优惠总金额
        $use_point      = '0';//使用的积分
        $use_coupon     = '0';//是否有优惠券：0否；1是


        // 运费
        foreach ($data as $key => $value) {
            if ($value['goods_attr']['fare_money'] >= $fare_money) {
                $fare_money = $value['goods_attr']['fare_money'];
            }
        }

        $order_price = $order_price + $fare_money;
        $pay_moeny   = $order_price;//优惠之后金额

        // 满减
        $discount = Db::name('goods_discount')->where('goods_id', 'in', $gids)->where('status', '1')->order('full_price desc')->select();
        if ($discount) {
            $time = time();
            foreach ($discount as $key => $value) {
                if ($time >= $value['start_time'] && $time <= $value['end_time']) {
                    if ($pay_moeny >= $value['full_price']) {
                        $is_discount  = '1';//满减
                        $pay_moeny  = $pay_moeny - $value['less_price'];//满减后金额
                        $reduce_money = $value['less_price'];//满减金额
                        break;
                    }
                }
            }
        }


        // // 满减
        // $discount = Db::name('discount')->where('status', '1')->order('full_price desc')->select();

        // if ($discount) {
        //     foreach ($discount as $key => $value) {
        //         if ($pay_moeny >= $value['full_price']) {
        //             $is_discount  = '1';//满减
        //             $pay_moeny  = $pay_moeny - $value['less_price'];//满减后金额
        //             $reduce_money = $value['less_price'];//满减金额
        //             break;
        //         }
        //     }
        // }

        // 积分
        if ($user['is_point'] == '2') {
            $config = Db::name('config')->where('id', '1')->find();
            if (($user['point'] && $config['point_money']) && $goods_point) {
                if ($user['point'] >= $config['point_money']) {
                    // $point_money = floor($goods_point / $config['point_money']);
                    $point_money = $goods_point / $config['point_money'];
                    $use_point   = $goods_point % $config['point_money'];
                }
            }
        }

        // 优惠券
        $wh_c['uid']    = $uid;
        $wh_c['status'] = '1';//未使用
        $user_coupon = Db::name('user_coupon')->where($wh_c)->whereTime('day_time', '>=', time())->select();
        if ($user_coupon) {
            $use_coupon = '1';//是否有优惠券：0否；1是
        }

        $date = date('m-d', time());
        if ($date == substr($user['birthday'], '5', '5')) {
            // 生日折扣
            $is_birthday = '1';
            $birthday_money = $pay_moeny * $user['birthday_discount'];
            $pay_moeny = $pay_moeny - $birthday_money;
        }else{
            if ($pay_moeny >= $user['full_price']) {
                // 会员折扣
                $members_money = $pay_moeny * $user['discount'];
                $pay_moeny   = $pay_moeny - $members_money;
                $is_members    = '1';
            }
        }

        $discount_money = $reduce_money + $point_money + $birthday_money + $members_money;

        $datas = [
            'data'           => $data,
            'order_price'    => $order_price,//应付金额
            //'pay_moeny'      => $pay_moeny,//实付金额
            'pay_moeny'      => sprintf('%.2f', $pay_moeny) ,//实付金额

            'fare_money'     => $fare_money,//运费
            'is_discount'    => $is_discount,//是否满减：0否；1是
            'reduce_money'   => $reduce_money,//满减金额
            'is_point'       => $user['is_point'],//是否允许积分抵扣 1否 2是
            'point_money'    => $point_money,//积分抵扣金额
            'is_birthday'    => $is_birthday,//是否生日优惠：0否；1是
            'birthday_money' => $birthday_money,//生日优惠金额
            'is_members'     => $is_members,//是否会员折扣：0否；1是
            'members_money'  => $members_money,//会员折扣金额
            'discount_money' => $discount_money,//优惠总金额
            'use_point'      => $use_point,//使用的积分
            'use_coupon'     => $use_coupon,//是否有优惠券：0否；1是
        ];

        return_ajax(200, '操作成功', $datas);
	}

    /**
     * 使用优惠券
     * 返回优惠券 优惠金额
     */
    public function useCoupon(){
        $uid  = $this->uid;
        $post = input('post.');
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        if (empty($post['id'])) {
            return_ajax(400, '缺少id');
        }
        $where['uid'] = $uid;
        $where['coupon_id'] = ['in', $post['id']];
        $less_price = Db::name('user_coupon')->where($where)->sum('less_price');
        $data['less_price'] = $less_price ? $less_price : '0';
        return_ajax(200, '操作成功', $data);
    }


    /**
     * 添加订单
     */
    public function addOrder(){
        $post = input('post.');
        $uid  = $this->uid;
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        if (!$post['province']) {
            return_ajax(400, '缺少province');
        }
        if (!$post['city']) {
            return_ajax(400, '缺少city');
        }
        if (!$post['area']) {
            return_ajax(400, '缺少area');
        }
        if (!$post['address']) {
            return_ajax(400, '缺少address');
        }
        if (!$post['pay_moeny']) {
            return_ajax(400, '缺少pay_moeny');
        }
        
        if (empty($post['data'])) {
            return_ajax(400, '操作失败');
        }

        // $user = Db::name('user')->where('id', $uid)->find();

        //$order_no = $this->order_no();//订单号
      	$order_no = order_no('order_no', 'order');//订单号
        $order = [
            'uid'            => $uid,
            'order_no'       => $order_no,//订单号
            'order_price'    => $post['order_price'],//应付金额
            'pay_money'      => $post['pay_moeny'],//实付金额
            'fare_money'     => $post['fare_money'],//运费
            'is_discount'    => $post['is_discount'],////是否满减：0否；1是
            'full_money'     => $post['reduce_money'],//满减金额
            'point_money'    => $post['point_money'],//积分抵扣金额
            'birthday_money' => $post['birthday_money'],//生日优惠金额
            'members_money'  => $post['members_money'],//会员折扣金额
            // 'coupon_id'      => implode($post['coupon_id']),//优惠券id
            'coupon_money'   => $post['coupon_money'],//优惠券金额
            'pay_type'       => $post['pay_type'],//0余额支付；1微信支付
            'msg'            => $post['msg'],//留言信息
            'province'       => $post['province'],//省
            'city'           => $post['city'],//市
            'area'           => $post['area'],//区
            'address'        => $post['address'],//详细地址
            'username'       => $post['username'],//
            'userphone'      => $post['userphone'],//
            'form_id'      => $post['form_id'],//
            'use_point'      => $post['use_point'],//使用的积分
            'add_time'       => time(),
        ];
        if ($post['coupon_id']) {
            $order['coupon_id'] = implode($post['coupon_id']);//优惠券id
        }

        Db::startTrans();// 启动事务

        $order_id = Db::name('order')->insertGetId($order);
        $order_list = [];
        if ($order_id) {
            foreach ($post['data'] as $key => $value) {
                // 限购数量
                $quota = Db::name('goods')->where('id', $value['id'])->value('quota');
                if ($quota != '0' && $value['number'] > $quota) {
                    return_ajax(400, $value['goods_title'] .'该商品限购' .$quota .'份');
                }

                $order_list[$key]['uid']         = $uid;
                $order_list[$key]['order_id']    = $order_id;
                $order_list[$key]['number']      = $value['number'];
                $order_list[$key]['goods_id']    = $value['id'];
                $order_list[$key]['goods_title'] = $value['goods_title'];
                $order_list[$key]['goods_pic']   = $value['goods_pic'];
                $order_list[$key]['goods_price'] = $value['goods_price'];
                $order_list[$key]['goods_attr']  = json_encode($value['goods_attr']);
                $order_list[$key]['add_time']    = time();
            }
        }
        $res_lst = Db::name('order_list')->insertAll($order_list);

        if ($order_id && $res_lst) {
            Db::commit();// 提交事务

            //商品统计
            $goods =  GoodsCount::whereTime('add_time','today')->find();
            GoodsCount::where('id',$goods['id'])->setInc('buy',1);//加上购买人数
            foreach ($post['data'] as $key => $value) {
                    $o[$key] = Db::name('order_list')->where(['uid'=>$this->uid,'goods_id'=>$value['id']])->find();
                    if ($o[$key]){
                        GoodsCount::where('goods_id',$value['id'])->setInc('add_number',1);
                        GoodsCount::where('goods_id',$value['id'])->setInc('add_count',1);
                        GoodsCount::where('goods_id',$value['id'])->setInc('add_num',1);
                        GoodsCount::where('goods_id',$value['id'])->setInc('add_money',1);
                    }
            }



            return_ajax(200, '添加成功', $order['order_no']);
        }else{
            Db::rollback();// 回滚事务
            return_ajax(400, '添加失败');
        }

    }


    //获取支付信息
    public function orderPay(){
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['order_no'])) {
                return_ajax(400,'缺少必传参数order_no');
            }
            $order  = Db::name('order')->where('order_no', $post['order_no'])->find();
            $openid = Db::name('user')->where('id',$this->uid)->value('openid');
            $url = 'https://hzdy.kailly.com/api/Weix/porder_callback';
            $wexxin = controller('Weix');
            $res = $wexxin->pwxpay('订单支付', $post['order_no'], $order['order_price'], $openid, $url, 'order');
            return_ajax(200,'获取成功', $res);
        }
    }

    //余额支付
    public function money(){
        if(request()->isPost()) {
            $post = input('post.');
            if (empty($post['order_no'])) {
                return_ajax(400,'缺少必传参数order_no');
            }
            if (empty($post['money'])) {
                return_ajax(400,'缺少必传参数money');
            }
            $money = Db::name('user')->where('id', $this->uid)->value('money');
            if ($post['money'] > $money){
                return_ajax(400,'余额不足');
            }else{
                //查询订单信息
                $order = Db::name('order')->where('order_no', $post['order_no'])->find();
                if($order['status'] == '1' && $order['pay_state'] == '0'){
                    $order_goods = Db::name('order_list')->where('order_id', $order['id'])->select();
                    foreach ($order_goods as $key => $value) {
                        $res = Db::name('goods')->where('id', $value['goods_id'])->setInc('pay_num', $value['number']);//加销量
                        $goods_attr = json_decode($value['goods_attr'], '1');
                        foreach ($goods_attr as $k => $v) {
                            Db::name('goods_val')->where('id', $goods_attr['id'])->setInc('pay_num', $value['number']);//加销量
                            Db::name('goods_val')->where('id', $goods_attr['id'])->setDec('stock', $value['number']);//减库存
                        }
                    }
                    $up_user   = Db::name('user')->where('id', $order['uid'])->setDec('money', $order['pay_money']);//减余额
                    $res_order = Db::name('order')->where('order_no', $order['order_no'])->update(['status' => '2', 'pay_state' => '1', 'pay_at' => time(),'pay_price'=>$order['pay_money']]);

                    if ($order['use_point']) {
                        $arr = [
                            'uid'      => $order['uid'],
                            'type'     => '3',
                            'desc'     => '普通订单积分抵扣',
                            'point'    => '-' .$order['use_point'],
                            'pay_type' => '2',
                            'add_time' => time()
                        ];
                        $rs_point = Db::name('point_change')->insert($arr);
                        $rs_u_point = Db::name('user')->where('id', $order['uid'])->setDec('point', $order['use_point']);
                    }

                    if ($up_user && $res_order) {
                        //发送模板消息
                        controller('Weix')->send($post['order_no'],1,1);
                        return_ajax(200,'支付成功');
                    }else{
                        return_ajax(200,'支付失败');
                    }
                }
            }
        }
    }



/**
 * [order_sn 生成订单编号]
 * @Author   PengJun
 * @DateTime 2019-05-26
 * @return   [type]     [description]
 */
public function order_no()
{
    $order_no = date('YmdHi').rand_number(0,999999);
    $is = Db::name('order')->where('order_no',$order_no)->find();
    if($is){
        $this->order_no();
    } else {
        return $order_no;
    }
}
















}
