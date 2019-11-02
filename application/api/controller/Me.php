<?php
namespace app\api\controller;
use app\common\model\User;
use app\common\model\Config;
use app\common\model\UserKeep;
use app\common\model\Collect;
use app\common\model\Order;
use app\common\model\UserMoney;
use app\common\model\UserSign;
use app\common\model\GoodsCount;
use app\common\model\SignConfig;
use app\common\model\Coupon;
use app\common\model\UserCoupon;
use think\Db;

class Me extends Common{

    /**
     * 领取优惠券
     */
    public function takeCoupon(){
        if(request()->isPost()){
            $post = input('post.');

            // 检查是否领过优惠券
            $check = UserCoupon::where('uid', $this->uid)->find();
            if ($check) { return_ajax(400, '已经领过优惠券'); }

            $coupon = Coupon::where('id', $post['coupon_id'])->find();

            $data = [
                'uid'        => $this->uid,
                'coupon_id'  => $post['coupon_id'],
                'full_price' => $coupon['full_price'],
                'less_price' => $coupon['less_price'],
                'day'        => $coupon['day'],
                'type'       => $coupon['type'],
                'num'        => $coupon['num'],
                'start_time' => time(),
                'end_time'   => time() + ($coupon['day'] * 86400),
                'add_time'   => time(),
                'point'      => $coupon['point'],
                'day_time'   => time() + ($coupon['day'] * 86400),

            ];
            $rs = UserCoupon::insert($data);

            if ($rs){
                return_ajax(200, '获取成功', $rs);
            }else{
                return_ajax(400, '暂无优惠券');
            }
        }
    }
  
    /**
     * [coupon 优惠券]
     * @Author   谜一样的男人
     * @DateTime 2019-07-17
     * @return   [type]     [description]
     */
    public function coupon()
    {
        if(request()->isPost()){
            $post = input('post.');
            $time = time();
            if (empty($post['type'])){ return_ajax(400,'缺少必传参数type'); }
            if ($post['type'] == 3){
                $post['where'] = 'day_time < '.$time.' and uid='.$this->uid.'';
            }elseif ($post['type'] == 2){
                $post['where'] = 'status = 2 and uid='.$this->uid.'';
            }else{
                $post['where'] = 'status = 1 and day_time > '.$time.' and uid='.$this->uid.'';
            }

            $list = $this->selectAll('user_coupon',$post);
            if ($list){
                return_ajax(200,'获取成功',$list);
            }else{
                return_ajax(400,'暂无优惠券');
            }
        }
    }

