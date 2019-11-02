<?php
namespace app\api\controller;
use \think\Controller;
use \think\Db;
use \think\Cache;
use app\api\model\Order;
use app\api\model\OrderGoods;
use app\common\model\User;
use app\common\model\Goods;
use app\common\model\Config;
use app\common\model\SpikeOrder;
use app\common\model\SpikeGoods;
use app\common\model\Form;

class Weix extends Controller
{	
	/* 微信信息控制器 */

    /**
     * [getOpenid 获取用户openid和session_key]
     * @Author   PengJun
     * @DateTime 2019-03-23
     * @return   [type]     [description]
     */
    public function getOpenid()
    {
        if(request()->isPost()){
            $post = input('post.');
            $config = Config::get(1);

            if(empty($post['code'])){ return_ajax(400,'缺少code参数'); }

            $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$config['appid'].'&secret='.$config['appsecret'].'&js_code='.$post['code'].'&grant_type=authorization_code';
            $info = json_decode(curlPost($url),true);

            return_ajax(200,'获取成功',$info);
        }
    }

    //存储用户的form_id
    public function add_formid()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['uid'])) { return_ajax(400,'缺少用户id');}
            if (empty($post['form_id'])) { return_ajax(400,'缺少form_id');}
            $data = [
                'uid'   => $post['uid'],
                'form_id'   => $post['form_id'],
            ];
            $res = Form::create($data);
            if ($res){
                return_ajax(200,'添加成功');
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    /**
     * [update_user 添加、更新用户信息]
     * @Author   PengJun
     * @DateTime 2019-03-23
     * @return   [type]     [description]
     */
    public function update_user()
    {
        if(request()->isPost()){
            $post = input('post.');
            $user_model = new User;

            if(empty($post['openid'])){ return_ajax(400,'缺少用户openid'); }

            $user = User::where('openid',$post['openid'])->find();

            $post['token'] = $this->GetToken($user['openid']);
            $post['nickname'] = emojiEncode($post['nickname']);
            $post['head_img'] = $post['headimgurl'];

            $post['update_time'] = time();
            if($user){
                unset($post['top_id']);
                //更新
                if($user_model->allowField(true)->save($post,['id'=>$user['id']])){
                    $user = User::where('openid',$post['openid'])->find();
                    $user['nickname'] = emojiDecode($user['nickname']);
                    $user['is_new']   = '1';
                    return_ajax(200,'登录成功',$user);
                } else {
                    return_ajax(400,'登录失败，请稍后重试！');
                }
            } else {
                if (!empty($post['top_id'])){
                    point(5,$post['top_id'],100,1,'邀请好友奖励');
                }
                //添加
              	$post['number'] = $this->getNonceStr();
                $post['add_time'] = time();

                if($user_model->allowField(true)->save($post)){
                    $user = User::where('openid',$post['openid'])->find();
                    $user['nickname'] = emojiDecode($user['nickname']);
                    $user['is_new']   = '1';
                    return_ajax(200,'登录成功',$user);
                } else {
                    return_ajax(400,'登录失败，请稍后重试！');
                }
            }
        }
    }

      public function getSignid(){
        $user_model = new User;
        $number = randomCode('user', $type=2,$num=8);
        $check  = $user_model::where('number', $number)->find();
        if ($check) {
            $number = $this->getSignid();
        }else{
            return $number;
        }
    }
  
    /**
     * [GetToken 获取用户token]
     * @Author   PengJun
     * @DateTime 2019-03-23
     */
    public function GetToken($openid)
    {
        $key = 'jigujigu';
        $token = md5(md5($openid).md5($key).time());

        $isset = User::get(['token'=>$token]);
        if($isset){
            $this->GetToken($openid);
        } else {
            return $token;
        }
    }

    /**
     * [pay 获取支付信息]
     * @Author   PengJun
     * @DateTime 2019-04-03
     * @return   [type]     [description]
     */
    public function pay()
    {
        if(request()->isPost()){
            $post = input('post.');
            if(empty($post['token'])){ return_ajax(400,'缺少token'); }
            
            $user = User::get(['token'=>$post['token']]);

            if(empty($user)){ return_ajax(400,'token错误！'); }
            if(empty($post['order_id'])){ return_ajax(400,'缺少订单ID'); }
            //查询订单
            $order = Order::get(['id'=>$post['order_id']]);
            if(empty($order)){ return_ajax(400,'订单不存在'); }
            if($order['status'] != 1){ return_ajax(400,'订单状态异常，无法支付'); }
            // p(toArray($order));
            //回调地址
            $backurl = 'http://'.$_SERVER['SERVER_NAME'].'/api/Weix/wxPayCallback';

            $result = $this->wxpay('商品订单支付',$order['order_sn'],$order['pay_money'],$user['openid'],$backurl,'order');
            $result['order_sn'] = $order['order_sn'];  // 订单号
            $result['money'] = $order['pay_money'];  // 实际支付金额

            return_ajax(200,'获取成功',$result);
        }
    }

    //支付回调
    public function wxPayCallback()
    { 
        $xml = file_get_contents("php://input");
        if (!$xml) {
            echo "非法操作"; return;
        }
        libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)),true);
        
        if($data['result_code'] == 'SUCCESS' && $data['return_code'] == 'SUCCESS'){
            //查询订单信息
            $order = Order::get(['order_sn'=>$data['out_trade_no']]);
            // files(print_r($order,true));
            if($order['status'] == 1){
                //修改订单状态 给商品加销量
                $order->status = 2;
                $order->pay_time = time();
                $order->pay_price = $data['total_fee'];
                if($order->save()){
                    //查询订单商品
                    $order_goods = OrderGoods::get(['order_id'=>$order['id']]);
                    foreach($order_goods as $vo){
                        Goods::where('id',$vo['goods_id'])->setInc('pay_num',$vo['num']);
                    }
                }
            }
        }
        echo "SUCCESS";
    }

    /**
     * [wxPayCallback 拼团回调]
     * @Author   PengJun
     * @DateTime 2019-09-20
     * @return   [type]     [description]
     */
    public function GroupCallback()
    { 
        $xml = file_get_contents("php://input");
        if (!$xml) {
            echo "非法操作"; return;
        }
        libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)),true);
        
        if($data['result_code'] == 'SUCCESS' && $data['return_code'] == 'SUCCESS'){
            //查询订单信息
            $order = model('GroupOrder')::get(['order_sn'=>$data['out_trade_no']]);
            if($order['status'] == 1){
                $order->status = 2;
                $order->pay_state = 1;
                $order->pay_at = time();
                $order->pay_type = 1;
                $order->pay_price = $data['total_fee'];
                if($order->save()){
                    $this->send($data['out_trade_no'],3,1);
                    //判断团人数是否足够
                    $num = model('GroupOrder')->where(['group_no'=>$order['group_no'],'status'=>2,'pay_state'=>1])->count();
                    if($num == $order['goods_num']){
                        model('GroupOrder')->where(['group_no'=>$order['group_no'],'status'=>2,'pay_state'=>1])->update(['group_status'=>2]);
                    }
                    model('GroupGoods')->where(['id'=>$order['goods_id']])->setInc('pay_num');
                    model('GroupGoods')->where(['id'=>$order['goods_id']])->setDec('setInc');
                }
            }
        }
        echo "SUCCESS";
    }

    /**
     * [wxPayCallback 砍价回调]
     * @Author   PengJun
     * @DateTime 2019-09-20
     * @return   [type]     [description]
     */
    public function BargainCallback()
    { 
        $xml = file_get_contents("php://input");
        if (!$xml) {
            echo "非法操作"; return;
        }
        libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)),true);
        
        if($data['result_code'] == 'SUCCESS' && $data['return_code'] == 'SUCCESS'){
            //查询订单信息
            $order = model('BargainOrder')::get(['order_sn'=>$data['out_trade_no']]);
            if($order['status'] == 1){
                $order->pay_type = 1;
                $order->pay_state = 1;
                $order->pay_at = time();
                $order->status = 2;
                $order->pay_price = $data['total_fee'];
                if($order->save()){
                    $this->send($data['out_trade_no'],2,1);
                    model('BargainGoods')->where(['id'=>$order['goods_id']])->setInc('pay_num');
                }
            }
        }
        echo "SUCCESS";
    }

    //秒杀订单-回调
    public function spike_callback()
    {
        $xml = file_get_contents("php://input");
        if (!$xml) {
            echo "非法操作"; return;
        }
        libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)),true);

        if($data['result_code'] == 'SUCCESS' && $data['return_code'] == 'SUCCESS'){
            //查询订单信息
            $order = SpikeOrder::get(['order_sn'=>$data['out_trade_no']]);

            if($order['status'] == 1){
                //修改订单状态 给商品减库存
                $order->status = 2;
                $order->pay_no = $data['out_trade_no'];
                $order->pay_at = time();
                $order->pay_price = $data['total_fee'];
                if($order->save()){
                    $this->send($data['out_trade_no'],4,1);
                    //查询订单商品
                    $spike = SpikeGoods::get(['id'=>$order['goods_id']]);
                    SpikeGoods::where('id',$spike['id'])->setDec('stock',1);
                }
            }
        }
        echo "SUCCESS";
    }

    //限时打折订单-回调
    public function limit_callback()
    {
        $xml = file_get_contents("php://input");

        if (!$xml) {
            echo "非法操作"; return;
        }
        libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)),true);
       files(print_r($data,true));
        if($data['result_code'] == 'SUCCESS' && $data['return_code'] == 'SUCCESS'){
            //查询订单信息
           $order = Db::name('limit_order')->where('order_sn',$data['out_trade_no'])->find();
            if($order['status'] == 1){
                //修改订单状态 给商品减库存
                $res = Db::name('limit_order')->where('order_sn',$data['out_trade_no'])->update(['status'=>2,'pay_no'=>$data['out_trade_no'],'pay_at'=>time(),'pay_price'=>$data['total_fee']]);
                
                if($res){
                    $this->send($data['out_trade_no'],5,1);
                    //查询订单商品
                    $spike = model('limit_goods')::get(['id'=>$order['goods_id']]);
                    LimitGoods::where('id',$spike['id'])->setDec('stock',1);
                }
            }
        }
        echo "SUCCESS";
    }

    /**
     *
     * 产生随机字符串，不长于6位
     * @param int $length
     * @return 产生的随机字符串
     */
    public function getNonceStr($length = 6)
    {
        $chars = "0123456789";
        $str ="";
        for ( $i = 0; $i < $length; $i++ )  {
            $str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);
        }
        $res = User::where('number',$str)->find();
        if ($res) {
            $str = $this->getNonceStr();
        }
        return $str;
    }

    /**
     * [wxqrcode 生成小程序二维码]
     * @Author   谜一样的男人
     * @DateTime 2019-07-14
     * @return   [type]     [description]
     */
    public function wxqrcode($members_id)
    {

        $access_token = $this->getAccessToken();
        $url = 'https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token='.$access_token;
        $data = array("page"=>"pages/index/index","scene"=>$members_id,"width"=>430);
        $data = json_encode($data);
        $info = curlPost($url,$data);
//        $cardcode = "uploads/code/".$members_id.".jpg";
//        file_put_contents($cardcode,$info);
        return $info;
    }

    /**
     * [getAccessToken 获取小程序access_token]
     * @Author   谜一样的男人
     * @DateTime 2019-07-14
     * @return   [type]     [description]
     */
   // public function getAccessToken()
    //{
      //  $config = Config::get(1);
     //   $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$config['appid'].'&secret='.$config['appsecret'];
     //   $info = json_decode(curl_get_contents($url),true);
    //    return $info['access_token'];
 //   }


    // 接口微信支付
    public function wxpay($body, $order_no, $money, $openid, $backurl,$table)
    {
        $money = 0.01;    // 上线需删除
        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        $base = Db::name('config')->field('id,appid,mchid,key')->where('id', 1)->find();
        $member_id = Db::name($table)->where('order_sn',$order_no)->value('uid');
        // 接口所需参数(数组形式)
        $parameter = [
            'appid'            => $base['appid'],//小程序ID
            'mch_id'           => $base['mchid'],//商户号
            'nonce_str'        => getNonceStr(),//随机字符串
            'body'             => $body,//商品描述
            'out_trade_no'     => $order_no,//商户订单号
            'total_fee'        => $money * 100,//总金额
            'spbill_create_ip' => $_SERVER['REMOTE_ADDR'],//终端IP
            'notify_url'       => $backurl,//通知地址
            'trade_type'       => 'JSAPI',//交易类型
            'openid'           => $openid, //用户标识
        ];

        $parameter['sign'] = $this->getSign($parameter, $base['key']);
        // p($parameter);
        //接口所需参数(数组转XML格式)
        $xmldata = $this->arrayToXml($parameter);
        //初始一个curl会话
        $return = curlPost($url, $xmldata);
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        //先把xml转换为simplexml对象，再把simplexml对象转换成 json，再将 json 转换成数组。
        $return = json_decode(json_encode(simplexml_load_string($return, 'SimpleXMLElement', LIBXML_NOCDATA)), true);

        // return $return;
        if ($return['return_code'] != 'SUCCESS' || $return['result_code'] != 'SUCCESS') {
            return_ajax(400,$return['return_msg']);
        }

        //生成小程序支付签名所需参数
        $parameters = [
            'appId'     => $base['appid'],//小程序ID
            'timeStamp' => '' . time() . '',//时间戳
            'nonceStr'  => getNonceStr(),//随机串
            'package'   => 'prepay_id=' . $return['prepay_id'],//数据包
            'signType'  => 'MD5',//签名方式
        ];
        $parameters['paySign'] = $this->getSign($parameters, $base['key']);
        return $parameters;
    }


      // 接口微信支付
    public function pwxpay($body, $order_no, $money, $openid, $backurl,$table)
    {
        $money = 0.01;    // 上线需删除
        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        $base = Db::name('config')->field('id,appid,mchid,key')->where('id', 1)->find();
        $member_id = Db::name($table)->where('order_no',$order_no)->value('uid');
        // 接口所需参数(数组形式)
        $parameter = [
            'appid'            => $base['appid'],//小程序ID
            'mch_id'           => $base['mchid'],//商户号
            'nonce_str'        => getNonceStr(),//随机字符串
            'body'             => $body,//商品描述
            'out_trade_no'     => $order_no,//商户订单号
            'total_fee'        => $money * 100,//总金额
            'spbill_create_ip' => $_SERVER['REMOTE_ADDR'],//终端IP
            'notify_url'       => $backurl,//通知地址
            'trade_type'       => 'JSAPI',//交易类型
            'openid'           => $openid, //用户标识
        ];

        $parameter['sign'] = $this->getSign($parameter, $base['key']);
        // p($parameter);
        //接口所需参数(数组转XML格式)
        $xmldata = $this->arrayToXml($parameter);
        //初始一个curl会话
        $return = curlPost($url, $xmldata);
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        //先把xml转换为simplexml对象，再把simplexml对象转换成 json，再将 json 转换成数组。
        $return = json_decode(json_encode(simplexml_load_string($return, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        // return $return;
        if ($return['return_code'] != 'SUCCESS' || $return['result_code'] != 'SUCCESS') {
            return_ajax(400,$return['return_msg']);
        }

        //生成小程序支付签名所需参数
        $parameters = [
            'appId'     => $base['appid'],//小程序ID
            'timeStamp' => '' . time() . '',//时间戳
            'nonceStr'  => getNonceStr(),//随机串
            'package'   => 'prepay_id=' . $return['prepay_id'],//数据包
            'signType'  => 'MD5',//签名方式
        ];
        $parameters['paySign'] = $this->getSign($parameters, $base['key']);
        return $parameters;
    }
  
  
      //普通订单-回调
    public function porder_callback()
    {
        $xml = file_get_contents("php://input");
        if (!$xml) {
            echo "非法操作"; return;
        }

        libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)),true);

        if($data['result_code'] == 'SUCCESS' && $data['return_code'] == 'SUCCESS'){
            file_put_contents('succ.txt', $data['out_trade_no']);

            //查询订单信息
            // $order = Order::get(['order_no'=>$data['out_trade_no']]);
            $order = Db::name('order')->where('order_no', $data['out_trade_no'])->find();

            if($order['status'] == '1' && $order['pay_state'] == '0'){

                $order_goods = Db::name('order_list')->where('order_id', $order['id'])->select();

                foreach ($order_goods as $key => $value) {
                    $res = Db::name('goods')->where('id', $value['goods_id'])->setInc('pay_num', $value['number']);//加销量
                    $goods_attr = json_decode($value['goods_attr'], '1');
                    foreach ($goods_attr as $k => $v) {
                        Db::name('goods_val')->where('id', $goods_attr['id'])->fetchsql(true)->setInc('pay_num', $value['number']);//加销量
                        Db::name('goods_val')->where('id', $goods_attr['id'])->setDec('stock', $value['number']);//减库存
                    }
                }
                $data['total_fee'] = $data['total_fee'] / 100;
                $res_order = Db::name('order')->where('order_no', $order['order_no'])->update(['status' => '2', 'pay_state' => '1', 'pay_at' => time(),'pay_price'=>$data['total_fee']]);
                $this->send($order['order_no'],1,1);
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
                if ($order['coupon_id']) {
                    $rs_coupon = Db::name('user_coupon')->where('id', $order['coupon_id'])->update(['status' => '2', 'update_time' => time()]);
                }
              
            }
        }
        echo "SUCCESS";
    }


    //退款
    public function refund($ordercode = '', $money = '')
    {
        $url = 'https://api.mch.weixin.qq.com/secapi/pay/refund';
        $base = Db::name('config')->field('id,appid,mchid,key')->where('id', 1)->find();
        // 接口所需参数(数组形式)
        $parameter = array(
            'appid' 			=>	$base['appid'],//微信分配的小程序ID
            'mch_id'			=>	$base['mchid'],//微信支付分配的商户号
            'nonce_str'			=>	randomCode(),//随机字符串
            'out_trade_no'		=>	$ordercode,//商户订单号
            'out_refund_no'		=>	randomCode(),//退款单号
            'total_fee'			=>	$money * 100,//订单总金额
            'refund_fee'		=>	$money * 100,//退款总金额
        );

        $parameter['sign'] = $this->getSign($parameter,$base['key']);
        //接口所需参数(数组转XML格式)
        $xmldata = $this->arrayToXml($parameter);
        //初始一个curl会话
        $return = $this->refund_curlPostXml($url,$xmldata);

        return $return;
    }

    //引入退款证书
    public function refund_curlPostXml($url, $xmldata){
        $ch = curl_init();
        $header = "Accept-Charset: utf-8";
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
//        curl_setopt($curl, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1);
//        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLCERT, '/klwl_web/klwl_pj/hzdy.kailly.com/vendor/cert/apiclient_cert.pem');
        curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLKEY, '/klwl_web/klwl_pj/hzdy.kailly.com/vendor/cert/apiclient_key.pem');
        curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xmldata);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $tmpInfo = curl_exec($ch);
        curl_close($ch);
        //关闭cURL资源，并且释放系统资源
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        //先把xml转换为simplexml对象，再把simplexml对象转换成 json，再将 json 转换成数组。
        $value_array = json_decode(json_encode(simplexml_load_string($tmpInfo, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $value_array;

    }
  
    //作用：生成签名
    private function getSign($Obj, $key)
    {
        foreach ($Obj as $k => $v) {
            $Parameters[$k] = $v;
        }
        // 签名步骤一：按字典序排序参数
        ksort($Parameters);
        $String = $this->formatBizQueryParaMap($Parameters, false);
        // 签名步骤二：在string后加入KEY
        $String = $String . "&key=" . $key;

        // 签名步骤三：MD5加密
        $String = md5($String);
        // 签名步骤四：所有字符转为大写
        $result = strtoupper($String);
        return $result;
    }

    /* 以下为微信支付所需要的 */
    private function formatBizQueryParaMap($paraMap, $urlencode)
    {
        $buff = "";
        ksort($paraMap);
        foreach ($paraMap as $k => $v) {
            if ($urlencode) {
                $v = urlencode($v);
            }
            $buff .= $k . "=" . $v . "&";
        }
        $reqPar = '';
        if (strlen($buff) > 0) {
            $reqPar = substr($buff, 0, strlen($buff) - 1);
        }
        return $reqPar;
    }

    //数组转XML格式
    public function arrayToXml($arr)
    {
        $xml = "<xml>";
        foreach ($arr as $key => $val) {
            if (is_array($val)) {
                $xml .= "<" . $key . ">" . $this->arrayToXml($val) . "</" . $key . ">";
            } else {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            }
        }
        $xml .= "</xml>";
        return $xml;
    }

    /**
     * [getAccessToken 获取小程序access_token]
     * @Author   谜一样得男人
     * @DateTime 2019-07-26
     * @return   [type]     [description]
     */
    public function getAccessToken()
    {
        $access_token = Cache::get('access_token');
        if (empty($access_token)){
            $config = Config::get(1);
            $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$config['appid'].'&secret='.$config['appsecret'];
            $info = json_decode(curl_get_contents($url),true);
            Cache::set('access_token',$info['access_token'],7200);
            $access_token = $info['access_token'];
        }

        return $access_token;
    }

    /**
     * @param $type 1支付成功  2发货  3砍价成功
     *
     */
    public function templete($type,$order)
    {
        switch($type) {
            case 1:
                $data = [
                    'touser'    => $order['openid'],
                    'template_id'    =>  '84MzJiDh84KfrGOK0VS0kaw5ONVqmMfkCyXzM5UY-AI',
                    'page'    => $order['page'],
                    'form_id'    => $order['form_id'],
                    'data'=>[
                        'keyword1'=>[
                            'value' => $order['order_sn']
                        ],
                        'keyword2'=>[
                            'value' => $order['order_price']
                        ],
                        'keyword3'=>[
                            'value' => $order['pay_price']
                        ],
                        'keyword4'=>[
                            'value' => '待发货'
                        ],
                        'keyword5'=>[
                            'value' => $order['add_time']
                        ],
                    ]
                ];
                break;//支付成功
            case 2:
                $data = [
                    'touser'    => $order['openid'],
                    'template_id'    =>  'Zxunwc10SMeGVZXCBK2crME5wc-xeRYeENaRnyOKVrc',
                    'page'    => $order['page'],
                    'form_id'    => $order['form_id'],
                    'data'=>[
                        'keyword1'=>[
                            'value' => ''
                        ],
                        'keyword2'=>[
                            'value' =>''
                        ],
                        'keyword3'=>[
                            'value' => ''
                        ],
                        'keyword4'=>[
                            'value' => ''
                        ],
                        'keyword5'=>[
                            'value' => ''
                        ],
                        'keyword6'=>[
                            'value' => ''
                        ],
                        'keyword7'=>[
                            'value' => ''
                        ],
                        'keyword8'=>[
                            'value' => ''
                        ],
                        'keyword9'=>[
                            'value' => ''
                        ],
                    ]
                ];
                break;//发货
            case 3:
                $data = [
                    'touser'    => $order['openid'],
                    'template_id'    =>  'wfCUmmYeXJoykA-EdVVD01aHiWqKAJqp1ylL6CTJyw8',
                    'page'    => $order['page'],
                    'form_id'    => $order['form_id'],
                    'data'=>[
                        'keyword1'=>[
                            'value' => ''
                        ],
                        'keyword2'=>[
                            'value' =>''
                        ],
                        'keyword3'=>[
                            'value' => ''
                        ],
                        'keyword4'=>[
                            'value' => ''
                        ],
                        'keyword5'=>[
                            'value' => ''
                        ],
                        'keyword6'=>[
                            'value' => ''
                        ],
                    ]
                ];
                break;//砍价成功
        }
        return $data;
    }

    /**
     * @param $order_sn 订单号
     * @param $order_type 1普通订单 2砍价订单 3拼团订单 4秒杀订单 5限时打折
     * @param $type 1支付成功 2发货 3退款成功 4砍价开始 5砍价成功
     */
    public function send($order_sn,$order_type,$type)
    {

        $access_token = $this->getAccessToken();
        $url = 'https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token='.$access_token.'';
        switch($order_type){
            case 1:
                $order = model('order')->where('order_no',$order_sn)->find();
                $order['order_sn'] = $order['order_no'];
                $order['page'] = '/pages/myOrder/myOrder';
                break;//普通订单
            case 2:
                $order = model('bargain_order')->where('order_sn',$order_sn)->find();
                $order['page'] = '/pages/myOrder1/bargainList/bargainList';
                break;//砍价订单
            case 3:
                $order = model('group_order')->where('order_sn',$order_sn)->find();
                $order['page'] = '/pages/myOrder3/assemList/assemList';
                break;//拼团订单
            case 4:
                $order = model('spike_order')->where('order_sn',$order_sn)->find();
                $order['page'] = '/pages/myOrderMS/myOrderMS?xianshi=0';
                break;//秒杀订单
            case 5:
                $order = model('limit_order')->where('order_sn',$order_sn)->find();
                $order['page'] = '/pages/myOrderMS/myOrderMS?xianshi=1';
                break;//限时打折订单
        }

        $order['openid'] = User::where('id',$order['uid'])->value('openid');

        $data = $this->templete($type,$order);
        $data = json_encode($data);
        curlPost($url,$data);
//        $info  = json_decode($info,true);

    }
}
