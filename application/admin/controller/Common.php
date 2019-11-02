<?php
namespace app\admin\controller;
use think\Db;
use \app\admin\model\Access;
use \app\admin\model\AdminRoles;
use \app\admin\model\AccessRole;
use \app\admin\model\AccessType;
use \app\common\model\Config;

Class Common extends Base{

	public function _initialize()
    {   
        parent::_initialize();
        if(empty($this->AdminInfo)){
            //如果没有登陆 重定向至登陆页面
            $this->redirect('Login/login');
        }
        //调用权限验证
        $this->purview();
        //获取用户权限列表
        $nav = $this->UserAuth();
        $config = Config::get(1);
        $this->assign('nav',$nav);
        $this->assign('config',$config);
    }

    /**
     * [purview 权限验证]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   [type]     [description]
     */
    public function purview()
    {   
        
        //获取控制器名称
        $controller = strtolower(request()->controller());
        //获取方法名称
        $action = strtolower(request()->action());
        //获取当前登录对象的信息
        $admin = $this->AdminInfo;
        //如果不是超级管理员,就获取用户所拥有的角色权限
        if($admin['id'] != 1 && $action != 'iserror' && ($controller != 'index' && $action != 'index') && $action != 'editadmin'){
            //获取用户所拥有的角色
            $role = AdminRoles::where('aid',$admin['id'])->column('rid');
            //获取这些角色所拥有的权限ID
            $perm = AccessRole::where(['rid'=>['IN',$role]])->column('acc_id');
            //查询出所拥有的权限ID都包含哪些方法
            $Access = Access::where(['id'=>['IN',$perm]])->select();
            //提取出 url 和 pid
            foreach($Access as $val){
                $url[] = $val['url'];
                $pid[] = $val['pid'];
            }
            //判断当前请求的方法是否在所拥有的权限列表里
            if(in_array($action,$url)){
                //存在就在判断，是否有当前控制器的权限
                $coll = AccessType::where(['id'=>['IN',$pid]])->select();
                foreach($coll as $value) {
                    $c_url[] = $value['url'];
                }
                //进行控制器判断
                if(!in_array($controller,$c_url)){
                    if(request()->isAjax()){
                        return_ajax(400,'很抱歉！您权限不足');
                    } else {
                        $this->redirect('Common/isError');
                    }
                }
            }else{
                if(request()->isAjax()){
                    return_ajax(400,'很抱歉！您权限不足');
                } else {
                    $this->redirect('Common/isError');
                }
            }
        }
    }

    /**
     * [error 无权限提示页面]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   [type]     [description]
     */
    public function isError()
    {
        return $this->fetch();
    }

    /**
     * [UserAuth 菜单列表]
     * @Author   PengJun
     * @DateTime 2018-05-07
     */
    public function UserAuth()
    {
        //获取当前登录对象的信息
        $admin = $this->AdminInfo;
        if($admin['id'] == 1){
            //超级管理员
            $Access = Access::where('is_nav',1)->order('sort desc')->select();
            $coll = AccessType::order('sort desc')->select();
        }else{
            //获取用户所拥有的角色
            $role = AdminRoles::where('aid',$admin['id'])->column('rid');
            //获取这些角色所拥有的权限ID
            $perm = AccessRole::where(['rid'=>['IN',$role]])->column('acc_id');
            //查询出所拥有的权限ID都包含哪些方法
            $Access = Access::where(['id'=>['IN',$perm],'is_nav'=>1])->order('sort desc')->select();
            //提取出pid
            $pid = [];
            foreach($Access as $val){
                $pid[] = $val['pid'];
            }
            //获取用户拥有的控制器的权限
            $coll = AccessType::where(['id'=>['IN',$pid]])->order('sort desc')->select();
        }

        $data['Access'] = $Access;
        $data['coll'] = $coll;

        return $data;
    }

    /**
     * [fileUpload 文件上传]
     * @Author   PengJun
     * @DateTime 2018-07-20
     * @return   [type]     [description]
     */
    public function fileUpload()
    {
        if($_FILES['file']['name'] != ''){
            $file = imgUpdate('file');
            if($file['code'] == 400){ return_ajax(400,$file['msg']); }

            echo json_encode(['link'=>$file['data']]);exit;
        }
    }

    /**
     * [odd_edit 单个字段修改]
     * @Author   PengJun
     * @DateTime 2019-01-14
     * @return   [type]     [description]
     */
    public function odd_edit()
    {
        if(request()->isPost()){
            $post = input('post.');

            $data[$post['key']] = $post['val'];
            $edit = Db::name($post['table'])->where('id',$post['id'])->update($data);

            if($edit){
                return_ajax(200,'操作成功');
            } else {
                return_ajax(400,'操作失败，请稍后重试');
            }
        }
    }

    /**
     * [selectAll 公共查询方法]
     * @Author   PengJun
     * @DateTime 2019-03-22
     * @return   [type]     [description]
     */
    public function selectAll($model,$data=[])
    {
        $table = model($model);
        $where = [];
        $order = 'add_time desc';
        $field = '*';
        $page = empty($data['page'])?1:$data['page'];
        $num = empty($data['num'])?20:$data['num'];
        $with = [];
        
        if(!empty($data['where'])){
            $where = $data['where'];
        }

        if(!empty($data['order'])){
            $order = $data['order'];
        }

        if(!empty($data['field'])){
            $field = $data['field'];
        }

        if(!empty($data['with'])){
            $with = $data['with'];
        }

        $info['list'] = $table->with($with)->where($where)->order($order)->field($field)->page($page,$num)->select();
        $info['count'] = $table->where($where)->count();

        return $info;
    }

    /**
     * [getFind 查询单条数据]
     * @Author   PengJun
     * @DateTime 2019-04-24
     * @return   [type]     [description]
     */
    public function getFind($model,$data=[])
    {
        $table = model($model);
        $where = [];
        $order = 'add_time desc';
        $field = '*';
        $with = [];

        if(!empty($data['where'])){
            $where = $data['where'];
        }

        if(!empty($data['order'])){
            $order = $data['order'];
        }

        if(!empty($data['field'])){
            $field = $data['field'];
        }

        if(!empty($data['with'])){
            $with = $data['with'];
        }

        if(!is_array($data)){
            $where['id'] = $data;
        }

        $list = $table->with($with)->where($where)->order($order)->field($field)->find();

        return $list;
    }

    /**
     * [save 公共添加/编辑方法]
     * @Author   PengJun
     * @DateTime 2019-03-22
     * @return   [type]     [description]
     */
    public function saves($model,$data,$is_return=false)
    {   
        $table = model($model);
        $data['update_time'] = time();
        if(empty($data['id'])){
            //新增
            $data['add_time'] = time();
            if($table->allowField(true)->save($data)){
                if($is_return == true){
                    return $table->id;
                } else {
                    return_ajax(200,'添加成功',$table->id);
                }
            } else {
                if($is_return == true){
                    return false;
                } else {
                    return_ajax(400,'添加失败,请稍后重试');
                }
            }
        } else {
            //编辑
            if($table->allowField(true)->save($data,['id'=>$data['id']])){
                if($is_return == true){
                    return $data['id'];
                } else {
                    return_ajax(200,'编辑成功');
                }
            } else {
                if($is_return == true){
                    return false;
                } else {
                    return_ajax(400,'编辑失败,请稍后重试');
                }
            }
        }
    }

    /**
     * [delete 公共删除方法]
     * @Author   PengJun
     * @DateTime 2019-01-24
     * @return   [type]     [description]
     */
    public function delete()
    {
        if(request()->isPost()){
            $post = input('post.');

            if(empty($post['id'])){ return_ajax(400,'缺少参数ID'); }
            if(empty($post['table'])){ return_ajax(400,'缺少参数table'); }

            if ($post['table'] == 'discount') {
                Db::name('goods_discount')->where('dis_id', $post['id'])->delete();
            }

            if(Db::name($post['table'])->where('id',$post['id'])->delete()){
                return_ajax(200,'删除成功');
            } else {
                return_ajax(400,'删除失败，请稍后重试');
            }
        }
    }


}