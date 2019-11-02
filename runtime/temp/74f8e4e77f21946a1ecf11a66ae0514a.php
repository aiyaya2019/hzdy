<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:82:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/goods/type.html";i:1570689452;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    


<link rel="stylesheet" type="text/css" href="/static/admin/common.css">
<style>
    .layui-table-cell{
        height:100%;
        line-height:100%;
    }
    input {
        height: 33px;
        line-height: 33px;
        padding: 0 7px;
        border: 1px solid #ccc;
        border-radius: 2px;
        margin-bottom: -2px;
        outline: none;
    }

    input:focus {
        border-color: #009E94;
    }
</style>
<div class="layui-container" style="width:100%">
    <br><br>
    &nbsp;&nbsp;
    <div class="layui-btn-group">
        <button class="layui-btn" id="btn-expand">全部展开</button>
        <button class="layui-btn" id="btn-fold">全部折叠</button>
    </div>
    &nbsp;&nbsp;
    <input id="edt-search" type="text" placeholder="输入关键字" style="width: 120px;"/>&nbsp;&nbsp;
    <button class="layui-btn" id="btn-search">&nbsp;&nbsp;搜索&nbsp;&nbsp;</button>

    <table id="auth-table" class="layui-table" lay-filter="auth-table"></table>
</div>
<script>
    layui.use(['table', 'treetable'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var treetable = layui.treetable;
        // 渲染表格
        layer.load(2);
        treetable.render({
            treeColIndex: 1,
            treeSpid: 0,
            treeIdName: 'id',
            treePidName: 'pid',
            elem: '#auth-table',
            url: "<?php echo url('Goods/type'); ?>?json=1",
            page: false,
            treeDefaultClose:true,
            toolbar:'#add',
            defaultToolbar:false,
            cols: [[
                {type: 'numbers'},
                {field: 'title', minWidth: 200, title: '分类名称'},
                {minWidth: 200, title: '分类图标',templet:function(d){
                    return '<img src="'+d.pic+'" style="width:30px" alt="" />'
                }},
                {field: 'sort', minWidth: 100, title: '排序'},
                {
                    width:'15%', align: 'center', templet: function (d) {
                        var str = '';
                        if (d.pid == 0) {
                            str += '<a href="<?php echo url('Goods/type_save'); ?>?pid='+d.id+'"><button class="layui-btn layui-btn-xs layui-btn-normal">添加子分类</button></a>';
                        }
                        str += '<a href="<?php echo url('Goods/type_save'); ?>?id='+d.id+'&pid='+d.pid+'"><button class="layui-btn layui-btn-xs layui-btn-primary" style="margin:0 10px">编辑</button></a>';
                        str += '<button class="layui-btn layui-btn-xs layui-btn layui-btn-danger delete" data-url="<?php echo url('Goods/delete_type'); ?>" data-id="'+d.id+'">删除</button>';
                        return str;
                    }, title: '操作'
                }
            ]],
            done: function () {
                layer.closeAll('loading');
            }
        });

        $('#btn-expand').click(function () {
            treetable.expandAll('#auth-table');
        });

        $('#btn-fold').click(function () {
            treetable.foldAll('#auth-table');
        });

        $('#btn-search').click(function () {
            var keyword = $('#edt-search').val();
            var searchCount = 0;
            $('#auth-table').next('.treeTable').find('.layui-table-body tbody tr td').each(function () {
                $(this).css('background-color', 'transparent');
                var text = $(this).text();
                if (keyword != '' && text.indexOf(keyword) >= 0) {
                    $(this).css('background-color', 'rgba(250,230,160,0.5)');
                    if (searchCount == 0) {
                        treetable.expandAll('#auth-table');
                        $('html,body').stop(true);
                        $('html,body').animate({scrollTop: $(this).offset().top - 150}, 500);
                    }
                    searchCount++;
                }
            });
            if (keyword == '') {
                layer.msg("请输入搜索内容", {icon: 5});
            } else if (searchCount == 0) {
                layer.msg("没有匹配结果", {icon: 5});
            }
        });
    });
</script>

<script type="text/html" id="add">
    <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Goods/type_save'); ?>">添加分类</a>
</script>

</body>
</html>