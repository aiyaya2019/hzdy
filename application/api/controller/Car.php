<?php
namespace app\api\controller;

use think\Db;

class Car extends Common{

    /**
     * 添加购物车
     */
    public function addCar(){
        $post = input('post.');
        $uid  = $this->uid;

        if (!$uid) {
            return_ajax(400, '缺少uid');//用户id
        }
        if (!$post['goods_id']) {
            return_ajax(400, '缺少goods_id');//商品id
        }
        if ($post['goods_title'] == null) {
            return_ajax(400, '缺少goods_title');//商品名称
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
        if ($post['attr'] == null) {
            return_ajax(400, '缺少attr');//
        }

        $post['goods_attr'] = json_encode($post['goods_attr']);

        $where['uid'] = $uid;
        $where['goods_id'] = $post['goods_id'];

        unset($post['token']);

        $goods = Db::name('goods')->where('id', $post['goods_id'])->find();
        if ($goods['quota'] != '0' && $post['num'] > $goods['quota']) {
            return_ajax(400, '该商品限购' .$goods['quota'] .'份');//数量
        }

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
            $post['uid'] = $uid;
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
     * 更新购物车 单个选择 加减数量
     */
    public function updateCar(){
        $post = input('post.');
        $uid  = $this->uid;
        if (!$post['id']) {
            return_ajax(400, '缺少id');//购物车id
        }
        if ($post['num'] < '1') {
            return_ajax(400, 'num不能少于1');
        }
        if ($post['checked'] === null) {
            return_ajax(400, '缺少checked');
        }

        $car   = Db::name('car')->where('id', $post['id'])->find();
        $goods = Db::name('goods')->where('id', $car['goods_id'])->find();
        if ($goods['quota'] != '0' && $post['num'] > $goods['quota']) {
            return_ajax(400, '该商品限购' .$goods['quota'] .'份');//数量
        }

        $res = Db::name('car')->where('id', 'in', $post['id'])->update(['num' => $post['num'], 'checked' => $post['checked'], 'update_time' => time()]);
        if ($res) {
            return_ajax(200, '操作成功');
        }else{
            return_ajax(400, '操作失败');
        }
    }

    /**
     * 全选 更改选中状态
     */
    public function checkedAll(){
        $post = input('post.');
        if (empty($post['id'])) {
            return_ajax(400, '缺少id');//购物车id
        }
        if ($post['checked'] === null) {
            return_ajax(400, '缺少checked');
        }

        $res = Db::name('car')->where('id', 'in', $post['id'])->update(['checked' => $post['checked'], 'update_time' => time()]);
        if ($res) {
            return_ajax(200, '操作成功');
        }else{
            return_ajax(400, '操作失败');
        }
    }


    /**
     * 选择购物车商品 返回总价格
     */
    public function returnPrice(){
        $uid  = $this->uid;
        $data = Db::name('car')->where('uid', $uid)->where('checked', '1')->select();
        if ($data) {
            $all_price = '0.00';
            foreach ($data as $key => $value) {

                $w['goods_id']  = $value['goods_id'];
                $w['attr_spec'] = $value['attr'];
                $check_stock = Db::name('goods_val')->where($w)->value('stock');
                if (!$check_stock) {
                    return_ajax(400, '库存不足');
                }

                $all_price = $all_price + $value['num'] * $value['goods_price'];
            }
            return_ajax(200, '获取成功', $data, sprintf('%.2f', $all_price));
        }else{
            return_ajax(400, '获取失败');
        }
    }

    /**
     * 购物车列表
     */
    public function lst(){
        $post = input('post.');
        $uid  = $this->uid;
        if (!$uid) {
            return_ajax(400, '缺少uid');//用户id
        }
        $page = $post['page'] ? $post['page'] : '0';

        $data = Db::name('car')->where('uid', $uid)->order('id desc')->page($page, '10')->select();
        if ($data) {
            foreach ($data as $key => &$value) {

                $w['goods_id']  = $value['goods_id'];
                $w['attr_spec'] = $value['attr'];
                $new_stock = Db::name('goods_val')->where($w)->value('stock');
                $data[$key]['new_stock'] = $new_stock;

                if ($value['goods_attr']) {
                    $data[$key]['goods_attr'] = json_decode($value['goods_attr']);
                }
            }
            
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

    
    






















}
