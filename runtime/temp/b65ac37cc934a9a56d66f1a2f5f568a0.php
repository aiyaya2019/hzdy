<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:82:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/user/grade.html";i:1571898842;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    .laytable-cell-1-0-2,.laytable-cell-1-0-5{  /*最后的pic为字段的field*/
      height: 100%;
      max-width: 100%;
    } 
</style>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">会员等级</div>

                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-autowidth"></table>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['table','form'],function(){
        var table = layui.table;
        var form = layui.form;

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
            url:"<?php echo url('User/grade'); ?>",
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
                {title:'参与用户',width:'15%',templet:function(d){
                    var str = '';
                        str += '<img src="'+d.icon+'" alt="" style="width:30px;height:30px;margin-right:10px" />'+d.title;
                    if(d.is_default == 2){
                        str += '<button class="layui-btn layui-btn-xs layui-btn-normal" style="margin-left:5px">默认等级</button>';
                    }
                    return str;
                }},
                {field:'full_price',title:'升级条件'},
                {field:'desc',title:'等级说明',width:'20%'},
                {field:'user_count',title:'会员数量'},
                {field:'discount',title:'等级折扣'},
                {field:'birthday_discount',title:'生日折扣'},
                {title:'积分抵扣',align:'center',width:'6%',templet:function(d){
                    if(d.is_point == 1){
                        return '<button class="layui-btn layui-btn-xs layui-btn-danger">未拥有</button>';
                    } else {
                        return '<button class="layui-btn layui-btn-xs">拥有</button>';
                    }
                }},
                {title:'积分兑换',align:'center',width:'6%',templet:function(d){
                    if(d.is_convert == 1){
                        return '<button class="layui-btn layui-btn-xs layui-btn-danger">未拥有</button>';
                    } else {
                        return '<button class="layui-btn layui-btn-xs">拥有</button>';
                    }
                }},
                {field:'add_time',title:'参加时间'},
                {title:'操作',width:'10%',toolbar:'#barDemo'},
            ]]
        })
    })
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('User/grade_save'); ?>?id={{d.id}}">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs delete" data-table="goods" data-id="{{d.id}}" lay-event="del">删除</a>
</script>

<script type="text/html" id="add">
  <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('User/grade_save'); ?>">添加等级</a>
</script>
