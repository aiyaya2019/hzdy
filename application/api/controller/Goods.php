<?php
namespace app\api\controller;

use think\Db;
use \app\common\model\GoodsCount;


class Goods extends Common
{	

    /**
     * [index 商品列表]
     * @Author   PengJun
     * @DateTime 2019-05-14
     * @return   [type]     [description]
     */
    public function index()
    {   
        if(request()->isPost()){
            $post = input('post.');

            if (array_key_exists('keywords', $post)) {
                // $post['where']['title'] = $post['keywords'];
                $post['where']['title'] = ['like', '%' .$post['keywords'] .'%'];
            }


            if (array_key_exists('is_reco', $post)) {
                //推荐商品
                if($post['is_reco'] == 1){
                    $post['where']['is_reco'] = 2;
                }
            }
            if (array_key_exists('id', $post)) {
                //栏目所属商品
                $post['where']['nav_id'] = ['like', '%' .$post['id'] .'%'];
            }

            //价格排序
            switch ($post['sort']) {
                case 1:
                    # 价格高到低
                    $post['order'] = 'price desc';
                    break;
                case 2:
                    # 价格低到高
                    $post['order'] = 'price asc';
                    break;
                case 3:
                    # 销量高到低
                    // $post['sales'] = 'price desc';
                    $post['sales'] = 'pay_num desc';
                    break;
                case 4:
                    # 销量低到高
                    // $post['sales'] = 'price asc';
                    $post['sales'] = 'pay_num asc';
                    break;
            }
            $post['field'] = 'id,title,pic,sales,pay_num';
            if ($post['type_id']) {
                $post['where']['type_id'] = $post['type_id'];
            }
            
            $list = $this->selectAll('goods',$post);

            if ($list) {
                return_ajax(200, '获取成功', $list);
            }else{
                return_ajax(400, '暂无数据');
            }
        }
    }

	/**
     * [type 商品分类]
     * @Author   PengJun
     * @DateTime 2019-05-13
     * @return   [type]     [description]
     */
    public function type()
    {
        if(request()->isPost()){
            $post = input('post.');

            $post['where']['pid'] = 0;
            $post['field'] = 'id,title,pic';
            $post['with'] = 'this';
            $post['order'] = 'sort desc,add_time desc';
            $post['ispage'] = false;
            $list['type'] = $this->selectAll('goods_type',$post);

            return_ajax(200,'获取成功',$list);
        }
    }

    /**
     * 商品详情
     */
    public function detail(){
        $post = input('post.');
        $uid  = $this->uid;
        if (!$post['id']) {
            return_ajax(400, '缺少id');
        }
        if (!$uid) {
            return_ajax(400, '缺少uid');
        }
        $detail = Db::name('goods')->where('id', $post['id'])->find();
        if ($detail) {
            $detail['images'] = explode(',', $detail['images']);
            // $detail['label']  = $this->selectAll('goods_label', $detail['label_id']);
            $detail['desc']   = preg_replace('/src="(.*?)"/','src="'.$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER['SERVER_NAME'].'$1" style="width:100%;"',$detail['desc']);
            $is_collect = Db::name('collect')->where(['goods_id' => $post['id'], 'uid' => $uid])->find();
            $detail['is_collect'] = $is_collect ? '1' : '0';

            $car_num = Db::name('car')->where('uid', $uid)->sum('num');
            $detail['car_num'] = $car_num ? $car_num : '0';

            return_ajax(200,'获取成功', $detail);
        }else{
            return_ajax(400, '获取失败');
        }
    }

    //商品统计
    public function goods_count()
    {
        $post = input('post.');
        $uid  = $this->uid;

        if (empty($post['id'])) {
            return_ajax(400, '缺少id');
        }


        $goods = GoodsCount::whereTime('add_time','today')->where(['uid'=>$this->uid,'goods_id'=>$post['id']])->find();

        if ($goods){
            GoodsCount::where('id',$goods['id'])->setInc('visit');
            GoodsCount::where('id',$goods['id'])->setInc('number');
        }else{

            $data = [
                'goods_id'  => $post['id'],
                'uid'  => $this->uid,
                'visit'  => 1,
                'number'  => 1,
            ];
            $g = new GoodsCount;
            $g->allowField(true)->save($data);
        }
    }


/**
     * [spec 获取商品规格]
     * @Author   PengJun
     * @DateTime 2019-03-23
     * @return   [type]     [description]
     */
    public function spec()
    {
        if(request()->isPost()){
            $post = input('post.');

            if(empty($post['gid'])){ return_ajax(400,'缺少商品ID'); }

            $where['goods_id'] = $post['gid'];
            $list = model('GoodsAttr')->with('spec')->where($where)->field('id,title')->select();

            //$list = $this->selectAll('GoodsAttr',$data);

            return_ajax(200,'获取成功',$list);
        }
    }

