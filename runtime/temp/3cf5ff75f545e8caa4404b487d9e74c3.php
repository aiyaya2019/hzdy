<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:81:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/prom/save.html";i:1565869936;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;border:1px solid #eee;}
    .spec{float:right;width:80%;margin: 0 5px 10px 3px}
    .remove{width:4% !important;margin:10px 0 0 0;color:#FF5722;cursor:pointer;}
    .removes{color:#FF5722;cursor:pointer;}
    .layui-input-inline{margin-right:2px !important;}
    .layui-unselect{float:left;}
    .pane{width:13% !important;}
</style>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-form" lay-filter="layuiadmin-form-admin" style="padding: 20px 30px 1px 0;">
            <form action="" class="layui-form">
                <input type="hidden" name="id" value="<?php echo input('id'); ?>">

                <div class="layui-form-item">
                    <label class="layui-form-label">是否指定商品可用</label>
                    <div class="layui-input-block">
                    <input type="radio" name="goods_type" value="1" title="全部商品可用" lay-filter="goods-type" <?php if($list['goods_type'] == 1 OR empty($list)): ?>checked<?php endif; ?> >
                    <input type="radio" name="goods_type" value="2" title="指定商品可用" lay-filter="goods-type" <?php if($list['goods_type'] == 2): ?>checked<?php endif; ?> >
                    </div>
                </div>

                <div class="layui-form-item goods-div" style="display: none">
                    <label class="layui-form-label">商品</label>
                    <div class="layui-input-block">
                        <select name="goods_id" id="" lay-search>
                            <option value="">请选择商品</option>
                            <?php if(is_array($goods) || $goods instanceof \think\Collection || $goods instanceof \think\Paginator): if( count($goods)==0 ) : echo "" ;else: foreach($goods as $key=>$vo): ?>
                                <option value="<?php echo $vo['id']; ?>" <?php if($list['goods_id'] == $vo['id']): ?>selected<?php endif; ?> ><?php echo $vo['title']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item ">
                    <label class="layui-form-label">领取时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="start_time" value="<?php echo $list['start_time']; ?>" id="start" autocomplete="off" placeholder="领取优惠劵的开始时间" class="layui-input">
                    </div>
                    <div class="layui-form-mid" style="margin-left:10px">至</div>
                    <div class="layui-input-inline">
                        <input type="text" name="end_time" value="<?php echo $list['end_time']; ?>" id="end" autocomplete="off" placeholder="领取优惠劵的结束时间" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">满</label>
                    <div class="layui-input-inline">
                        <input type="text" name="full_price" value="<?php echo $list['full_price']; ?>" lay-verify="required" autocomplete="off" placeholder="￥0.00" class="layui-input">
                    </div>
                    <div class="layui-form-mid" style="margin-left:10px">减</div>
                    <div class="layui-input-inline">
                        <input type="text" name="less_price" value="<?php echo $list['less_price']; ?>" lay-verify="required" autocomplete="off" placeholder="￥0.00" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"> 满多少减多少</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" name="status" value="1" title='启用' <?php if($list['status'] == 1 OR empty($list)): ?>checked<?php endif; ?>>
                        <input type="radio" name="status" value="2" title='关闭' <?php if($list['status'] == 2): ?>checked<?php endif; ?>>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <input type="button" lay-submit id="transmit" lay-filter="LAY-user-back-submit" value="确认" class="layui-btn">
                        <button type="reset" class="layui-btn layui-btn-primary" onclick="javascript:history.go(-1)">返回</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>

    layui.use(['form','tableSelect','laydate'],function(){
        var form = layui.form;
        var laydate = layui.laydate;
        var tableSelect = layui.tableSelect;

        //监听单选框 指定商品
        form.on('radio(goods-type)', function(data){
            var val = data.value; //被点击的radio的value值
            console.log(val)
            if(val == 1){
                $('.goods-div').hide();
            }else{
                $('.goods-div').show();
            }
        }); 

        //开始时间
        laydate.render({
            elem: '#start', //指定元素
            type:'datetime',
            done:function(value,date){
                end.config.min = {
                    year:date.year,
                    month:date.month-1, 
                    date: date.date,
                };
                if(value > $('#end').val()){
                    $('#end').val('');
                }
            }
        });

        var end = laydate.render({
            elem: '#end', //指定元素
            type:'datetime',
        });
    })

    //表单上传
    fromUpload('form',"<?php echo url('Prom/save'); ?>");
</script>