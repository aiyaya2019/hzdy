<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/admins/index.html";i:1546355744;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    



<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div style="padding-bottom: 10px;">
                <button class="layui-btn layuiadmin-btn-admin" onclick="save('<?php echo url('admins/addAdmin'); ?>',2)" data-type="add">添加管理员</button>
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
                        <td>管理员昵称</td>
                        <td>登录账号</td>
                        <td>添加时间</td>
                        <td>上次修改时间</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>
                <?php if(is_array($admin) || $admin instanceof \think\Collection || $admin instanceof \think\Paginator): if( count($admin)==0 ) : echo "" ;else: foreach($admin as $key=>$vo): ?>
                    <tr>
                        <td><?php echo $vo['id']; ?></td>
                        <td><?php echo $vo['name']; ?></td>
                        <td><?php echo $vo['admin_user']; ?></td>
                        <td><?php echo $vo['addtime']; ?></td>
                        <td><?php echo $vo['update_time']; ?></td>
                        <td>
                            <?php if($vo['forst'] == 0): ?>
                                <button class="layui-btn layui-btn-xs">正常</button>
                            <?php else: ?>
                                <button class="layui-btn layui-btn-warm layui-btn-xs">冻结</button>
                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if($vo['id'] != 1): if($vo['forst'] == 0): ?>
                                    <span><a href="#" onclick="bssc(<?php echo $vo['id']; ?>,1)">禁用</a></span>
                                <?php else: ?>
                                    <span><a href="#" onclick="bssc(<?php echo $vo['id']; ?>,0)">激活</a></span>
                                <?php endif; ?>
                                <span>|</span>
                                <span>
                                    <?php if($vo['id'] == \think\Session::get('AdminInfo.id')): ?>
                                    <a onclick="save('<?php echo url('admins/editAdmin',array('id'=>$vo['id'])); ?>',1)" href="#">编辑</a>
                                    <?php else: ?>
                                    <a onclick="save('<?php echo url('admins/addAdmin',array('id'=>$vo['id'])); ?>',1)" href="#">编辑</a>
                                    <?php endif; ?>
                                </span>
                                <span>|</span>
                                <span><a href="javascript:del(<?php echo $vo['id']; ?>)">删除</a></span>
                            <?php else: ?>
                                <span><a href="#" onclick="save('<?php echo url('admins/addAdmin',array('id'=>$vo['id'])); ?>',1)">修改资料</a></span>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function save(url,type)
    {   
        if(type == 1){
            var title = '编辑管理员';
        }else{
            var title = '添加管理员';
        }
        layer.open({
            type: 2,
            title: title,
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['400px', '480px'],
            content: url
        });
    }

    function refresh(){
        setTimeout("location.reload()", 2000);
    }

    function del(id) {
        layer.confirm('是否删除', {icon: 3, title:'是否删除'}, function(index) {
            $.ajax({
                url:"<?php echo url('Admins/deleAdmin'); ?>",
                data:{
                    'id':id
                },
                type:'post',
                dataType:'json',
                success:function (data) {
                    if (data.code == 200) {
                        layer.msg(data.msg, {icon: 1, time: 2000});
                        setTimeout("location.reload()", 2000);
                    } else {
                        layer.msg(data.msg, {icon: 2, time: 2000});
                    }
                    layer.close(index);
                },
                error:function () {
                    layer.msg('网络错误，请稍后再试', {icon: 2, time: 2000});
                    layer.close(index);
                }
            });
        });
    }

    //禁用 激活
    function bssc(id, bs) {
        if (bs == 1) {
            var tips = '是否禁用';
        } else {
            var tips = '是否激活';
        }
        layer.confirm(tips, {icon: 3, title:tips}, function(index) {
            $.ajax({
                url:"<?php echo url('Admins/isStatus'); ?>",
                data:{
                    'id':id, 
                    'bssc':bs
                },
                type:'post',
                dataType:'json',
                success:function (data) {
                    if (data.code == 200) {
                        layer.msg(data.msg, {icon: 1, time: 2000});
                        setTimeout("location.reload()", 2000);
                    } else {
                        layer.msg(data.msg, {icon: 2, time: 2000});
                    }
                    layer.close(index);
                },
                error:function () {
                    layer.msg('网络错误，请稍后再试', {icon: 2, time: 2000});
                    layer.close(index);
                }
            });
        });
    }
</script>
               