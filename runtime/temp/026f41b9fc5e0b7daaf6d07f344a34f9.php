<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:84:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/config/index.html";i:1571111085;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/edit.html";i:1557216596;}*/ ?>
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
                <div class="layui-form-item">
                    <label class="layui-form-label">网站标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" value="<?php echo $config['title']; ?>" autocomplete="off" placeholder="请输入网站标题" class="layui-input">
                    </div>
                </div>



                <div class="layui-form-item">
                    <label class="layui-form-label">APPID</label>
                    <div class="layui-input-block">
                        <input type="text" name="appid" value="<?php echo $config['appid']; ?>" autocomplete="off" placeholder="请输入APPID" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">AppSecret</label>
                    <div class="layui-input-block">
                        <input type="text" name="appsecret" value="<?php echo $config['appsecret']; ?>" autocomplete="off" placeholder="请输入AppSecret" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">Mch_id</label>
                    <div class="layui-input-block">
                        <input type="text" name="mchid" value="<?php echo $config['mchid']; ?>" autocomplete="off" placeholder="请输入商户号" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">KEY</label>
                    <div class="layui-input-block">
                        <input type="text" name="key" value="<?php echo $config['key']; ?>" autocomplete="off" placeholder="请输入支付KEY" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">签到积分</label>
                    <div class="layui-input-block">
                        <input type="text" name="sign_point" value="<?php echo $config['sign_point']; ?>"  autocomplete="off" placeholder="请输入用户每天签到可获得积分值" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">推荐积分</label>
                    <div class="layui-input-block">
                        <input type="text" name="reco_point" value="<?php echo $config['reco_point']; ?>" autocomplete="off" placeholder="请输入会员推荐好友加入获得积分值" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邀请人数</label>
                    <div class="layui-input-block">
                        <input type="text" name="friend_num" value="<?php echo $config['friend_num']; ?>" autocomplete="off" placeholder="请输入邀请人数" class="layui-input">
                    </div>
                </div>
                 <div class="layui-form-item">
                    <label class="layui-form-label">邀请奖励</label>
                    <div class="layui-input-block">
                        <input type="text" name="friend_money" value="<?php echo $config['friend_money']; ?>" autocomplete="off" placeholder="请输入邀请好友奖励的金额" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">分享标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="share_title" value="<?php echo $config['share_title']; ?>" autocomplete="off" placeholder="分享标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">分享图片</label>
                    <div class="layui-input-block layui-upload">
                        <button type="button" class="layui-btn layui-btn-normal file" id="test1"><i class="layui-icon"></i>上传图片</button>
                        <input class="layui-upload-file" type="file" accept="undefined" name="file" id="test1s">
                        <span class="layui-inline layui-upload-choose">支持 png、jpg、jpeg 格式文件</span>
                    </div>
                    <div class="layui-input-block" style="margin-top:5px">
                        <img style="width:70px" id="img" src="<?php echo $config['share_pic']; ?>" alt="">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">公共内容</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入公共内容" lay-verify="required" name="pub_content" class="layui-textarea edit"><?php echo $config['pub_content']; ?></textarea>
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
<!-- 编辑器文件库 -->
<link rel="stylesheet" href="/static/Edit/css/froala_editor.min.css">
<link rel="stylesheet" href="/static/Edit/css/font-awesome.min.css">
<script src="/static/Edit/js/froala_editor.min.js"></script>
  <!--[if lt IE 9]>
    <script src="/static/Edit/js/froala_editor_ie8.min.js"></script>
  <![endif]-->

<script src="/static/Edit/js/plugins/tables.min.js"></script>  			<!--表格-->
<script src="/static/Edit/js/plugins/lists.min.js"></script> 			<!--编号-->
<script src="/static/Edit/js/plugins/colors.min.js"></script> 			<!--颜色-->
<script src="/static/Edit/js/plugins/media_manager.min.js"></script>	<!--未知-->
<script src="/static/Edit/js/plugins/font_family.min.js"></script>		<!--字体-->
<script src="/static/Edit/js/plugins/font_size.min.js"></script>		<!--大小-->
<script src="/static/Edit/js/plugins/block_styles.min.js"></script>		<!--样式-->
<!-- <script src="/static/Edit/js/plugins/video.min.js"></script> -->			<!--视频-->
<script src="/static/Edit/js/langs/zh_cn.js"></script>					<!--语言-->

 <!-- 
 用法
 $('#edit').editable({inlineMode: false, alwaysBlank: true}) 
 language: "zh_cn", 声明中文菜单
 imageUploadURL:xxxx  图片上传地址  返回样式为  link:xxx图片地址
 -->
<script>
    //表单上传
    fromUpload('form',"<?php echo url('Config/index'); ?>",function(data){
        if(data.code == 200){
            layer.msg(data.msg,{time:1500});
        } else {
            layer.msg(data.msg,{time:3000});
        }
    });

    //图片阅览
    $('#test1').click(function(){
        $('#test1s').click();
    })
    $('#test1s').change(function(e){
        var imgBox = e.target;
        var img = getObjectURL(imgBox.files[0]);
        $('#img').attr('src',img);
    });

    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }

    $('.edit').editable({
        inlineMode: false, 
        alwaysBlank: true,
        language: "zh_cn",
        imageUploadURL:"<?php echo url('common/fileUpload'); ?>"
    }) 
</script>