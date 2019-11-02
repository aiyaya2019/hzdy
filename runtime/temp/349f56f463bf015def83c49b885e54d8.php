<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/admins/role.html";i:1546355706;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
<!-- 引入头部 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $config['title']; ?>-后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/static/admin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/static/admin/style/admin.css" media="all">
    <!-- 引入阿里巴巴矢量图标库 -->
    <link title="" href="//at.alicdn.com/t/font_728609_yqh8bmk6kj.css" rel="stylesheet" type="text/css"  />
</head>
<body>
<script src='/static/admin/jquery.js'></script>
<script src="/static/admin/layui/layui.js"></script>
<script src='/static/admin/common.js'></script>

<script>
    var layer;
    layui.use('layer',function(){
        layer = layui.layer;
    })
</script>
    



<div class="layadmin-tabsbody-item layui-show">
	<div class="layui-card layadmin-header">
	 	<div class="layui-breadcrumb" lay-filter="breadcrumb" style="visibility: visible;">
            <a lay-href="">主页</a>
            <span lay-separator="">/</span>
            <a><cite>后台管理</cite></a>
            <span lay-separator="">/</span>
            <a><cite>角色管理</cite></a>
        </div>
	</div>
	<div class="layui-fluid">   
		<div class="layui-card">
		    <div class="layui-card-body">
		    	<div style="padding-bottom: 10px;">
		        	<a class="layui-btn layuiadmin-btn-role" href="<?php echo url('admins/addRole'); ?>" data-type="add">添加</a>
		      	</div>
		    
		      	<table class="layui-table" lay-even="" lay-skin="nob">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>角色名称</td>
                            <td>角色描述</td>
                            <td>添加时间</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <tbody>
                    <?php if(is_array($role) || $role instanceof \think\Collection || $role instanceof \think\Paginator): if( count($role)==0 ) : echo "" ;else: foreach($role as $key=>$vo): ?>
                        <tr>
                            <td><?php echo $vo['id']; ?></td>
                            <td><?php echo $vo['name']; ?></td>
                            <td><?php echo $vo['desc']; ?></td>
                            <td><?php echo date('Y-m-d H:i',$vo['addtime']); ?></td>
                            <td>
                                <a class="layui-btn layui-btn-set layui-btn-xs" href="<?php echo url('admins/access',array('id'=>$vo['id'])); ?>" lay-event="edit">
                                	<i class="layui-icon layui-icon-set"></i>配置权限
                                </a>
                                <a class="layui-btn layui-btn-normal layui-btn-xs" href="<?php echo url('admins/addRole',array('id'=>$vo['id'])); ?>" lay-event="edit">
                                	<i class="layui-icon layui-icon-edit"></i>编辑
                                </a>
		        				<a onclick="del(<?php echo $vo['id']; ?>)" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
		        					<i class="layui-icon layui-icon-delete"></i>删除
		        				</a>
                            </td>
                        </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </tbody>
                </table>
		    </div>
	 	</div>
	</div>
</div>

<script>
	function del(id) {
        layer.confirm('是否删除', {icon: 3, title:'是否删除'}, function(index) {
            $.ajax({
                type:'post',
                url:"<?php echo url('Admins/deleRole'); ?>",
                data:{
                    id:id
                },
                dataType:'json',
                success:function(data){
                    if(data.code == 200){
                        layer.msg(data.msg, {icon: 1, time: 1000},function(){
                        	window.history.go(-1);
                        });
                    } else {
                    	layer.msg(data.msg, {icon: 2, time: 3000})
                    }
                },
                error:function(){
                    layer.msg('网络错误，请稍后再试', {icon: 2, time: 2000});
                }
            })
        });
    }
</script>