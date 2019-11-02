<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:81:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/zone/comb.html";i:1557127334;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    p{
        line-height:20px;
    }
</style>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">肌肤类型</div>

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
        var url = "<?php echo url('Zone/comb'); ?>";

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
            where:{id:"<?php echo input('id'); ?>"},
            toolbar:'#add',
            defaultToolbar:false,
            cols:[[
                {field:'id',title:'编号',width:'5%'},
                {field:'crowd',title:'针对人群',width:'10%'},
                {field:'desc',title:'类型描述'},
                {title:'推荐商品',templet:function(d){
                    var str = '';
                        str += '<div style="display:flex">';
                        str += '<div><img src="'+d.goods.pic+'" style="width:40px;margin-right:5px" alt="" /></div>';
                        str += '<div>';
                        str += '<p>'+d.goods.title+'</p>';
                        str += '<p>￥'+d.goods.money_range.min+'</p>';
                        str += '</div></div>'
                    return str;
                }},
                {title:'推荐组合',templet:function(d){
                    var str = '';
                        str += '<div style="display:flex">';
                        str += '<div><img src="'+d.old_goods.pic+'" style="width:40px;margin-right:5px" alt="" /></div>';
                        str += '<div>';
                        str += '<p>'+d.old_goods.title+'</p>';
                        str += '<p>￥'+d.old_goods.money_range.min+'</p>';
                        str += '</div></div>'
                    return str;
                }},
                {field:'sort',title:'排序',width:'5%',align:'center'},
                {field:'add_time',title:'发布时间',width:'10%'},
                {
                    title:'操作',
                    width:'8%',
                    toolbar:'#barDemo'
                }
            ]]
        })
    })
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Zone/comb_save'); ?>?id={{d.id}}&skin_id=<?php echo input('id'); ?>">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs delete" data-table="goods" data-id="{{d.id}}" lay-event="del">删除</a>
</script>

<script type="text/html" id="add">
  <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Zone/comb_save'); ?>?skin_id=<?php echo input('id'); ?>">添加组合</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" href="<?php echo url('Zone/index'); ?>">返回</a>
</script>
