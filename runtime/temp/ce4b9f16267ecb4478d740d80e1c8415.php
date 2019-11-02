<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/admins/node.html";i:1546355740;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    



<style>
	.layui-card-header{
		background:#cecece;
	}
	a{
		color:#34538b;
	}
</style>

<div class="layadmin-tabsbody-item layui-show">
	<div class="layui-card layadmin-header">
	 	<div class="layui-breadcrumb" lay-filter="breadcrumb" style="visibility: visible;">
            <a lay-href="">主页</a>
            <span lay-separator="">/</span>
            <a><cite>后台管理</cite></a>
            <span lay-separator="">/</span>
            <a><cite>权限列表</cite></a>
        </div>
	</div>
    <div class="layui-fluid">
        <div class="layui-card">
            <div class="layui-col-xs6 layui-col-md12">
            	<div style="padding-bottom: 10px;">
                    <a href="<?php echo url('Admins/addNode'); ?>" class="layui-btn layuiadmin-btn-admin" data-type="add">添加控制器</a>
                </div>
                <!-- 填充内容 -->
                <div class="layui-form-item" pane="">
                    <?php if(is_array($controller) || $controller instanceof \think\Collection || $controller instanceof \think\Paginator): if( count($controller)==0 ) : echo "" ;else: foreach($controller as $key=>$vo): ?>
                        <div class="layui-card">
                            <div class="layui-card-header"><?php echo $vo['title']; ?> 
                                [<a href="<?php echo url('Admins/addMethod',array('pid'=>$vo['id'],'type'=>'add')); ?>">添加方法</a>]
                                [<a href="<?php echo url('Admins/addNode',array('id'=>$vo['id'])); ?>">修改</a>]
                                [<a href="###" onclick="del(<?php echo $vo['id']; ?>,1)">删除</a>]
                            </div>
                            <div class="layui-card-body layui-form">
                                <input type="hidden" name="id" class="id" value="<?php echo input('id'); ?>" />
                                <?php if(is_array($vo['node']) || $vo['node'] instanceof \think\Collection || $vo['node'] instanceof \think\Paginator): if( count($vo['node'])==0 ) : echo "" ;else: foreach($vo['node'] as $key=>$val): ?>
                                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                                        <span><?php echo $val['title']; ?> [<a href="<?php echo url('Admins/addMethod',array('id'=>$val['id'])); ?>">修改</a>] [<a href="###" onclick="del(<?php echo $val['id']; ?>,2)">删除</a>]</span>
                                    </div>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </div>
                        </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function del(id,type) {
        if(type == 1){
            var title = '删除控制器，将会同步删除控制器下面的方法';
        }else{
            var title = '是否删除';
        }
        layer.confirm(title, {icon: 3, title:'是否删除'}, function(index) {
            $.ajax({
                type:'post',
                url:"<?php echo url('Admins/deleAll'); ?>",
                data:{
                    id:id,
                    type:type
                },
                dataType:'json',
                success:function(data){
                    if(data.code == 200){
                        layer.msg(data.msg, {icon: 1, time: 1000},function(){
                            location.reload();
                        });
                    } else {
                        layer.msg(data.msg, {icon: 2, time: 3000});
                    }
                },
                error:function(){
                    layer.msg('网络错误，请稍后再试', {icon: 2, time: 2000});
                }
            })
        });
    }
</script>