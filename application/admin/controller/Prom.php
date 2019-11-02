<?php
namespace app\admin\controller;
use app\common\model\Discount;
use app\common\model\UserDiscount;
use app\common\model\GoodsDiscount;
use app\common\model\Coupon;
use app\common\model\User as UserModel;
use think\Db;

Class Prom extends Common{

	/**
     * [index 满减列表]
     * @Author   PengJun
     * @DateTime 2019-03-23
     * @return   [type]     [description]
     */
    public function index()
    {
        if(request()->isPost()){
            $post = input('post.');

            $post['order'] = 'full_price asc';
            $list = $this->selectAll('Discount',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }
        return $this->fetch();
    }

    /**
     * [save 添加/编辑满减活动]
     * @Author   PengJun
     * @DateTime 2019-03-23
     * @return   [type]     [description]
     */
    public function save(){   
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            $post['add_time'] = time();
            $post['update_time'] = time();
            $post['start_time']  = strtotime($post['start_time']);
            $post['end_time']    = strtotime($post['end_time']);
            $post['time'] = ($post['end_time']-$post['start_time']) / '86400';

            if($post['goods_type'] == 2){//指定商品可用
                if(empty($post['goods_type'])){ return_ajax(400,'请选择指定商品'); }
                if(empty($post['goods_id'])){ return_ajax(400,'请选择指定商品'); }
                $goods_id = $post['goods_id'];
            }
            unset($post['goods_id']);

            if ($post['id']) {
                $id = $post['id'];
                unset($post['id']);
                $save = Db::name('discount')->where('id', $id)->update($post);
                $rs_del = Db::name('goods_discount')->where('dis_id', $id)->delete();
                if ($post['goods_type'] == 2){//指定商品可用
                    $post['goods_id'] = $goods_id;
                    $post['dis_id']   = $id;
                    $rs = Db::name('goods_discount')->insert($post);
                }else{
                    $goods = Db::name('goods')->select();
                    if ($goods) {
                        foreach ($goods as $key => $value) {
                            $data[] = [
                                'dis_id'     => $id,
                                'goods_id'   => $value['id'],
                                'full_price' => $post['full_price'],
                                'less_price' => $post['less_price'],
                                'start_time' => $post['start_time'],
                                'end_time'   => $post['end_time'],
                                'time'       => $post['time'],
                                'goods_type' => $post['goods_type'],
                                'add_time'   => time(),
                                'update_time' => time(),
                            ];
                        }
                        $rs = Db::name('goods_discount')->insertAll($data);
                    }
                }

            }else{
                $save = Db::name('discount')->insert($post);
                $last_id = Db::name('discount')->getLastInsID();
                if ($save) {
                    if ($post['goods_type'] == 2) {//指定商品可用
                        $post['goods_id'] = $goods_id;
                        $post['dis_id'] = $last_id;
                        $rs = Db::name('goods_discount')->insert($post);
                    }else{
                        $goods = Db::name('goods')->select();
                        if ($goods) {
                            foreach ($goods as $key => $value) {
                                $data[] = [
                                    'dis_id'     => $last_id,
                                    'goods_id'   => $value['id'],
                                    'full_price' => $post['full_price'],
                                    'less_price' => $post['less_price'],
                                    'start_time' => $post['start_time'],
                                    'end_time'   => $post['end_time'],
                                    'time'       => $post['time'],
                                    'goods_type' => $post['goods_type'],
                                    'add_time'   => time(),
                                    'update_time' => time(),
                                ];
                            }
                            $rs = Db::name('goods_discount')->insertAll($data);
                        }
                    }
                }
            }
            return_ajax(200,'操作成功');






        }

        $list = Db::name('discount')->where('id', $id)->find();
        if ($list) {
            $list['start_time'] = date('Y-m-d H:i:s',$list['start_time']);
            $list['end_time']   = date('Y-m-d H:i:s',$list['end_time']);
            if ($list['goods_type'] = '2') {
                $da = Db::name('goods_discount')->where('dis_id', $list['id'])->find();
                $list['goods_id'] = $da['goods_id'];
            }
        }
        
        $goods = Db::name('goods')->where('is_show', '1')->order('id desc')->select();

        return $this->fetch('',[
            'list'  => $list,
            'goods' => $goods
        ]);
    }

    public function save_bak()
    {   
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $this->saves('Discount',$post);
        }

        $list = Discount::get($id);
        $goods = Db::name('goods')->where('is_show', '1')->order('id desc')->select();

        return $this->fetch('',[
            'list' => $list,
            'goods' => $goods
        ]);
    }

    /**
     * [coupon 优惠劵]
     * @Author   PengJun
     * @DateTime 2019-03-25
     * @return   [type]     [description]
     */
    public function coupon()
    {
        if(request()->isPost()){
            $post = input('post.');

            // $post['order'] = 'full_price asc';
            $list = $this->selectAll('Coupon',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }

        return $this->fetch();
    }

    /**
     * [coupon_save 添加优惠劵]
     * @Author   PengJun
     * @DateTime 2019-03-25
     * @return   [type]     [description]
     */
    public function coupon_save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            if($post['goods_type'] == 2){//指定商品可用
                if(empty($post['goods_type'])){ return_ajax(400,'请选择指定商品'); }
            }
            
            if($post['type'] == 2){
                if(empty($post['uid'])){ return_ajax(400,'请选择要发放的用户'); }
                $post['start_time'] = time();
                $post['end_time'] = time();
                unset($post['grade_id']);
                unset($post['goods_type']);
                unset($post['goods_id']);
            } else {
                $post['start_time'] = strtotime($post['start_time']);
                $post['end_time'] = strtotime($post['end_time']);
            }

            $save = $this->saves('Coupon',$post,true);

            if($save){
                //如果是指定用户 就给用户添加优惠劵
                if($post['type'] == 2){
                    $uid = explode(',',$post['uid']);
                    foreach($uid as $vo){
                        $data[] = [
                            'uid'        => $vo,
                            'coupon_id'  => $save,
                            'full_price' => $post['full_price'],
                            'less_price' => $post['less_price'],
                            'day'        => $post['day'],
                            'type'       => $post['type'],
                            'num'        => $post['num'],
                            'start_time' => time(),
                            'end_time'   => time() + ($post['day'] * 86400),
                            'add_time'   => time(),
                            'point'      => $post['point'],
                            'day_time'   => time() + ($post['day'] * 86400),
                            // 'update_time' => time(),

                        ];
                    }
                    // $UserCoupon = new UserCoupon;
                    // $UserCoupon->saveAll($data);
                    $rs = Db::name('user_coupon')->insertAll($data);
                }
                return_ajax(200,'操作成功');
            } else {
                return_ajax(400,'操作失败，请稍后重试');
            }
        }

        $list  = Coupon::get($id);
        $user  = UserModel::select();
        $grade = Db::name('user_grade')->select();
        $goods = Db::name('goods')->where('is_show', '1')->order('id desc')->select();

        return $this->fetch('',[
            'list'  => $list,
            'user'  => $user,
            'grade' => $grade,
            'goods' => $goods,
        ]);
    }

    /**
     * 优惠券开启&关闭
     */
    public function changeStatus(){
        if(request()->isPost()){
            $post  = input('post.');

            $arr = [
                'status'      => $post['status'],
                'update_time' => time(),
            ];

            Db::startTrans();// 启动事务

            $rs_goods_d = GoodsDiscount::where('dis_id', $post['id'])->update($arr);
            $rs_d       = Discount::where('id', $post['id'])->update($arr);
            if ($rs_goods_d && $rs_d) {
                Db::commit();// 提交事务
                return_ajax(200, '操作成功');
            }else{
                Db::rollback();// 回滚事务
                return_ajax(400,'操作失败');
            }
        }
    }













}