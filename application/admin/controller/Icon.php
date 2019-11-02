<?php
namespace app\admin\controller;

Class Icon extends Common{

    
    /**
     * [index 图标列表]
     * @Author   PengJun
     * @DateTime 2018-06-30
     * @return   [type]     [description]
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * [icon 选择图标]
     * @Author   PengJun
     * @DateTime 2018-06-30
     * @return   [type]     [description]
     */
    public function icon()
    {
        return $this->fetch();
    }
}