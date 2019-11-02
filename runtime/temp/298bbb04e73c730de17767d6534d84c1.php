<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:85:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/bargain/order.html";i:1572601857;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    <form action="<?php echo url('Bargain/order_excel'); ?>" method="post">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">订单信息</div>

                <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="app-content-list">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                           <label class="layui-form-label">关键字</label>
                           <div class="layui-input-inline">
                               <input type="text" name="keywords" placeholder="手机号,订单号,快递单号,商品名称" autocomplete="off" class="layui-input">
                           </div>

                           <label class="layui-form-label">会员关键字</label>
                           <div class="layui-input-inline">
                               <input type="text" name="user_keywords" placeholder="会员ID、会员昵称" autocomplete="off" class="layui-input">
                           </div>

                            <label class="layui-form-label">下单时间</label>
                            <div class="layui-input-inline">
                               <input type="text" name="start_time" placeholder="请输入开始时间" autocomplete="off" class="layui-input" id="start">
                           </div>
                            <div class="layui-form-mid">-</div>
                             <div class="layui-input-inline">
                                <input type="text" name="end_time" placeholder="请输入结束时间" autocomplete="off" class="layui-input" id="end">
                            </div>
                       </div>
                       <div class="layui-inline">
                           <div class="layui-btn layuiadmin-btn-list" lay-submit="" lay-filter="LAY-app-contlist-search">
                               <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                           </div>
                       </div>
                      <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal">导出数据</button>
                    </div>
                   </div>

                </div>

                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-autowidth"></table>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
<script>
    layui.use(['table','form','laydate'],function(){
         var laydate = layui.laydate;
        var table = layui.table;
        var form = layui.form;
        var url = "<?php echo url('Bargain/order'); ?>";

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
                {field:'order_sn',width:'11%',title:'订单编号'},
                {title:'商品信息',templet:function(d){
                    return '<img src="'+d.goods_pic+'" style="width:50px;margin-right:5px" alt="" />'+d.goods_title;
                }},
                {title:'订单价格',templet:function(d){
                    var str = '';
                        str += '<p>应付：￥'+d.order_price+'</p>';
                        str += '<p>实付：￥'+d.pay_money+'</p>';
                    return str;
                }},
                {title:'砍价信息',templet:function(d){
                    var str = '';
                        str += '<p>次数：'+d.bargain_num+'次</p>';
                        str += '<p>金额：￥'+d.bargain_price+'</p>';
                        str += '<p>截止时间：'+d.end_time+'</p>';
                    return str;
                }},
                {title:'收货信息',templet:function(d){
                    var str = '';
                        str += '<p>'+d.name+'</p>';
                        str += '<p>'+d.tel+'</p>';
                        str += '<p>'+d.address+'</p>';
                    return str;
                }},
                {field:'bargain_status_name',width:'6%',title:'砍价状态'},
                {field:'status_name',width:'6%',title:'订单状态'},
                {field:'add_time',width:'9%',title:'下单时间'},
                {
                    title:'操作',
                    toolbar:'#barDemo'
                }
            ]]
        })

          laydate.render({
                    elem:"#end",
                    type:'datetime',

                })

                var end = laydate.render({
                    elem:"#start",
                    type:'datetime',
                     max:'new Date()'
                })
    })
  function refresh() {
        setTimeout("location.reload()");
    }
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit" href="<?php echo url('Bargain/info'); ?>?id={{d.id}}">查看</a>
  <a class="layui-btn layui-btn-xs open" url="<?php echo url('Bargain/order_save'); ?>?id={{d.id}}">编辑</a>
  <a class="layui-btn layui-btn-xs open" url="<?php echo url('Bargain/help'); ?>?id={{d.id}}">砍价记录</a>
  {{# if (d.status=== 1) { }}
           <div class="layui-btn layui-btn-xs layui-btn-sm" onclick="closeOrder('{{d.id}}', 2,1)">确认付款</div>
          <!-- <a class="layui-btn layui-btn-xs updates"  data-confirm="true" table="order" key="status" val="6" data-id="{{d.id}}" onclick lay-event="status">关闭订单</a> -->
          <div class="layui-btn  layui-btn-xs layui-btn-sm" onclick="closeOrder('{{d.id}}', 8,2)">关闭订单</div>
  {{# } }}
  {{# if(d.status == 2 && d.bargain_status == 2){ }}
    <a class="layui-btn layui-btn-xs open" width="35%" height="50%" data-title="砍价订单发货" url="<?php echo url('Bargain/delivery'); ?>?id={{d.id}}">发货</a>
    {{# } else if(d.status == 2 && d.bargain_status == 4) { }}
     <a class="layui-btn layui-btn-xs open" width="35%" height="50%" data-title="砍价订单发货" url="<?php echo url('Bargain/delivery'); ?>?id={{d.id}}">发货</a>
  {{# } }}
  <a class="layui-btn layui-btn-danger layui-btn-xs odd" data-confirm="true" table="bargain_order" key="is_deleted" val="2" data-id="{{d.id}}" lay-event="del">删除</a>
</script>

<script>

    function closeOrder(id,status,type){
        var data = {
            id:id,
            status:status,
            type:type,
        };
        get_request("<?php echo url('Bargain/closeOrder'); ?>",data);
    }
</script>
