<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:86:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/limit/delivery.html";i:1564823619;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
        <div class="layui-form"  lay-filter="layuiadmin-form-admin" style="padding: 20px 30px 1px 0;">
            <form action="" class="layui-form">
                <input type="hidden" name="id" value="<?php echo input('id'); ?>">

                <div class="layui-form-item">
                    <label class="layui-form-label">快递公司</label>
                    <div class="layui-input-block">
                        <select class="layui-select" name="logistics_id" lay-search>
                            <?php if(is_array($logistics) || $logistics instanceof \think\Collection || $logistics instanceof \think\Paginator): if( count($logistics)==0 ) : echo "" ;else: foreach($logistics as $key=>$vo): ?>
                                <option value="<?php echo $vo['id']; ?>"><?php echo $vo['name']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">快递单号</label>
                    <div class="layui-input-block">
                        <input name="logistics_no" required value='<?php echo (isset($vo['logistics_no']) && ($vo['logistics_no'] !== '')?$vo['logistics_no']:""); ?>' placeholder="请输入快递单号" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <input type="button" lay-submit id="transmit" lay-filter="LAY-user-back-submit" value="确认" class="layui-btn">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    layui.use(['form'],function() {
        var form = layui.form;
    });

    // 表单提交
    fromUpload('form',"<?php echo url('Limit/delivery'); ?>",function(data){
        if(data.code == 200){
            layer.msg(data.msg,{time:1000},function(){
               //返回上一页刷新
                parent.refresh();
            });
        } else {
            layer.msg(data.msg,{time:3000});
        }
    });
</script>
