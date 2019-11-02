<?php
namespace app\api\controller;
use app\common\model\PointChange;
use app\common\model\PointGoods;
use app\common\model\PointOrder;
use app\common\model\User;
use app\common\model\Coupon;


class Point extends Common
{

    /**
     * [index 积分中心]
     * @Author   谜一样的男人
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function index()
    {
        if(request()->isPost()){

            $post = input('post.');
            $data = PointChange::where('uid',$this->uid)->select();
            $point = User::where('id',$this->uid)->value('point');
            if ($data){
                return_ajax(200,'获取成功',$data,$point);
            }else{
                return_ajax(400,'暂无数据');
            }
        }
    }

    /**
     * [goods 积分商品]
     * @Author   谜一样的男人
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function goods()
    {
        if(request()->isPost()){
            $post = input('post.');
            $post['field'] = '*';
            $post['count'] = 10;
            $post['where'] = 'status = 1';
            if (!empty($post['title'])){

                $post['where'] = 'title like "%'.$post['title'].'%"';
            }
            $data = $this->selectAll('point_goods',$post);
            if ($data){
                return_ajax(200,'获取成功',$data);
            }else{
                return_ajax(400,'暂无数据');
            }
        }
    }

    /**
     * [details 积分商品详情]
     * @Author   谜一样的男人
     * @DateTime 2019-07-13
     * @return   [type]     [description]
     */
    public function details()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }
            $data = $this->getFind('point_goods',$post['id']);
            $data['desc'] = str_replace('src="/uploads','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['HTTP_HOST'].'/uploads/',$data['desc']);
            $data['desc'] = str_replace('<img',"<img style='width:100%'",$data['desc']);
            if ($data){
                return_ajax(200,'获取成功',$data);
            }else{
                return_ajax(400,'暂无数据');
            }
        }
    }

    //下单
    public function add_order()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少商品id'); }
            if (empty($post['type'])) { return_ajax(400,'缺少必传参数type'); }

            if ($post['type'] == 1){
                //获取
                $post['field'] = 'id,title,pic,point';
                $post['where']['id'] = $post['id'];
                $list = $this->getFind('point_goods',$post);
                return_ajax(200,'获取成功',$list);
            }else{
                //添加
                if (empty($post['goods_pic'])) { return_ajax(400,'缺少必传参数goods_pic'); }
                if (empty($post['goods_title'])) { return_ajax(400,'缺少必传参数goods_title'); }
                if (empty($post['point'])) { return_ajax(400,'缺少必传参数point'); }
                if (empty($post['name'])) { return_ajax(400,'请输入收货人姓名'); }
                if (empty($post['tel'])) { return_ajax(400,'请输入电话'); }
                if (empty($post['address'])) { return_ajax(400,'请输入详细地址'); }
                $point = User::where('id',$this->uid)->value('point');//判断积分
                if ($point < $post['point']){
                    return_ajax(400,'积分不足');
                }

                $point_goods = PointGoods::where('id',$post['id'])->find();
                $grade_id = User::where('id',$this->uid)->value('grade_id');//判断等级
                if ($grade_id != $point_goods['grade_id']){
                    return_ajax(400,'您的等级不符合兑换该商品');
                }

                //判断是否限兑一件
                if ($point_goods['limit_status'] == 1){
                   $rs =  PointOrder::where(['goods_id'=>$post['id'],'uid'=>$this->uid])->find();
                   if ($rs){
                       return_ajax(400,'亲，该商品限兑一件哦');
                   }
                }

                $post['order_sn'] = order_sn('point_order');
                $post['uid'] = $this->uid;
                $post['goods_id'] = $post['id'];
                unset($post['id']);
                $res = save('point_order',$post,true);
                if ($res){
                    point(2,$this->uid,'-'.$post['point'],2,'兑换商品');
                    PointGoods::where('id',$post['goods_id'])->setInc('num',1);
                    PointGoods::where('id',$post['goods_id'])->setDec('stock',1);
                    return_ajax(200,'兑换成功',$res);
                }else{
                    return_ajax(400,'兑换失败',$res);
                }
            }
        }
    }

    //获取订单列表
    public function order()
    {

            if(request()->isPost()){

                $post = input('post.');
                $post['count'] = 10;
                $data = PointOrder::field('id,order_sn,goods_title,goods_pic,point,status,add_time')->order('add_time desc')->where('uid',$this->uid)->select();

                if ($data){
                    return_ajax(200,'获取成功',$data);
                }else{
                    return_ajax(400,'暂无订单');
                }

            }

    }


    //订单详情
    public function order_details()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }
            $res = PointOrder::where('id',$post['id'])->find();
            $res['logistics_time'] = date('Y-m-d H:i:s',$res['logistics_time']);
            if ($res){
                return_ajax(200,'获取成功',$res);
            }else{
                return_ajax(400,'网络繁忙');
            }
        }
    }

    //优惠券
    public function coupon()
    {
        if(request()->isPost()){
            $post = input('post.');
            $post['count'] = 10;
            $time = time();
            $post['where'] = 'point_status = 1 and end_time > '.$time.'';
            $data = $this->selectAll('coupon',$post);
            if ($data){
                //查询当前用户的积分
                $point = User::where('id',$this->uid)->value('point');
                foreach ($data as $k=>$v){
                    if ($point < $data[$k]['point']){
                        $data[$k]['status'] = 2;
                    }else{
                        $data[$k]['status'] = 1;
                    }
                }
                return_ajax(200,'获取成功',$data);
            }else{
                return_ajax(400,'暂无优惠券');
            }
        }
    }

    //立即兑换
    public function coupon_exchange()
    {
        if(request()->isPost()){
            $post = input('post.');
            if (empty($post['id'])) { return_ajax(400,'缺少必传参数id'); }
            if (empty($post['full_price'])) { return_ajax(400,'缺少必传参数full_price'); }
            if (empty($post['less_price'])) { return_ajax(400,'缺少必传参数less_price'); }
            if (empty($post['day'])) { return_ajax(400,'缺少必传参数day'); }
//            if (empty($post['point'])) { return_ajax(400,'缺少必传参数point'); }
            if (empty($post['start_time'])) { return_ajax(400,'缺少必传参数start_time'); }
            if (empty($post['end_time'])) { return_ajax(400,'缺少必传参数end_time'); }
            //查出优惠券需要的积分
            $point = Coupon::where('id',$post['id'])->value('point');
            //查出用户当前的积分
            $user_point = User::where('id',$this->uid)->value('point');
            if ($user_point < $point){
                return_ajax(400,'积分不足');
            }
            $post['coupon_id'] = $post['id'];
            $post['uid'] = $this->uid;
            $post['add_time'] = time();
            $post['day_time'] = $post['add_time'] * $post['day'] * 24 * 3600;
            unset($post['id']);
            $res = save('user_coupon',$post,true);
            if ($res){
                point(4,$this->uid,'-'.$post['point'],2,'兑换优惠券');
                return_ajax(200,'兑换成功');
            }else{
                return_ajax(400,'兑换失败');
            }
        }
    }

}
