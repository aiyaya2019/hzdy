<?php
namespace app\admin\controller;

use \think\Controller;

Class Base extends Controller{
    
    public function _initialize()
    {
        $this->AdminInfo = session('AdminInfo');
        $this->assign('AdminInfo',$this->AdminInfo);
    }
}