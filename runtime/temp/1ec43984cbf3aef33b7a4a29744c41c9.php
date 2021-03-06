<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:83:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/config/save.html";i:1570864376;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/edit.html";i:1557216596;}*/ ?>
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
				<input type="hidden" name="id" value="<?php echo (isset($data['id']) && ($data['id'] !== '')?$data['id']:''); ?>">

				<div class="layui-form-item">
					<label class="layui-form-label">轮播图名称</label>
					<div class="layui-input-block">
						<input type="text" name="title" value="<?php echo (isset($data['title']) && ($data['title'] !== '')?$data['title']:''); ?>" lay-verify="required" autocomplete="off" placeholder="请输入轮播图名称" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">轮播图图片</label>
					<div class="layui-input-block layui-upload">
						<button type="button" class="layui-btn layui-btn-normal file" id="test1"><i class="layui-icon"></i>上传图片</button>
						<input class="layui-upload-file" type="file" accept="undefined" name="file" id="test1s">
						<span class="layui-inline layui-upload-choose">支持 png、jpg、jpeg 格式文件</span>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">跳转地址</label>
					<div class="layui-input-block">
						<input type="text" name="url" value="<?php echo (isset($data['url']) && ($data['url'] !== '')?$data['url']:'#'); ?>" lay-verify="required" autocomplete="off" placeholder="请输入轮播图跳转链接地址" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
                    <label class="layui-form-label">排序</label>
                    <div class="layui-input-block">
                        <input type="text" name="sort" value="<?php echo (isset($data['sort']) && ($data['sort'] !== '')?$data['sort']:''); ?>" lay-verify="required" autocomplete="off" placeholder="请输入排序，数字越大越靠前" class="layui-input">
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
    layui.use(['upload','form'],function(){
        var upload = layui.upload;
        var form = layui.form;

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
    fromUpload('form',"<?php echo url('Config/save'); ?>");
</script>