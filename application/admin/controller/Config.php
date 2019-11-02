<?php
namespace app\admin\controller;
use app\common\model\Banner;
use app\common\model\Config as ConfigModel;
use app\common\model\IndexNav;
use app\common\model\Adv;
use app\common\model\Popup;
use app\common\model\SignConfig;

Class Config extends Common{

	/**
	 * [index 基础配置]
	 * @Author   PengJun
	 * @DateTime 2019-02-28
	 * @return   [type]     [description]
	 */
	public function index()
	{
        if(request()->isPost()){
        	$post = input('post.');
        	$config = new ConfigModel;

        	if(request()->file('file')){
        		$file = imgUpdate('file');
        		if($file['code'] == 400){ return_ajax(400,$file['msg']); }
        		$post['share_pic'] = $file['data'];
        	}

        	$post['update_time'] = time();
        	if($config->allowField(true)->save($post,['id'=>1])){
        		return_ajax(200,'修改成功');
        	} else {
        		return_ajax(400,'修改失败！请稍后重试');
        	}
        }

        $config = ConfigModel::get(1);

		return $this->fetch('',[
			'config' => $config,
		]);
	}

    /**
     * 轮播图控制器
     */
    public function banner()
    {
        if(request()->isAjax()) {
            $post = $this->request->post();
            $where['type'] = 1;
            if(!empty($post['title'])) $where['title'] = ['like','%'.$post['title'].'%'];

            $baner = Banner::where($where)->order('sort desc')->select();
            return_ajax(200,'获取成功',$baner);
        }
        return $this->fetch();
    }

    /**
     * 添加轮播图
     * @author vevay
     * @time: 2019/7/1 9:42
     */
    public function save()
    {
        $id = input('id');
        if(request()->isPost()){
            $post = input('post.');
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }
            // 保存数据
            save('Banner',$post);
        }
        $data = Banner::get($id);
        return $this->fetch('',['data'=>$data]);
    }

    /**
     * 删除轮播图
     * @author vevay
     * @time: 2019/7/1 9:43
     */
    public function dele()
    {
        $post = input('post.');

        if(empty($post['id'])){ return_ajax(400,'缺少参数ID'); }

        if(Banner::destroy($post['id'])){
            return_ajax(200,'删除成功');
        } else {
            return_ajax(400,'删除失败，请稍后重试！');
        }
    }
  
  /**
     * 首页自定义导航
     * @author vevay
     * @time: 2019/7/15 17:51
     */
    public function nav(){
        if(request()->isAjax()) {

            $baner = IndexNav::select();
            return_ajax(200,'获取成功',$baner);
        }
        return $this->fetch();
    }

    /**
     * 编辑自定义导航
     * @author vevay
     * @time: 2019/7/15 18:19
     */
    public function nav_edit(){
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            $nav = new IndexNav();

            //封面上传
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }

            if(!empty($post['files'])){
                $post['images'] = implode(',',$post['files']);
            }

            $post['update_time'] = time();
            if(empty($post['id'])){
                //新增
                if($nav->allowField(true)->save($post)){
                    return_ajax(200,'添加成功');
                } else {
                    return_ajax(400,'添加失败,请稍后重试');
                }
            } else {
                //编辑
                if($nav->allowField(true)->save($post,['id'=>$post['id']])){
                    return_ajax(200,'编辑成功');
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }

        $data = IndexNav::get($id);
      $data['images'] = empty($data['images'])?'':explode(',',$data['images']);
        return $this->fetch('',[
            'data'  => $data,
        ]);
    }



    /**
     * 广告图列表
     */
    public function adv(){
        if(request()->isAjax()) {
            $post = $this->request->post();
            $where['type'] = 1;
            if(!empty($post['title'])) $where['title'] = ['like','%'.$post['title'].'%'];

            $baner = Adv::where($where)->order('sort desc')->select();
            return_ajax(200,'获取成功',$baner);
        }
        return $this->fetch();
    }

    /**
     * 添加/编辑
     */
    public function advsave(){
        $id = input('id');
        if(request()->isPost()){
            $post = input('post.');
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }
            // 保存数据
            save('Adv',$post);
        }
        $data = Adv::get($id);
        return $this->fetch('',['data'=>$data]);
    }

    /**
     * 删除
     */
    public function deleAdv(){
        $post = input('post.');

        if(empty($post['id'])){ return_ajax(400,'缺少参数ID'); }

        if(Adv::destroy($post['id'])){
            return_ajax(200,'删除成功');
        } else {
            return_ajax(400,'删除失败，请稍后重试！');
        }
    }


    /**
     * 弹窗
     */
    public function popup(){
        if(request()->isAjax()) {
            $post = $this->request->post();

            $baner = Popup::order('id desc')->select();
            return_ajax(200,'获取成功',$baner);
        }
        return $this->fetch();
    }

    /**
     * 添加/编辑
     */
    public function popup_save(){
        $id = input('id');
        if(request()->isPost()){
            $post = input('post.');
            if(request()->file('pic')){
                $file = imgUpdate('pic');
                if($file['code'] == 400){ return_ajax(400,$file['msg']); }
                $post['pic'] = $file['data'];
            }
            // print_r($post);exit;
            // 保存数据
            save('Popup',$post);
        }
        $data = $data = Popup::get($id);
        return $this->fetch('',['data'=>$data]);
    }


    /**
     * 删除
     */
    public function delePopup(){
        $post = input('post.');

        if(empty($post['id'])){ return_ajax(400,'缺少参数ID'); }

        if(Popup::destroy($post['id'])){
            return_ajax(200,'删除成功');
        } else {
            return_ajax(400,'删除失败，请稍后重试！');
        }
    }

    //签到配置
    public function sign()
    {
        if(request()->isAjax()) {
            $post = $this->request->post();

            $sign = SignConfig::order('id desc')->select();
            return_ajax(200,'获取成功',$sign);
        }
        return $this->fetch();
    }

    //修改签到配置
    public function sign_save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');
            // 保存数据
            save('sign_config',$post);
        }

        $data = SignConfig::get($id);

        return $this->fetch('',['data'=>$data]);
    }


}