<?php
namespace app\admin\controller;
use \app\admin\model\Admin;
use \app\admin\model\AdminRole;
use \app\admin\model\AdminRoles;
use \app\admin\model\AccessType;
use \app\admin\model\Access;
use \app\admin\model\AccessRole;
use \think\Validate;
use \think\Session;

class Admins extends Common
{	
	/**
	 * [index 管理员列表]
	 * @Author   PengJun
	 * @DateTime 2017-12-22
	 * @return   [type]     [description]
	 */
    public function index(){

        //如果登录的人不是超级管理员  就不能看到超级管理员信息
        $where = [];
        if(Session::get('AdminInfo.id') != 1){
            $where['id'] = ['neq',1];
        }
       	$admin = Admin::all($where);

        return $this->fetch('',[
            'admin' => $admin
        ]);
    }

    /**
     * [addAdmin 添加/编辑管理员]
     * @Author   PengJun
     * @DateTime 2017-12-22
     */
    public function addAdmin()
    {	
    	$title = empty(input('id'))?'添加管理员':'编辑管理员';
    	//获取角色列表
    	$role = AdminRole::all();
    	//获取管理员信息
    	$adminInfo = Admin::get(input('id'));
    	//获取管理员所属角色
    	$role_id = AdminRoles::where(['aid'=>input('id')])->column('rid');

    	if(request()->isPost()){
    		$post = input('post.');
    		$admin = new Admin;

    		//自动验证
    		$rule = [
			    ['name','require|chsAlpha','名称不能为空|名称只能为汉字或字母'],
			    ['admin_user','require|alphaNum|unique:admin','账号不能为空|账号只能为字母和数字|账号已经存在'],
			    ['password','require|alphaNum','密码不能为空|密码只能为字母或数字']
			];

    		$validate = new Validate($rule);

			if(empty($post['id'])){
				//添加操作
				if(!$validate->check($post)){
					return_ajax(400,$validate->getError());
				}
				$post['addtime'] = time();
				$post['password'] = md5($post['password']);
				if($admin->allowField(true)->save($post)){
					if(!empty($post['rid'])){
						//添加管理员角色记录
						$this->AdminRoles($admin->id,$post['rid']);
					}
					return_ajax(200,'添加管理员成功','add');
    			}else{
    				return_ajax(400,'添加管理员失败');
    			}
			}else{
				//编辑操作
				$validate->scene('edit', ['name','admin_user']); //定义验证场景

				if(!$validate->scene('edit')->check($post) && $post['id'] != 1){
					return_ajax(400,$validate->getError());
				}else{
					//如果密码为空，就不修改密码
					if(empty($post['password'])){ unset($post['password']); }else{ $post['password'] = md5($post['password']); }

					//修改资料
					if($admin->allowField(true)->save($post,['id'=>$post['id']])){
						//如果rid为空，就删除该管理员的所有角色
						if(empty($post['rid'])){
							$this->deleRoles($post['id'],$role_id);
						}else{
							//计算要新增加的角色ID
							$add = array_diff($post['rid'],$role_id);
							if($add){ $this->AdminRoles($post['id'],$add); }
							//计算要删除的角色ID
							$dele = array_diff($role_id,$post['rid']);
							if($dele){ $this->deleRoles($post['id'],$dele); }
						}
						return_ajax(200,'操作成功');
					}else{
						return_ajax(400,'操作失败，请稍后再试！');
					}
				}
			}
    	}

    	return $this->fetch('',[
            'role'      => $role,
            'id'        => input('id'),
            'title'     => $title,
            'role_id'   => $role_id,
            'adminInfo' => $adminInfo,
    	]);
    }

    /**
     * [editAdmin 修改个人资料]
     * @Author   PengJun
     * @DateTime 2018-07-06
     * @return   [type]     [description]
     */
    public function editAdmin()
    {
        $title = empty(input('id'))?'添加管理员':'编辑管理员';
        //获取角色列表
        $role = AdminRole::all();
        //获取管理员信息
        $adminInfo = Admin::get(input('id'));

        if(request()->isPost()){
            $post = input('post.');
            $admin = new Admin;

            //自动验证
            $rule = [
                ['name','require|chsAlpha','名称不能为空|名称只能为汉字或字母'],
                ['admin_user','require|alphaNum|unique:admin','账号不能为空|账号只能为字母和数字|账号已经存在'],
                ['password','require|alphaNum','密码不能为空|密码只能为字母或数字']
            ];

            $validate = new Validate($rule);
            //编辑操作
            $validate->scene('edit', ['name','admin_user']); //定义验证场景

            if(!$validate->scene('edit')->check($post) && $post['id'] != 1){
                return_ajax(400,$validate->getError());
            }else{
                //如果密码为空，就不修改密码
                if(empty($post['password'])){ unset($post['password']); }else{ $post['password'] = md5($post['password']); }

                //修改资料
                if($admin->allowField(true)->save($post,['id'=>$post['id']])){
                    return_ajax(200,'更新资料成功');
                }else{
                    return_ajax(400,'更新资料失败，请稍后再试！');
                }
            }
        }

        return $this->fetch('',[
            'role'      => $role,
            'id'        => input('id'),
            'title'     => $title,
            'adminInfo' => $adminInfo,
        ]);
    }

