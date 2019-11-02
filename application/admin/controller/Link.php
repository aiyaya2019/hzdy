<?php
namespace app\admin\controller;

Class Link extends Common{


    /**
     * [index 链接列表]
     * @Author   PengJun
     * @DateTime 2019-05-07
     * @return   [type]     [description]
     */
    public function index()
    {
        if(request()->isPost()){
            $post = input('post.');

            $list = $this->selectAll('link',$post);

            return_ajax(200,'获取成功',$list['list'],$list['count']);
        }

        return $this->fetch();
    }

    /**
     * [save 添加/编辑链接]
     * @Author   PengJun
     * @DateTime 2019-05-07
     * @return   [type]     [description]
     */
    public function save()
    {
        $id = input('id');

        if(request()->isPost()){
            $post = input('post.');

            $this->saves('link',$post);
        }

        $list = $this->getFind('link',$id);

        return $this->fetch('',[
            'list' => $list
        ]);
    }




}