<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:87:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/spike/time_save.html";i:1557478252;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
        <div class="layui-form" lay-filter="layuiadmin-form-admin" style="padding: 20px 30px 1px 0;">
            <form action="" class="layui-form">
                <input type="hidden" name="id" value="<?php echo input('id'); ?>">

                <div class="layui-form-item">
                    <label class="layui-form-label">秒杀时段</label>
                    <div class="layui-input-inline">
                        <input type="text" name="start_time" value="<?php echo $list['start_time']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input" id="start">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline">
                        <input type="text" name="end_time" value="<?php echo $list['end_time']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input" id="end">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <input type="button" lay-submit id="transmit" lay-filter="LAY-user-back-submit" value="确认" class="layui-btn">
                        <!-- <button type="reset" class="layui-btn layui-btn-primary" onclick="javascript:history.go(-1)">返回</button> -->
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    layui.use(['laydate'],function(){
        var laydate = layui.laydate;

        laydate.render({
            elem:"#start",
            type:'datetime',
            min:'new Date()',
            done:function(value,date){
                console.log(date);
                end.config.min = {
                    year:date.year,
                    month:date.month-1, 
                    date: date.date,
                    hours:date.hours,
                    minutes:date.minutes,
                };
                if(value > $('#end').val()){
                    $('#end').val('');
                }
            }
        })

        var end = laydate.render({
            elem:"#end",
            type:'datetime',
        })

    });

    //表单上传
    fromUpload('form',"<?php echo url('Spike/time_save'); ?>");
</script>