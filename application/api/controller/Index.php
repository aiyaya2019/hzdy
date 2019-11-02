<?php
namespace app\api\controller;
use app\common\model\Goods;
use app\common\model\Adv;
use app\common\model\Popup;

use think\Db;

class Index extends Common
{

    //首页轮播图
    public function banner()
    {
        if(request()->isPost()){
            $arr['order'] = 'sort desc';
            $banner = $this->selectAll('banner',$arr);
            if ($banner){
                return_ajax(200,'获取成功',$banner);
            }else{
                return_ajax(400,'暂无数据');
            }
        }
    }
	
    /**
     * [zone 获取专区]
     * @Author   PengJun
     * @DateTime 2019-05-13
     * @return   [type]     [description]
     */
    public function zone()
    {
        if(request()->isPost()){
            $post = input('post.');

            $post['order'] = 'sort desc,add_time desc';
            $post['field'] = 'id,title,pic,desc';
            $list = $this->selectAll('zone',$post);

            foreach($list as &$vo){
                $goods_id = model('zone_goods')->where(['zone_id'=>$vo['id'],'is_reco'=>2])->column('goods_id');
                $field = 'id,title,pic';
                $vo['goods'] = Goods::where('id','in',$goods_id)->field($field)->order('add_time desc')->select();
            }

            return_ajax(200,'获取成功',$list);
        }
    }

    /**
     * [zone_info 专区详情]
     * @Author   PengJun
     * @DateTime 2019-05-13
     * @return   [type]     [description]
     */
    public function zone_info()
    {
        if(request()->isPost()){
            $post = input('post.');

            //专区信息
            $post['field'] = 'id,pics';
            $post['where']['id'] = $post['id'];
            $list['zone'] = $this->getFind('zone',$post);
            //商品信息
            $goods_id = model('zone_goods')->where(['zone_id'=>$post['id']])->column('goods_id');
            $post['field'] = 'id,title,pic';
            $post['where']['id'] = ['IN',$goods_id];
            $list['goods'] = $this->selectAll('goods',$post);

            return_ajax(200,'获取成功',$list);
        }
    }

    /**
     * [skin 肌肤类型]
     * @Author   PengJun
     * @DateTime 2019-05-13
     * @return   [type]     [description]
     */
    public function skin()
    {   
        if(request()->isPost()){
            $post = input('post.');

            $post['field'] = 'id,title';
            $post['order'] = 'sort desc,add_time desc';
            $list = $this->selectAll('skin',$post);

            return_ajax(200,'获取成功',$list);
        }
    }

    /**
     * [skin_goods 肌肤商品]
     * @Author   PengJun
     * @DateTime 2019-05-13
     * @return   [type]     [description]
     */
    public function skin_goods()
    {
        if(request()->isPost()){
            $post = input('post.');

            $user = $this->getUser('skin_id');

            $post['order'] = 'sort desc,add_time desc';
            $post['field'] = 'id,title,pic,desc';
            $post['where']['id'] = ['IN',$user['skin_id']];
            $list = $this->selectAll('skin',$post);

            foreach($list as &$vo){
                $data['where']['skin_id'] = $vo['id'];
                $data['with'] = 'goods,oldgoods';
                $data['field'] = 'id,goods_id,old_goods_id,crowd,desc';
                $vo['goods'] = $this->selectAll('skin_goods',$data);
            }

            return_ajax(200,'获取成功',$list);
        }
    }

    /**
     * [skin_info 肌肤详情]
     * @Author   PengJun
     * @DateTime 2019-05-13
     * @return   [type]     [description]
     */
    public function skin_info()
    {
        if(request()->isPost()){
            $post = input('post.');

            //商品信息
            $post['where']['skin_id'] = $post['id'];
            $post['with'] = 'goods,oldgoods';
            $post['field'] = 'id,goods_id,old_goods_id';
            $list['goods'] = $this->selectAll('skin_goods',$post);

            return_ajax(200,'获取成功',$list);
        }

    }

    /**
     * 首页导航
     */
    public function indeNav(){
        $data = Db::name('index_nav')->where('status', '1')->select();
        if ($data) {
            return_ajax(200,'获取成功',$data);
        }else{
            return_ajax(400,'无数据');
        }
    }

    /**
     * 导航详情页
     */
    public function navDetail(){
        $post = input('post.');
        if (!$post['id']) {
            return_ajax(400,'缺少id');
        }
        $data = Db::name('index_nav')->where('id', $post['id'])->find();
        if ($data) {
            $data['images'] = explode($data['images']);
            return_ajax(200,'获取成功',$data);
        }else{
            return_ajax(400,'无数据');
        }
    }

    /**
     * 广告图片
     */
    public function adv(){
        // $adv = $this->selectAll('adv');
        $where['type']   = '1';
        $where['status'] = '1';
        $adv = Adv::where($where)->limit('1')->order('id desc')->select();

        return_ajax(200,'获取成功',$adv);
    }

    /**
     * 首页弹窗
     */
    public function popup(){
        $post = input('post.');
        if (!$post['type']) {
            return_ajax(400,'缺少type');
        }
        $data = Popup::where('type', $post['type'])->order('id desc')->find();
        return_ajax(200,'获取成功',$data);
    }












}
