<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/group/refund.html";i:1572492978;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
                <div class="layui-card-header">退款列表</div>

                <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="app-content-list">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">退款编号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="order_sn" placeholder="请输入" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">退款状态</label>
                            <div class="layui-input-inline">
                                <select name="status">
                                    <option value="10">请选择退款状态</option>
                                    <option value="0">待处理</option>
                                    <option value="1">退款成功</option>
                                    <option value="2">拒绝退款</option>
                                </select>
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
        var url = "<?php echo url('Group/refund'); ?>";

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
            cols:[[
                {field:'id',title:'编号',width:'4%'},
                {field:'order_sn',width:'11%',title:'退款编号'},
                {width:'12%',title:'订单信息',templet:function (d) {
                    if(d.order.pay_type == 1){
                        return '订单号：'+d.order.order_sn+'<br/>支付方式：微信支付'
                    }else{
                        return '订单号：'+d.order.order_sn+'<br/>支付方式：余额支付'
                    }
                }},
                {title:'商品信息',templet:function(d){
                    return '<img src="'+d.order.goods_pic+'" style="width:50px;margin-right:5px" alt="" />'+d.order.goods_title;
                }},
                {field:'price',title:'退款金额'},
                {field:'type',width:'11%',title:'退款类型',templet:function (d) {
                    if(d.type == 1){
                        return '仅退款';
                    }else{
                        return '退货退款';
                    }
                }},

                {field:'status_name',width:'6%',title:'状态'},
                {field:'add_time',width:'9%',title:'下单时间'},
                {
                    title:'操作',
                    toolbar:'#barDemo'
                }
            ]]
        })
    })

    // 操作退款
    function refund(id,order_id,status) {
        if(status == 1){var msg = '是否要打款？';}else{var msg='确定要拒绝吗？';}
        layer.confirm(msg, {icon: 3, title:'是否操作'}, function(index) {
            $.ajax({
                url:"<?php echo url('Group/refundAudit'); ?>",
                type:'post',
                data:{id:id,order_id:order_id,status:status},
                dataType:'json',
                success:function(data){
                    if(data.code == 200){
                        layer.msg(data.msg,{time:1000},function(){
                            //返回上一页刷新
                             window.location.reload();
                        });
                    } else {
                        layer.msg(data.msg,{time:3000});
                    }
                },
                error:function(){
                    layer.msg('网络错误，请稍后再试');
                }
            });
        });

    }
</script>

<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Group/refund_info'); ?>?id={{d.id}}">订单详情</a>
  {{# if(d.status == 0){ }}
  <a class="layui-btn layui-btn-xs" onclick="refund({{d.id}},{{d.order_id}},1)">同意退款</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="refund({{d.id}},{{d.order_id}},2)">拒绝退款</a>
  {{# } }}
</script>
