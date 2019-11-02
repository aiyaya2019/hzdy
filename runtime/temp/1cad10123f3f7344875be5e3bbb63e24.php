<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:88:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/prom/coupon_save.html";i:1564540957;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
                <!-- <input type="hidden" name="type" value="1"> -->

                <div class="layui-form-item">
                    <label class="layui-form-label">满</label>
                    <div class="layui-input-inline">
                        <input type="text" name="full_price" value="<?php echo $list['full_price']; ?>" lay-verify="required" autocomplete="off" placeholder="￥0.00" class="layui-input">
                    </div>
                    <div class="layui-form-mid" style="margin-left:10px">减</div>
                    <div class="layui-input-inline">
                        <input type="text" name="less_price" value="<?php echo $list['less_price']; ?>" lay-verify="required" autocomplete="off" placeholder="￥0.00" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">满多少减多少</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">发送对象</label>
                    <div class="layui-input-block">
                    <input type="radio" name="type" value="1" title="全部用户" lay-filter="send-type" <?php if($list['type'] == 1 OR empty($list)): ?>checked<?php endif; ?> >
                    <input type="radio" name="type" value="2" title="指定用户" lay-filter="send-type" <?php if($list['type'] == 2): ?>checked<?php endif; ?> >
                    <input type="radio" name="type" value="3" title="指定等级" lay-filter="send-type" <?php if($list['type'] == 3): ?>checked<?php endif; ?> >
                    </div>
                </div>

                <div class="layui-form-item user-div" style="display: none">
                    <label class="layui-form-label">用户</label>
                    <div class="layui-input-block">
                        <select name="uid" id="" lay-search>
                            <option value="">用户</option>
                            <?php if(is_array($user) || $user instanceof \think\Collection || $user instanceof \think\Paginator): if( count($user)==0 ) : echo "" ;else: foreach($user as $key=>$vo): ?>
                                <option value="<?php echo $vo['id']; ?>" <?php if($list['uid'] == $vo['id']): ?>selected<?php endif; ?> ><?php echo $vo['nickname']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item grade-div" style="display: none">
                    <label class="layui-form-label">等级</label>
                    <div class="layui-input-block">
                        <select name="grade_id" id="" lay-search>
                            <option value="">请选择等级</option>
                            <?php if(is_array($grade) || $grade instanceof \think\Collection || $grade instanceof \think\Paginator): if( count($grade)==0 ) : echo "" ;else: foreach($grade as $key=>$vo): ?>
                                <option value="<?php echo $vo['id']; ?>" <?php if($list['grade_id'] == $vo['id']): ?>selected<?php endif; ?> ><?php echo $vo['title']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                </div>

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


                <div class="layui-form-item">
                    <label class="layui-form-label">是否允许</label>
                    <div class="layui-input-block">
                        <input type="radio" name="point_status" value="2" title='不允许积分兑换' lay-filter="use-point" <?php if($list['point_status'] == 1 OR empty($list)): ?>checked<?php endif; ?>>
                        <input type="radio" name="point_status" value="1" title='允许积分兑换' lay-filter="use-point" <?php if($list['point_status'] == 2): ?>checked<?php endif; ?>>
                    </div>
                </div>

                <div class="layui-form-item is_type" style="display: none">
                    <label class="layui-form-label">所需积分</label>
                    <div class="layui-input-block">
                       <input type="text" name="point" value="<?php echo (isset($list['point']) && ($list['point'] !== '')?$list['point']:''); ?>" autocomplete="off" placeholder="请输入内容" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">有效天数</label>
                    <div class="layui-input-block">
                       <input type="text" name="day" value="<?php echo $list['day']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
                       <div class="layui-form-mid layui-word-aux">用户领取后 多少天内有效 如是指定用户，则是发放后多少天内有效</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">一人能领多少张</label>
                    <div class="layui-input-block">
                       <input type="number" name="num" value="<?php echo $list['num']; ?>" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
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

        form.render();

        tableSelect.render({
            elem: '#user',  //定义输入框input对象 必填
            checkedKey: 'id', //表格的唯一建值，非常重要，影响到选中状态 必填
            searchKey: 'nickname',   //搜索输入框的name值 默认keyword
            searchPlaceholder: '关键词搜索', //搜索输入框的提示文字 默认关键词搜索
            table: {    //定义表格参数，与LAYUI的TABLE模块一致，只是无需再定义表格elem
                url:"<?php echo url('User/index'); ?>",
                method:'post',
                response:{
                    statusCode:200
                },
                page:{
                    layout:['prev','page','next','skip','count']
                },
                limit:20,
                cols: [[
                    {type:'checkbox'},
                    {field:'nickname',title:'昵称'},
                ]]
            },
            done: function (elem, data) {
                //选择完后的回调，包含2个返回值 elem:返回之前input对象；data:表格返回的选中的数据 []
                //拿到data[]后 就按照业务需求做想做的事情啦~比如加个隐藏域放ID...
                var NEWJSON = [];
                var uid = [];
                layui.each(data.data, function (index, item) {
                    NEWJSON.push(item.nickname);
                    uid.push(item.id);
                })
                elem.val(NEWJSON.join(","));
                $('#uid').val(uid.join(","));
                form.render();
            }
        })

        //监听单选框 是否使用积分
        form.on('radio(use-point)', function(data){
            var val = data.value; //被点击的radio的value值
            console.log(val)
            if(val == 2){
                $('.is_type').hide();
            } else {
                $('.is_type').show();
            }
        });  

        //监听单选框 发送对象
        form.on('radio(send-type)', function(data){
            var val = data.value; //被点击的radio的value值
            console.log(val)
            if(val == 1){
                $('.user-div').hide();
                $('.grade-div').hide();
            } else if(val == 2) {
                $('.user-div').show();
                $('.grade-div').hide();
            }else{
                $('.user-div').hide();
                $('.grade-div').show();
            }
        });  

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
    fromUpload('form',"<?php echo url('Prom/coupon_save'); ?>");
</script>