<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:90:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/bargain/order_save.html";i:1572574346;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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

                    <label class="layui-form-label">省</label>

                    <div class="layui-input-block">

                        <input type="text" name="province" value="<?php echo $data['province']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入省" class="layui-input">

                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">市</label>
                    <div class="layui-input-block">
                        <input type="text" name="city" value="<?php echo $data['city']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入市" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">区</label>
                    <div class="layui-input-block">
                        <input type="text" name="area" value="<?php echo $data['area']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入区" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">详细地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" value="<?php echo $data['address']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入详细地址" class="layui-input">
                    </div>
                </div>
                <?php if($data['status'] == 1): ?>
                    <div class="layui-form-item">
                        <label class="layui-form-label">订单价格</label>
                        <div class="layui-input-block">
                            <input type="text" name="pay_money" value="<?php echo $data['pay_money']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入订单价格" class="layui-input">
                        </div>
                    </div>
                <?php endif; ?>


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

    // layui.use(['upload','laydate','form'],function(){

    //     var upload = layui.upload;

    //     var form = layui.form;



    //     //封面上传

    //     upload.render({

    //         elem: '#test1',

    //         auto: false,

    //         field:'icon',

    //         //,multiple: true

    //         bindAction: '#test1s',

    //         done: function(res){

    //             console.log(res)

    //         }

    //     });



    // });



    //表单上传

    fromUpload('form',"<?php echo url('Bargain/order_save'); ?>");

</script>