    /**
     * [fans 我的粉丝]
     * @Author   谜一样的男人
     * @DateTime 2019-07-17
     * @return   [type]     [description]
     */
    public function fans()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['type'])){ return_ajax(400,'缺少必传参数type'); }
            if (empty($post['order'])){ return_ajax(400,'缺少必传参数order'); }

            $order['order'] = $post['order'];
            if ($post['type'] == 1){
                //获取一级粉丝
                $order['where'] = 'top_id = '.$this->uid.'';
            }else{
                //获取二级粉丝
                $top_id = User::where('top_id = '.$this->uid.'')->column('id');
                if (count($top_id) > 0){
                    $top_id = implode(',',$top_id);
                    $order['where'] = 'top_id in('.$top_id.')';
                }else{
                    return_ajax(400,'暂无二级粉丝');
                }
            }

            $order['field'] = 'id,nickname,head_img,number,top_id,grade_id,sex,add_time';
            $data = $this->selectAll('user',$order);
            $count = User::where($order['where'])->count();
            if ($data){
                return_ajax(200,'获取成功',$data,$count);
            }else{
                return_ajax(400,'暂无数据');
            }
        }
    }

    //我要代言
    public function speak()
    {
        if(request()->isPost()){
            $post = input('post.');
            $barcode = User::where('id',$this->uid)->value('barcode');
            if (!$barcode){
                //生成二维码
                $Weix = controller('Weix');
                $code = $Weix->wxqrcode($this->uid);
                User::where('id',$this->uid)->setField('barcode',$code);
            }
            $user = User::field('id,nickname,head_img,barcode,sex')->where('id',$this->uid)->find();
            $user['rule'] = Config::where('id',1)->value('rule');
            return_ajax(200,'获取成功',$user);
        }
    }

    //收藏
    public function collection()
    {
        if(request()->isPost()){
            $post = input('post.');
            $post['with'] = 'goods';
            $post['where'] = 'uid = '.$this->uid.'';
            $data = $this->selectAll('collect',$post);
            if ($data){
                return_ajax(200,'获取成功',$data);
            }else{
                return_ajax(400,'暂无收藏');
            }
        }
    }

    //取消收藏
    public function delete_collection()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])){ return_ajax(400,'缺少必传参数id'); }
            $where = 'id in('.$post['id'].')';
            $res = Collect::where($where)->delete();
            if ($res){
                return_ajax(200,'取消成功');
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    //我的生日
    public function birthday()
    {
        if(request()->isPost()){
            $post = input('post.');
            $birthday = User::where('id',$this->uid)->value('birthday');
            $content = Config::where('id',1)->value('birthday');
            if (!$birthday){
                $arr['content'] = $content;
                return_ajax(400,'暂未设置生日',$arr);
            }else{
                $birthday = explode('-',$birthday);
                $birthday['content'] = $content;
                return_ajax(200,'获取成功',$birthday);
            }
        }
    }

    //设置生日
    public function set_birthday()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['year'])){ return_ajax(400,'缺少必传参数year'); }
            if (empty($post['month'])){ return_ajax(400,'缺少必传参数month'); }
            if (empty($post['day'])){ return_ajax(400,'缺少必传参数day'); }

            $birthday = $post['year'].'-'.$post['month'].'-'.$post['day'];
            $res = User::where('id',$this->uid)->setField('birthday',$birthday);
            if ($res){
                return_ajax(200,'设置成功');
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    //邀请好友
    public function friend()
    {
        if(request()->isPost()){
            $post = input('post.');
            $data['new'] = User::field('id,head_img,sex')->where('top_id',$this->uid)->limit(10)->order('add_time desc')->select();
            $data['new_count'] =  User::field('id,head_img,sex')->where('top_id',$this->uid)->limit(10)->order('add_time desc')->count();
            $arr = User::field('id,head_img,sex')->where('top_id',$this->uid)->select();
            if (count($arr) > 0){
                foreach ($arr as $k=>$v){
                    $arr[$k]['pay_money'] = Order::where('uid',$arr[$k]['id'])->value('pay_money');
                    if (!$arr[$k]['pay_money']){
                        unset($arr[$k]);
                    }
                }
                $data['old'] = $arr;
                $data['old_count'] = count($arr);
            }else{
                $data['old'] = '';
                $data['old_count'] = 0;
            }
            return_ajax(200,'获取成功',$data);
        }
    }

    //领取邀请好友得到的佣金
    public function receive()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['new_uid'])) { return_ajax(400,'缺少必传参数new_uid');}
            $money = Config::where('id',1)->value('friend_money');
            $res = UserMoney::where(['uid'=>$this->uid,'new_uid'=>$post['new_uid']])->find();
            if ($res){
                return_ajax(400,'您已领取');
            }else{
                $res = price(1,$this->uid,$money,'邀请新用户奖励',$post['new_uid']);
                if ($res){
                   $head_img =  User::where('id',$post['new_uid'])->value('head_img');
                    return_ajax(200,'领取成功',$head_img);
                }else{
                    return_ajax(400,'领取失败');
                }
            }
        }
    }

    //签到
    public function sign()
    {
        if(request()->isPost()){
            $post = input('post.');
            $time = strtotime(date('Y-m-d 00:00:00',time()));
            $t = strtotime(date('Y-m-d 23:59:59',time()));
            $where = 'uid = '.$this->uid.' and add_time >= '.$time.' and add_time <= '.$t.'';
            $res = UserSign::where($where)->find();
            if ($res){
                return_ajax(400,'您今天已经签到过了');
            }else{
                $point = Config::where('id',1)->value('sign_point');
                $data = [
                    'uid'   => $this->uid,
                    'point'   => $point,
                ];
                $res = save('user_sign',$data,true);
                if ($res){
                    $res = point(1,$this->uid,$point,1,'每日签到');

                    //查询昨天是否签到过累计连续签到天数
                    $rs = UserSign::whereTime('add_time','yesterday')->find();

                    if ($rs) {
                        User::where('id',$this->uid)->setInc('today',1);
                    }else{
                        User::where('id',$this->uid)->setField('today',0);
                    }

                    $today = User::where('id',$this->uid)->value('today');

                    $p = SignConfig::where('today',$today)->value('point');
                    
                    if ($p){
                        point(1,$this->uid,$p,1,'连续签到');
                    }
                    return_ajax(200,'签到成功',$point);
                }else{
                    return_ajax(400,'网络繁忙');
                }
            }

        }
    }



    /**
     * 我的订单
     */
    public function order(){
        $uid  = $this->uid;
        $post = input('post.');
        $page = $post['page'] ? $post['page'] : '1';
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }

        if ($post['status']) {
            $where['status'] = $post['status'];
        }
        $where['uid'] = $uid;
        $where['is_deleted'] = '0';

        $field = "id, order_no, pay_money, status, add_time, refund_state";
        $data  = Db::name('order')->field($field)->where($where)->order('id desc')->page($page, '10')->select();
        $count  = Db::name('order')->where($where)->count('id');
        if ($data) {
            foreach ($data as $key => &$value) {
                $data[$key]['add_time'] = date('Y-m-d H:i:s', $value['add_time']);
                $data[$key]['child'] = Db::name('order_list')->where('order_id', $value['id'])->select();
                //$data[$key]['child']['goods_attr'] = json_decode($data[$key]['child']['goods_attr']);
            }
            return_ajax(200, '获取成功',$data, $count);
        }else{
            return_ajax(400, '无订单');
        }
    }

    /**
     * 删除订单
     */
    public function delOrder(){
        $post = input('post.');
        if (!$post['id']) {
            return_ajax(400, '缺少id');//订单id
        }
        $res = Db::name('order')->where('id', $post['id'])->delete();
        if ($res) {
            return_ajax(200, '已删除');
        }else{
            return_ajax(400, '删除失败');
        }
    }

    /**
     * 订单详情
     */
    public function orderDetail(){
        $post = input('post.');
        if (!$post['id']) {
            return_ajax(400, '缺少id');//订单id
        }
        $data = Db::name('order')->where('id', $post['id'])->order('id desc')->find();
        if ($data) {
            $data['end_time'] = $data['add_time'] + '1800';
            $data['add_time'] = date('Y-m-d H:i:s', $data['add_time']);
            $data['child']    = Db::name('order_list')->where('order_id', $data['id'])->select();
            foreach ($data['child'] as $key => &$value) {
                $data['child'][$key]['goods_attr'] = json_decode($value['goods_attr']);
            }
            return_ajax(200, '获取成功', $data);
        }else{
            return_ajax(400, '获取失败');
        }
    }


    //确认收货
    public function confirmOrder(){
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) {
                return_ajax(400,'缺少必传参数id');
            }
            $res = Db::name('order')->where(['id'=>$post['id'],'uid'=>$this->uid])->setField('status',4);
            if ($res){

                return_ajax(200,'操作成功');
            }else{
                return_ajax(400,'操作失败');
            }
        }
    }

    //申请售后
    public function orderRefund(){
        $uid  = $this->uid;
        $post = input('post.');
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        if (!$post['order_id']) {
            return_ajax(400, '缺少order_id');
        }
        if (!$post['order_no']) {
            return_ajax(400, '缺少order_no');
        }
        if (!$post['price']) {
            return_ajax(400, '缺少price');
        }
        if (!$post['images']) {
            return_ajax(400, '缺少images');
        }
        if (!$post['reason']) {
            return_ajax(400, '缺少reason');
        }
        if (!$post['refund_money']) {
            return_ajax(400, '缺少refund_money');
        }
        // if (!$post['explain']) {
        //     return_ajax(400, '缺少explain');
        // }
        $post['uid'] = $uid;
        $post['refund_no'] = $this->refund_no();
        $post['add_time']  = time();
        unset($post['token']);
        Db::startTrans();// 启动事务
        $res = Db::name('order_refund')->insert($post);
        $res_o = Db::name('order')->where('id', $post['order_id'])->update(['refund_state' => '1', 'status' => '5', 'update_time' => time()]);
        // echo $res_o;exit;

        if ($res && $res_o){
             Db::commit();//提交事务
            return_ajax(200,'提交成功');
        }else{
            Db::rollback();//回滚事务
            return_ajax(400,'提交失败');
        }  
        
    }


    // //申请售后
    // public function orderRefund()
    // {
    //     if(request()->isPost()){
    //         $post = input('post.');
    //         if (empty($post['order_id'])) { return_ajax(400,'缺少必传参数order_id'); }
    //         if (empty($post['goods_title'])) { return_ajax(400,'缺少必传参数goods_title'); }
    //         if (empty($post['goods_pic'])) { return_ajax(400,'缺少必传参数goods_pic'); }
    //         if (empty($post['goods_price'])) { return_ajax(400,'缺少必传参数goods_price'); }
    //         if (empty($post['order_sn'])) { return_ajax(400,'缺少必传参数order_sn'); }
    //         if (empty($post['discount'])) { return_ajax(400,'缺少必传参数discount'); }
    //         if (empty($post['type'])) { return_ajax(400,'缺少必传参数type'); }
    //         if (!empty($post['money'])){
    //             if ($post['money'] > $post['goods_price']){
    //                 return_ajax(400,'申请的金额不能超过实付金额');
    //             }
    //         }
    //         $post['uid'] = $this->uid;

    //         $res = save('limit_order_refund',$post,true);
    //         if ($res){
    //             LimitOrder::where('id',$post['order_id'])->setField('status',5);
    //             return_ajax(200,'申请成功');
    //         }else{
    //             return_ajax(400,'申请失败');
    //         }
    //     }
    // }

    
    /**
     * 评价
     */
    public function evaluate(){
        $uid  = $this->uid;
        $post = input('post.');
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        if (!$post['order_id']) {
            return_ajax(400, '缺少order_id');
        }
        if (!$post['content']) {
            return_ajax(400, '缺少content');
        }
        if (!$post['star']) {
            return_ajax(400, '缺少star');
        }
        $order_goods = Db::name('order_list')->where('order_id', $post['order_id'])->select();
        if ($order_goods) {
            $user = Db::name('user')->where('id', $uid)->find();
            $arr = [];
            foreach ($order_goods as $key => $value) {
                $arr[$key]['nickname']  = $user['nickname'];
                $arr[$key]['head_img']  = $user['head_img'];
                $arr[$key]['uid']       = $uid;
                $arr[$key]['order_id']  = $post['order_id'];
                $arr[$key]['content']   = $post['content'];
                $arr[$key]['star']      = $post['star'];

                $arr[$key]['goods_id']    = $value['goods_id'];
                $arr[$key]['goods_title'] = $value['goods_title'];
                $arr[$key]['add_time']    = time();
            }
            $res = Db::name('order_evaluate')->insertAll($arr);
            if ($res){
                return_ajax(200,'提交成功');
            }else{
                return_ajax(400,'提交失败');
            }
        }else{
            return_ajax(400,'提交失败');
        }
    }

    /**
     * 获取会员信息
     */
    public function getUserInfo(){
        $uid = $this->uid;
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        $user = Db::name('user')->where('id', $uid)->find();
        if ($user){
            $user['add_time'] = date('Y/m/d', $user['add_time']);
            $user['sign_point'] = UserSign::where('uid',$uid)->whereTime('add_time','today')->value('point');//查询当天签到获得的积分

            $user['grade_name'] = Db::name('user_grade')->where('id', $user['grade_id'])->value('title');

            $is_sign = Db::name('user_sign')->where('uid', $uid)->whereTime('add_time', 'today')->find();
            $user['is_sign'] = $is_sign ? '1' : '0';//1已签到；0未签到

            $msg_num = Db::name('msg_user')->where(['uid' => $uid, 'is_read' =>'0', 'flag' => '0'])->count('id');
            $user['msg_num'] = $msg_num ? $msg_num : '0';//未读消息数量
            
            $status1 = Db::name('order')->where(['uid' => $uid, 'status' => '1', 'is_deleted' => '0'])->count('id');
            $user['status1'] = $status1 ? $status1 : '0';//待付款数量
            $status2 = Db::name('order')->where(['uid' => $uid, 'status' => '2', 'is_deleted' => '0'])->count('id');
            $user['status2'] = $status2 ? $status2 : '0';//待发货数量
            $status3 = Db::name('order')->where(['uid' => $uid, 'status' => '3', 'is_deleted' => '0'])->count('id');
            $user['status3'] = $status3 ? $status3 : '0';//待收货数量
            $status4 = Db::name('order')->where(['uid' => $uid, 'status' => '4', 'is_deleted' => '0'])->count('id');
            $user['status4'] = $status4 ? $status4 : '0';//已完成数量
            $status5 = Db::name('order')->where(['uid' => $uid, 'status' => '5', 'is_deleted' => '0'])->count('id');
            $user['status5'] = $status5 ? $status5 : '0';//申请售后数量
            $status6 = Db::name('order')->where(['uid' => $uid, 'status' => '6', 'is_deleted' => '0'])->count('id');
            $user['status6'] = $status6 ? $status6 : '0';//已取消数量

            // $notice_num = Db::name('user_notice')->where('id', $uid)->where('is_read', '1')->count('id');
            // $user['notice_num'] = $notice_num ? $notice_num : '0';

            return_ajax(200,'提交成功', $user);
        }else{
            return_ajax(400,'提交失败');
        }
    }

    /**
     * 获取站内信
     */
    public function getMsg(){
        $uid  = $this->uid;
        $post = input('post.');
        $page = $post['page'] ? $post['page'] : '1';
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        $where['u.uid']     = $uid;
        $where['u.flag']    = '0';
        $where['u.is_read'] = $post['is_read'];

        $data = Db::name('msg_user')
            ->alias('u')
            ->join('msg m', 'u.msg_id = m.id')
            ->field('u.id, u.uid, u.msg_id, u.is_read, u.add_time, m.title, m.content')
            ->where($where)
            ->order('u.id desc')
            ->page($page, '10')
            ->select();
        $count = Db::name('msg_user')->alias('u')->join('msg m', 'u.msg_id = m.id')->where($where)->count('u.id');
        if ($data) {
            foreach ($data as $key => &$value) {
                $data[$key]['add_time'] = date('Y-m-d H:i:s', $value['add_time']);
            }
            return_ajax(200,'获取成功', $data, $count);
        }else{
            return_ajax(400,'暂无消息');
        }
    }

    /**
     * 全部已读
     */
    public function readHandel(){
        $uid  = $this->uid;
        $post = input('post.');
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        $res = Db::name('msg_user')->where('uid', $uid)->setField('is_read', '1');
        if ($res) {
            return_ajax(200,'操作成功', $res);
        }else{
            return_ajax(400,'操作失败');
        }
    }

    /**
     * 全部删除
     */
    public function delAll(){
        $post = input('post.');
        if (empty($post['id'])) {
            return_ajax(400, '缺少uid');
        }
        $res = Db::name('msg_user')->where('id', 'in', $post['id'])->delete();
        if ($res) {
            return_ajax(200,'删除成功', $res);
        }else{
            return_ajax(400,'删除失败');
        }
    }


/**
 * [order_sn 生成订单编号]
 * @Author   PengJun
 * @DateTime 2019-05-26
 * @return   [type]     [description]
 */
public function refund_no(){
    $refund_no = date('YmdHi').rand_number(0,999999);
    $is = Db::name('order_refund')->where('refund_no',$refund_no)->find();
    if($is){
        $this->refund_no();
    } else {
        return $refund_no;
    }
}




}