    /**
     * [isStatus 修改管理员状态]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   boolean    [description]
     */
    public function isStatus()
    {
    	if(request()->isPost()){
    		$post = input('post.');
    		if(empty($post['id'])){ return_ajax(400,'非法操作'); }

    		$admin = Admin::get($post['id']);
    		$forst = $admin['forst']==1?0:1;

    		$admin->forst = $forst;
    		if($admin->save()){
    			return_ajax(200,'操作成功!');
    		}else{
    			return_ajax(400,'操作失败，请稍后再试！');
    		}
    	}
    }

    /**
     * [deleAdmin 删除管理员]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   [type]     [description]
     */
    public function deleAdmin()
    {
    	if(request()->isPost()){
    		$post = input('post.');
    		if(empty($post)){ return_ajax(400,'非法操作！'); }
    		if($post['id'] == 1){ return_ajax(400,'禁止操作超级管理员'); }

    		if(Admin::destroy($post['id'])){
    			return_ajax(200,'操作成功！');
    		}else{
    			return_ajax(400,'操作失败，请稍后再试！');
    		}
    	}
    }

    /**
     * [role 角色列表]
     * @Author   PengJun
     * @DateTime 2017-12-22
     * @return   [type]     [description]
     */
    public function role()
    {	

    	$role = AdminRole::all();

    	return $this->fetch('',[
    		'role' => $role,
    	]);
    }

    /**
     * [addRole 添加/修改角色]
     * @Author   PengJun
     * @DateTime 2017-12-22
     */
    public function addRole()
    {	

    	if(request()->isPost()){
    		$post = input('post.');
    		$role = new AdminRole;

    		if(empty($post['name'])){ return_ajax(400,'角色名称不能为空'); }
    		if(empty($post['desc'])){ return_ajax(400,'角色描述不能为空'); }

    		if(empty($post['id'])){
    			//添加操作
    			$post['addtime'] = time();
    			if($role->save($post)){
    				return_ajax(200,'添加角色成功','add');
    			}else{
    				return_ajax(400,'添加角色失败');
    			}
    		}else{
    			//修改操作
    			if($role->save($post,['id'=>$post['id']])){
    				return_ajax(200,'编辑角色成功','edit');
    			}else{
    				return_ajax(400,'编辑角色失败');
    			}
    		}
    	}

    	$title = empty(input('id'))?'添加角色':'编辑角色';
    	$data = AdminRole::get(input('id'));

    	return $this->fetch('',[
			'title' => $title,
			'data'  => $data,
    	]);
    }

    /**
     * [deleRole 删除角色]
     * @Author   PengJun
     * @DateTime 2017-12-22
     * @return   [type]     [description]
     */
    public function deleRole()
    {
    	if(request()->isPost()){
    		$post = input('post.');

    		if(empty($post['id'])){ return_ajax(400,'非法操作'); }

    		if(AdminRole::destroy($post['id'])){
    			return_ajax(200,'删除成功');
    		}else{
    			return_ajax(400,'删除失败');
    		}
    	}
    }

    /**
     * [access 角色配置权限]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   [type]     [description]
     */
    public function access()
    {	
    	//获取控制器、方法列表
    	$controller = AccessType::with('node')->order('sort desc')->select();
    	//获取该角色所拥有的权限ID
    	$acc_id = AccessRole::where('rid',input('id'))->column('acc_id');

    	if(request()->isPost()){
    		$post = input('post.');
    		$role = new AccessRole;

    		if(empty($post['id'])){ return_ajax(400,'非法操作！'); }

    		if(!empty($post['access'])){
    			//计算要新增的权限
				$add = array_diff($post['access'],$acc_id);
				if($add){
					foreach($add as $val){
	    				$list[] = ['rid'=>$post['id'],'acc_id'=>$val,'addtime'=>time()];
	    			}
	    			$role->saveAll($list);
				}
				//计算要删除的角色ID
				$dele = array_diff($acc_id,$post['access']);
				if($dele){
					AccessRole::destroy(['rid'=>$post['id'],'acc_id'=>['IN',$dele]]);
				}
	    		return_ajax(200,'权限分配成功');
    		}
    		return_ajax(400,'请至少选择一个权限');
    	}

    	return $this->fetch('',[
			'acc_id'     => $acc_id,
			'controller' => $controller,
    	]);
    }

    /**
     * [node 权限列表]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   [type]     [description]
     */
    public function node()
    {	
    	//获取控制器、方法列表
    	$controller = AccessType::with('node')->order('sort desc')->select();

    	return $this->fetch('',[
    		'controller' => $controller,
    	]);
    }

