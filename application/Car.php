<?php
namespace app\api\controller;

use think\Db;

class Car extends Common{

    /**
     * 添加购物车
     */
    public function addCar(){
        $post = input('post.');
        $car_model = new Car;

        if (!$post['uid']) {
            return_ajax(400, '缺少uid');//用户id
        }
        if (!$post['goods_id']) {
            return_ajax(400, '缺少goods_id');//商品id
        }
        if ($post['goods_name'] == null) {
            return_ajax(400, '缺少goods_name');//商品名称
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

        $post['goods_attr'] = json_encode($post['goods_attr']);

        $where['uid'] = $post['uid'];
        $where['goods_id'] = $post['goods_id'];

        // 检查是否已收藏该商品
        $check = Db::name('car')->where($where)->fetchsql(false)->find();

        if ($check) {
            if ($post['num'] == '0') {
                $res = Db::name('car')->where($where)->delete();
            }else{
                $res = Db::name('car')->where($where)->update(['num' => $post['num'], 'update_time' => time()]);
            }
        }else{

            if ($post['num'] == '0') {
                return_ajax(400, '请添加数量');//数量
            }

            $post['add_time'] = time();
            $res = Db::name('car')->insert($post);
        }
        if ($res) {
            return_ajax(200, '操作成功', $res);
        }else{
            return_ajax(400, '操作失败');
        }
    }

    /**
     * 购物车列表
     */
    public function lst(){
        $post = input('post.');
        $car_model = new Car;
        if (!$post['uid']) {
            return_ajax(400, '缺少uid');//用户id
        }

        $data = Db::name('car')->where('uid', $post['uid'])->select();
        if ($data) {
            $data['goods_attr'] = json_decode($data['goods_attr']);
            return_ajax(200, '操作成功', $data);
        }else{
            return_ajax(400, '暂无数据');
        }
    }

    /**
     * 删除单个购物车商品
     */
    public function delOne(){
        $post = input('post.');
        $car_model = new Car;
        if (!$post['id']) {
            return_ajax(400, '缺少id');//购物车id
        }

        $res = Db::name('car')->where('id', $post['id'])->delete();
        if ($res) {
            return_ajax(200, '删除成功', $res);
        }else{
            return_ajax(400, '删除失败');
        }
    }

    /**
     * 删除多个购物车商品
     */
    public function delMores(){
        $post = input('post.');
        $car_model = new Car;
        if (empty($post['id'])) {
            return_ajax(400, '缺少id');//购物车id
        }

        $res = Db::name('car')->where('id', 'in', $post['id'])->delete();
        if ($res) {
            return_ajax(200, '删除成功', $res);
        }else{
            return_ajax(400, '删除失败');
        }
    }

    /**
     * 选择购物车商品 返回总价格
     */
    public function returnPrice(){
        $post = input('post.');
        $car_model = new Car;
        if (empty($post['id'])) {
            return_ajax(400, '缺少id');//购物车id
        }

        $data = Db::name('car')->where('id', 'in', $post['id'])->select();
        if ($data) {
            $all_price = '0.00';
            foreach ($data as $key => $value) {
                $all_price = $all_price + $value['num'] * $value['goods_price'];
            }
            return_ajax(200, '获取成功', $data, sprintf('%.2f', $all_price));
        }else{
            return_ajax(400, '获取失败');
        }
    }
    
    






















}
