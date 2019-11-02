<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/config/sign.html";i:1565850751;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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

    .layui-table-cell{height: auto !important;}

</style>

<div class="layui-fluid">

    <div class="layui-row layui-col-space15">

        <div class="layui-col-md12">

            <div class="layui-card">

                <div class="layui-card-header">签到配置</div>







                <div class="layui-card-body">

                    <table class="layui-hide" id="test-table-autowidth"></table>

                </div>

            </div>

        </div>

    </div>

</div>

<script>

    layui.use(['table','form','layer'],function(){

        var table = layui.table,form = layui.form;

        var url = "<?php echo url('Config/sign'); ?>";



        //监听搜索

        form.on('submit(LAY-app-contlist-search)', function(data){

            var field = data.field;

            field.page = 1;

            //执行重载

            table.reload('test-table-autowidth', {

                where: field

            });

        });



        table.render({

            elem: '#test-table-autowidth',

            url:url,

            method:'post',

            response:{

                statusCode:200

            },

            page:{

                layout:['prev','page','next','skip','count']

            },

            limit:20,

            toolbar:'#add',

            defaultToolbar:false,

            cols:[[

                {field:'id',title:'编号',width:'4%'},

                {field:'today',title:'连续签到天数',align:'center'},

                {field:'point',title:'奖励积分',align:'center'},

                {field:'add_time',title:'发布时间'},

                {

                    title:'操作',

                    toolbar:'#barDemo'

                }

            ]]

        })

    })

</script>



<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Config/sign_save'); ?>?id={{d.id}}">编辑</a>

    <a class="layui-btn layui-btn-danger layui-btn-xs delete" data-table="sign_config" data-id="{{d.id}}" lay-event="del">删除</a>

</script>



<script type="text/html" id="add">

    <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Config/sign_save'); ?>">添加配置</a>

</script>