    /**
     * [spec_money 获取商品规格价格]
     * @Author   PengJun
     * @DateTime 2019-03-23
     * @return   [type]     [description]
     */
    public function spec_money()
    {
        if(request()->isPost()){
            $post = input('post.');

            if(empty($post['attr'])){ return_ajax(400,'缺少规格信息'); }
            if(empty($post['gid'])){ return_ajax(400,'缺少商品ID'); }

            $data['where']['attr_spec'] = $post['attr'];
            $data['where']['goods_id'] = $post['gid'];
            $data['field'] = 'id,price,old_price,spec_name,fare_money,stock,pay_num';
            $list = $this->selectAll('GoodsVal',$data);

            if($list){
                return_ajax(200,'获取成功',$list);
            } else {
                return_ajax(400,'数据匹配错误!');
            }
            
        }
    }


    /**
     * 商品属性
     */
    public function goodsAttr(){
        $post = input('post.');
        if (!$post['goods_id']) {
            return_ajax(400, '缺少goods_id');
        }
        $data = Db::name('goods_spec')
            ->alias('s')
            ->field('s.id, s.title, s.goods_id, s.goods_attr_id, v.attr_spec, v.price, v.old_price, v.stock, v.pay_num, v.fare_money, v.id as vid')
            ->join('goods_val v', 's.goods_id = v.goods_id')
            ->where('s.goods_id', $post['goods_id'])
            ->fetchsql(false)
            ->select();

        if ($data) {
            return_ajax(200,'获取成功', $data);
        }else{
            return_ajax(400, '暂无评价');
        }
    }

    /**
     * 商品评价
     */
    public function goodsEvaluate(){
        $post = input('post.');
        if (!$post['goods_id']) {
            return_ajax(400, '缺少goods_id');
        }
        $page = $post['page'] ? $post['page'] : '1';
        // $wh = ['e.goods_id' => $post['goods_id'], 'e.is_deleted' => '0', 'e.status' => '1'];
        // $evaluate = Db::name('order_evaluate')
        //     ->alias('e')
        //     ->field('u.nickname, u.head_img, e.id, e.order_id, e.goods_id, e.goods_title, e.picture, e.content, e.add_time')
        //     ->join('user u', 'u.id = e.uid')
        //     ->where($wh)
        //     ->order('e.id desc')
        //     ->page($page, '5')
        //     ->select();

        $wh = ['goods_id' => $post['goods_id'], 'is_deleted' => '0', 'is_reply' => '0'];
        $evaluate = Db::name('order_evaluate')->where($wh)->order('id desc')->select();

        if ($evaluate) {
            foreach ($evaluate as $key => $value) {
                $evaluate[$key]['add_time'] = date('Y-m-d H:i:s', $value['add_time']);
                $evaluate[$key]['nickname'] = emojiDecode($evaluate[$key]['nickname']);
            }
            return_ajax(200,'获取成功', $evaluate);
        }else{
            return_ajax(400, '暂无评价');
        }
    }

    /**
     * 商品咨询与售后
     */
    public function goodsHelp(){
        $post = input('post.');
        $page = $post['page'] ? $post['page'] : '1';
        $data = Db::name('goods_help')->order('id desc')->page($page, '10')->select();
        if ($data) {
            return_ajax(200,'获取成功', $data);
        }else{
            return_ajax(400, '暂无评价');
        }
    }

    /**
     * 收藏/取消收藏
     */
    public function collect(){
        $post = input('post.');
        $uid  = $this->uid;
        if ($uid == null) {
            return_ajax(400, '缺少uid');//用户id
        }
        if (!$post['goods_id']) {
            return_ajax(400, '缺少goods_id');//商品id
        }

        $post['uid'] = $uid;

        unset($post['token']);

        // 检查是否已经收藏该商品
        $check = Db::name('collect')->where($post)->find();
        if ($check) {
            $res = Db::name('collect')->where($post)->delete();
        }else{
            $post['add_time'] = time();
            $res = Db::name('collect')->insert($post);
        }
        if ($res) {
            return_ajax(200, '操作成功', $res);
        }else{
            return_ajax(400, '操作失败');
        }
    }

    /**
     * 满减活动
     */
    public function getDiscount(){
        $data = Db::name('discount')->where('status', '1')->order('less_price asc')->select();
        if ($data) {
            return_ajax(200, '获取成功', $data);
        }else{
            return_ajax(400, '获取失败');
        }
    }
























}
