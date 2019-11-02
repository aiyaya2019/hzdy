<?php
namespace app\admin\controller;
use \think\Controller;
use app\admin\model\Admin;
use app\common\model\Config;

Class Login extends Controller{

	public function login()
    {   
        if(session('AdminInfo')){
            //如果已经登陆
            $this->redirect('Index/index');
        }

        if(request()->isPost()){
            $post = input('post.');

            if(empty($post['username'])){ $this->error('请输入账号','Login/login'); }
            if(empty($post['password'])){ $this->error('请输入密码','Login/login'); }

            $admin = Admin::where('admin_user',$post['username'])->find();
            if(empty($admin)){
                return_ajax(400,'用户不存在，请检查后重新输入');
            }else{
                if($admin['password'] == md5($post['password'])){
                    if($admin['forst'] == 0){
                        session('AdminInfo',$admin);
                        return_ajax(200,'登陆成功');
                    }else{
                        return_ajax(400,'账号已被冻结');
                    }
                }else{
                    return_ajax(400,'密码错误！请重新输入');
                }
            }
        }else{
            $config = Config::get(1);

            return $this->fetch('',['config'=>$config]);
        }
    }

    /**
     * [logout 退出登陆]
     * @Author   HTL
     * @DateTime 2017-09-25T11:25:00+0800
     */
    public function logout(){
        session('AdminInfo',null);
        
        $this->redirect('Login/login');
    }
}