    /**
     * [addNode 添加/编辑控制器]
     * @Author   PengJun
     * @DateTime 2017-12-25
     */
    public function addNode()
    {	
    	if(empty(input('id'))){ $title = '添加控制器'; }else{ $title = '编辑控制器'; }
    	$node = AccessType::get(input('id'));

    	if(request()->isPost()){
    		$post = input('post.');
    		$AccessType = new AccessType();

    		if(empty($post['title'])){ return_ajax(400,'控制器名称不能为空'); }
    		if(empty($post['url'])){ return_ajax(400,'控制器不能为空'); }

    		//将控制器转化成小写
    		$post['url'] = strtolower($post['url']);

    		if(empty($post['id'])){
    			//添加操作
    			$post['addtime'] = time();
    			if($AccessType->save($post)){
    				return_ajax(200,'添加成功','add');
    			}else{
    				return_ajax(400,'添加失败，请稍后重试！');
    			}
    		}else{
    			//编辑操作
    			if($AccessType->save($post,['id'=>$post['id']])){
    				return_ajax(200,'编辑成功');
    			}else{
    				return_ajax(400,'编辑失败，请稍后重试！');
    			}
    		}
    	}

    	return $this->fetch('',[
			'title' => $title,
			'node'  => $node,
    	]);
    }

    /**
     * [method 添加/编辑控制器方法]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   [type]     [description]
     */
    public function addMethod()
    {
    	if(input('type') == 'add'){ $title = '添加方法'; }else{ $title = '编辑方法'; }
    	$node = Access::get(input('id'));

    	if(request()->isPost()){
    		$post = input('post.');
            $post = json_decode($post['data'],true);

    		$AccessType = new Access();

    		if(empty($post['title'])){ return_ajax(400,'方法名称不能为空'); }
    		if(empty($post['url'])){ return_ajax(400,'方法不能为空'); }

    		//将控制器方法转化成小写
    		$post['url'] = strtolower($post['url']);
            $post['is_nav'] = empty($post['is_nav'])?2:1;

    		if($post['type'] == 'add'){
    			//添加操作
    			$post['addtime'] = time();
    			if($AccessType->allowField(true)->save($post)){
    				return_ajax(200,'添加成功','add');
    			}else{
    				return_ajax(400,'添加失败，请稍后重试！');
    			}
    		}else{
    			//编辑操作
    			unset($post['pid']);
    			unset($post['type']);
                //权限列表不可以取消菜单显示
                if($post['url'] == 'node' && $post['is_nav'] == 2){
                        return_ajax(400,'权限列表无法隐藏');
                }
    			if($AccessType->save($post,['id'=>$post['id']])){
    				return_ajax(200,'编辑成功');
    			}else{
    				return_ajax(400,'编辑失败，请稍后重试！');
    			}
    		}
    	}

    	return $this->fetch('',[
			'title' => $title,
			'node'  => $node,
    	]);
    }

    /**
     * [deleNode 删除控制器]
     * @Author   PengJun
     * @DateTime 2017-12-25
     * @return   [type]     [description]
     */
    public function deleAll()
    {
    	if(request()->isPost()){
    		$post = input('post.');

    		if(empty($post['id'])){ return_ajax(400,'非法操作！'); }
    		if(empty($post['type'])){ return_ajax(400,'缺少类型参数'); }

    		switch ($post['type']) {
    			case 1:
    				#删除控制器
    				if(AccessType::destroy($post['id'])){
    					//删除控制器下的所有方法
    					Access::destroy(['pid'=>$post['id']]);
    					return_ajax(200,'删除成功！');
    				}else{
    					return_ajax(400,'删除失败！请稍后重试');
    				}
    				break;
    			default:
    				#删除方法
    				if(Access::destroy($post['id'])){
    					return_ajax(200,'删除成功！');
    				}else{
    					return_ajax(400,'删除失败！请稍后重试');
    				}
    				break;
    		}
    	}
    }

    /**
     * [AdminRoles 添加管理员角色记录]
     * @Author   PengJun
     * @DateTime 2017-12-22
     */
    public function AdminRoles($id,$data)
    {	
    	$AdminRoles = new AdminRoles;
    	foreach($data as $val){
    		$info[] = [
    			'aid' => $id,
    			'rid' => $val,
    			'addtime' => time()
    		];
    	}

    	if($AdminRoles->saveAll($info)){
    		return true;
    	}else{
    		return false;
    	}
    }

    /**
     * [deleRoles 删除管理员角色记录]
     * @Author   PengJun
     * @DateTime 2017-12-22
     * @return   [type]     [description]
     */
    public function deleRoles($id,$data)
    {	
    	$delete = AdminRoles::destroy(['aid'=>$id,'rid'=>['IN',$data]]);

    	if($delete){
    		return true;
    	}else{
    		return false;
    	}
    }
}
?>