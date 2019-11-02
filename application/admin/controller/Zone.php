<?php
namespace app\admin\controller;

Class Zone extends Common{

	/**
	 * [index 肌肤类型列表]
	 * @Author   PengJun
	 * @DateTime 2019-05-05
	 * @return   [type]     [description]
	 */
    public function index()
    {
    	if(request()->isPost()){
    		$post = input('post.');

    		$post['order'] = 'sort desc,add_time desc';
    		$list = $this->selectAll('skin',$post);

    		return_ajax(200,'获取成功',$list['list'],$list['count']);
    	}
    	return $this->fetch();
    }

    /**
     * [save 新增/编辑肌肤类型]
     * @Author   PengJun
     * @DateTime 2019-05-05
     * @return   [type]     [description]
     */
    public function save()
    {
    	$id = input('id');

    	if(request()->isPost()){
    		$post = input('post.');

    		//封面上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }
            
    		$list = $this->saves('skin',$post);
    	}

    	$list = $this->getFind('skin',$id);

    	return $this->fetch('',[
    		'list' => $list
    	]);
    }

    /**
     * [comb 组合列表]
     * @Author   PengJun
     * @DateTime 2019-05-06
     * @return   [type]     [description]
     */
    public function comb()
    {
        if(request()->isPost()){
            $post = input('post.');

            $post['where']['skin_id'] = $post['id'];
            $post['with'] = 'goods,old_goods';
            $list = $this->selectAll('skin_goods',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }

        return $this->fetch();
    }

    /**
     * [comb_save 添加/编辑组合]
     * @Author   PengJun
     * @DateTime 2019-05-06
     * @return   [type]     [description]
     */
    public function comb_save()
    {

        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            $list = $this->saves('skin_goods',$post);
        }

        $list = $this->getFind('skin_goods',$id);
        $goods = $this->selectAll('goods');

        return $this->fetch('',[
            'list'  => $list,
            'goods' => $goods['list'],
        ]);
    }

    /**
     * [zone 专区推荐]
     * @Author   PengJun
     * @DateTime 2019-05-06
     * @return   [type]     [description]
     */
    public function zone()
    {
        if(request()->isPost()){
            $post = input('post.');

            $post['order'] = 'sort desc,add_time desc';
            $list = $this->selectAll('zone',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }

        return $this->fetch();
    }

    /**
     * [zone_goods 专区商品]
     * @Author   PengJun
     * @DateTime 2019-05-06
     * @return   [type]     [description]
     */
    public function zone_goods()
    {
        if(request()->isPost()){
            $post = input('post.');

            $post['where']['zone_id'] = $post['id'];
            $list = $this->selectAll('zone_goods',$post);
            foreach($list['list'] as $vo){
                $goods_id[] = $vo['goods_id'];
            }

            $data['where']['id'] = ['IN',$goods_id];
            $data['field'] = 'id,title,pic';
            $list = $this->selectAll('goods',$data);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }

        return $this->fetch();
    }

    /**
     * [save 新增/编辑专区]
     * @Author   PengJun
     * @DateTime 2019-05-05
     * @return   [type]     [description]
     */
    public function zone_save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            //封面上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }

            //详情展示图
            if(request()->file('pics')){
                $file = imgUpdate('pics');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pics'] = $file['data'];
            }
            
            $list = $this->saves('zone',$post);
        }

        $list = $this->getFind('zone',$id);

        return $this->fetch('',[
            'list' => $list
        ]);
    }
}