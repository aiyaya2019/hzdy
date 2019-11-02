<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/point/index.html";i:1571104092;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    .layui-table-cell{  /*最后的pic为字段的field*/
      height: 100%;
      max-width: 100%;
    }
</style>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">商品信息</div>

                <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="app-content-list">
                    <div class="layui-form-item">

                        <div class="layui-inline">
                            <label class="layui-form-label">商品标题</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" placeholder="请输入" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button class="layui-btn layuiadmin-btn-list" lay-submit="" lay-filter="LAY-app-contlist-search">
                                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                            </button>
                        </div>
                    </div>
                </div>

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
        var url = "<?php echo url('Point/index'); ?>";

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
                {title:'商品信息',width:'25%',templet:function(d){
                    var str = '';
                        str += '<div style="float:left"><img src="'+d.pic+'" style="width:50px;margin-right:5px" alt="" /></div>';
                        str+= '<div style="float:left"><p style="line-height:27px">'+d.title+'</p></div>';
                        return str;
                }},
                {field:'stock',title:'发放总数',width:'10%',align:'center'},
                {field:'point',title:'兑换积分',width:'10%',align:'center'},
                {field:'num',title:'兑换人数',width:'10%',align:'center'},
                {title:'商品状态',width:'6%',templet:function(d){
                    if(d.status == 1){
                        return '<button class="layui-btn layui-btn-sm odd" table="point_goods" key="status" val="2" data-id="'+d.id+'">兑换中</button>';
                    } else {
                        return '<button class="layui-btn layui-btn-sm layui-btn-normal odd" table="point_goods" key="status" val="1" data-id="'+d.id+'">仓库中</button>';
                    }
                }},
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
  <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Point/save'); ?>?id={{d.id}}">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs delete" data-table="point_goods" data-id="{{d.id}}" lay-event="del">删除</a>
</script>

<script type="text/html" id="add">
  <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Point/save'); ?>">发布商品</a>
</script>
