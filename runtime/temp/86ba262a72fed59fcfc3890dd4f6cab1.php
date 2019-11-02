<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:87:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/user/grade_save.html";i:1557284280;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
                <input type="hidden" name="id" id="goods_id" value="<?php echo input('id'); ?>">

                <div class="layui-form-item">
                    <label class="layui-form-label">等级名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" value="<?php echo $list['title']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div> 

                <div class="layui-form-item">
                    <label class="layui-form-label">条件金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="full_price" value="<?php echo $list['full_price']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">等级图标</label>
                    <div class="layui-input-block layui-upload">
                        <button type="button" class="layui-btn layui-btn-normal file" id="test1"><i class="layui-icon"></i>上传图标</button>
                        <input class="layui-upload-file" type="file" accept="undefined" name="file" id="test1s">
                        <span class="layui-inline layui-upload-choose">支持 png、jpg、jpeg 格式文件</span>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">积分抵扣</label>
                    <div class="layui-input-block">
                        <input type="radio" name="is_point" value="1" title="关闭" <?php if($list['is_point'] == 1 OR empty($list)): ?>checked<?php endif; ?>>
                        <input type="radio" name="is_point" value="2" title="开通" <?php if($list['is_point'] == 2): ?>checked<?php endif; ?>>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">积分兑换</label>
                    <div class="layui-input-block">
                        <input type="radio" name="is_convert" value="1" title="关闭" <?php if($list['is_convert'] == 1 OR empty($list)): ?>checked<?php endif; ?>>
                        <input type="radio" name="is_convert" value="2" title="开通" <?php if($list['is_convert'] == 2): ?>checked<?php endif; ?>>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">设为默认</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="is_default" value="1" title="否" <?php if($list['is_default'] == 1 OR empty($list)): ?>checked<?php endif; ?>>
                        <input type="radio" name="is_default" value="2" title="是" <?php if($list['is_default'] == 2): ?>checked<?php endif; ?>>
                    </div>
                    <div class="layui-form-mid layui-word-aux">设为用户默认等级，将在用户注册时自动成为该等级会员</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">等级折扣</label>
                    <div class="layui-input-block">
                        <input type="text" name="discount" value="<?php echo $list['discount']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">生日折扣</label>
                    <div class="layui-input-block">
                        <input type="text" name="birthday_discount" value="<?php echo $list['birthday_discount']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">等级描述</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入等级描述" lay-verify="required" name="desc" class="layui-textarea edit"><?php echo $list['desc']; ?></textarea>
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
    layui.use(['upload','laydate','form','element'],function(){
        var upload = layui.upload;
        var form = layui.form;
        var element = layui.element;
        //封面上传
        upload.render({
            elem: '#test1',
            auto: false,
            field:'pic',
            //,multiple: true
            bindAction: '#test1s',
            done: function(res){
              console.log(res)
            }
        });

    });
    //表单上传
    fromUpload('form',"<?php echo url('User/grade_save'); ?>");
</script>