<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:82:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/point/save.html";i:1571106303;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/edit.html";i:1557216596;}*/ ?>
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
                <input type="hidden" name="id" id="goods_id" value="<?php echo input('id'); ?>">

                 <div class="layui-form-item">
                    <label class="layui-form-label">兑换等级</label>
                    <div class="layui-input-block">
                        <select name="grade_id" id="" lay-verify="required" lay-search>
                            <option value="">请选择会员等级</option>
                            <option value="1" <?php if($goods['grade_id'] == 1): ?>selected<?php endif; ?>>店铺会员</option>
                            <option value="2" <?php if($goods['grade_id'] == 2): ?>selected<?php endif; ?>>鱼家新粉</option>
                            <option value="3" <?php if($goods['grade_id'] == 3): ?>selected<?php endif; ?>>鱼家铁粉</option>
                            <option value="4" <?php if($goods['grade_id'] == 4): ?>selected<?php endif; ?>>鱼家真爱粉</option>
                            <option value="5" <?php if($goods['grade_id'] == 5): ?>selected<?php endif; ?>>鱼家粉你</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" value="<?php echo $goods['title']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div>

                 <div class="layui-form-item">
                    <label class="layui-form-label">发放总数</label>
                    <div class="layui-input-block">
                        <input type="text" name="stock" value="<?php echo $goods['stock']; ?>" lay-verify="required"  autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">兑换积分</label>
                    <div class="layui-input-block">
                        <input type="text" name="point" value="<?php echo $goods['point']; ?>" lay-verify="required"  autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div>

                 <div class="layui-form-item">
                   <label class="layui-form-label">商品状态</label>
                   <div class="layui-input-block">
                    <?php if($goods['status']): ?>
                     <input type="radio" name="status" value="1" title="兑换中" <?php if($goods['status'] == 1): ?>checked<?php else: endif; ?>>
                     <input type="radio" name="status" value="2" title="仓库中" <?php if($goods['status'] == 2): ?>checked<?php else: endif; ?>>
                     <?php else: ?>
                      <input type="radio" name="status" value="1" title="兑换中" checked>
                       <input type="radio" name="status" value="2" title="仓库中">
                     <?php endif; ?>
                   </div>
                 </div>

                  <div class="layui-form-item">
                    <label class="layui-form-label">限兑一件</label>
                    <div class="layui-input-block">
                     <?php if($goods['status']): ?>
                      <input type="radio" name="limit_status" value="1" title="是" <?php if($goods['limit_status'] == 1): ?>checked<?php else: endif; ?>>
                      <input type="radio" name="limit_status" value="2" title="否" <?php if($goods['limit_status'] == 2): ?>checked<?php else: endif; ?>>
                      <?php else: ?>
                       <input type="radio" name="limit_status" value="1" title="是" checked>
                        <input type="radio" name="limit_status" value="2" title="否">
                      <?php endif; ?>
                    </div>
                  </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品封面</label>
                    <div class="layui-input-block layui-upload">
                        <button type="button" class="layui-btn layui-btn-normal file" id="test1"><i class="layui-icon"></i>上传封面</button>
                        <input class="layui-upload-file" type="file" accept="undefined" name="file" id="test1s">
                        <span class="layui-inline layui-upload-choose">支持 png、jpg、jpeg 格式文件</span>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品相册</label>
                    <div class="layui-input-block layui-upload">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="test2"><i class="layui-icon"></i>上传相册</button><input class="layui-upload-file" type="file" accept="undefined" multiple="">

                            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                                预览图：
                                <div class="layui-upload-list">
                                    <div style="display: flex;" id="demo2">

                                        <?php if(is_array($goods['images']) || $goods['images'] instanceof \think\Collection || $goods['images'] instanceof \think\Paginator): if( count($goods['images'])==0 ) : echo "" ;else: foreach($goods['images'] as $key=>$vo): ?>
                                            <div style="margin:0 10px" class="deledata">
                                                <img style="width:100px;margin:0 10px" src="<?php echo $vo; ?>" alt="" class="layui-upload-img">
                                                <div class="dele" style="text-align:center;border:1px solid #999;margin-top:5px;cursor:pointer">删除</div>
                                                <input type="hidden" name="files[]" value="<?php echo $vo; ?>"/>
                                            </div>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>

                                    </div>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                </div>



                <div class="layui-form-item">
                   <label class="layui-form-label">商品详情</label>
                   <div class="layui-input-block">
                       <textarea placeholder="请输入商品详情" lay-verify="required" name="desc" class="layui-textarea edit"><?php echo $goods['desc']; ?></textarea>
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

        //多图片上传
        upload.render({
            elem: '#test2',
            url:"/admin/common/fileupload.html",
            multiple:true,
            number:6,
            size:'3000',
            choose: function(obj){
                var files = obj.pushFile();
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    str = '<div style="margin:0 10px" class="deledata"><img style="width:100px;margin:0 10px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img"><div class="dele" style="text-align:center;border:1px solid #999;margin-top:5px;cursor:pointer">删除</div></div>';
                    $('#demo2').append(str);
                });
                $('.add_img').remove();
            },
            done:function(res, index, upload){
                console.log(res);
                $('#demo2').append('<input class="add_img" type="hidden" name="files[]" value="'+res.link+'"/>');
            }
        });

    });

    //表单上传
    fromUpload('form',"<?php echo url('Point/save'); ?>");

    $('.edit').editable({
        inlineMode: false,
        alwaysBlank: true,
        language: "zh_cn",
        imageUploadURL:"<?php echo url('common/fileUpload'); ?>"
    })
</script>