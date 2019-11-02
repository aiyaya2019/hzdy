<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:87:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/goods/attr_spec.html";i:1564221146;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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

                <!-- //规格信息 -->
                <?php if(is_array($goods_spec) || $goods_spec instanceof \think\Collection || $goods_spec instanceof \think\Paginator): if( count($goods_spec)==0 ) : echo "" ;else: foreach($goods_spec as $k=>$vo): ?>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><span class="removes">[ - ]</span>规格属性</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" value="<?php echo $vo['title']; ?>" placeholder="请输入商品规格属性" autocomplete="off" class="layui-input name change">
                        </div>
                    </div>
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">*属性值</label>
                        <div class="layui-input-block specs" data-id="<?php echo $k+1; ?>">

                            <?php if(is_array($vo['spec']) || $vo['spec'] instanceof \think\Collection || $vo['spec'] instanceof \think\Paginator): if( count($vo['spec'])==0 ) : echo "" ;else: foreach($vo['spec'] as $key=>$val): ?>

                            <div class="layui-input-inline pane">
                                <input type="checkbox" class="data_id" data-id="<?php echo $k+1; ?>_<?php echo $val['ap_id']; ?>" lay-skin="primary" lay-filter="item" <?php if(in_array($val['ap_id'],$default)): ?>checked<?php endif; ?> >
                                <input type="text" class="layui-input spec change" value="<?php echo $val['title']; ?>" placeholder="属性值">
                            </div>
                            <div class="layui-input-inline remove">[移除]</div>

                            <?php endforeach; endif; else: echo "" ;endif; ?>

                            <div class="layui-btn layui-btn-sm adds" style="margin-top:4px"><i class="layui-icon"></i></div>

                        </div>
                    </div>
                <?php endforeach; endif; else: echo "" ;endif; ?>

                <div class="layui-form-item layui-input-inline add">
                    <div class="layui-input-block">
                        <div class="layui-btn"><i class="layui-icon"></i>添加规格属性</div>
                    </div>
                </div>

                <div id="sku" data-item="" data-data=""></div>

                <div id="data-html"></div>

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
<!-- /添加规格属性模板 -->
<div id="block" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label"><span class="removes">[ - ]</span>规格属性</label>
        <div class="layui-input-block">
            <input type="text" name="title" value="" placeholder="请输入商品规格属性" autocomplete="off" class="layui-input name change">
        </div>
    </div>
    <div class="layui-form-item" pane>
        <label class="layui-form-label">*属性值</label>
        <div class="layui-input-block specs" data-id="i">
            <div class="layui-input-inline pane">
                <input type="checkbox" class="data_id" data-id="i_s" style="float:left" lay-skin="primary" lay-filter="item">
                <input type="text" class="layui-input spec change" placeholder="属性值" style="float:left">
            </div>
            <div class="layui-input-inline remove">[移除]</div>
            <div class="layui-btn layui-btn-sm adds" style="margin-top:4px"><i class="layui-icon"></i></div>
        </div>
    </div>
</div>
<script>
    layui.use(['laydate','sku','form'],function(){
        var form = layui.form;
        var sku = layui.sku;

        //商品SKU
        var datas = [];
        var item = <?php echo $item; ?>;
        var data = [];
        var $body = $('body');
        var SKU;
        var table_data = [{name:'价格',key:'price'},{name:'市场价格',key:'old_price'},{name:'库存',key:'stock'},{name:'运费',key:'fare_money'}];
        

        //更新规格表格
        var table = function(){            
            var t = [],f=[],l=[],i = 1,a = 1,m = 0,status=false;
            $('.name').each(function(index,val){
                var n = $('.name').eq(index).val();
                if(n){
                    var d = [];
                    $('.specs:eq('+index+') .spec').each(function(key,val){
                        var s = $('.specs:eq('+index+') .spec').eq(key).val();
                        if(s.length > 0){ 
                            d[key] = {"id":a,"name":s}; 
                            var data_id = i+'_'+a;
                            $('.specs:eq('+index+') .data_id').eq(key).attr('data-id',data_id);
                            //获取原本被选中的内容
                            if($('.specs:eq('+index+') .data_id').eq(key).is(':checked')){
                                //获取输入框的值
                                var value = $('.specs:eq('+index+') .data_id').eq(key).val();
                                var id = $('.specs:eq('+index+') .data_id').eq(key).attr('data-id');
                                id = id.split('_');
                                var ids = id[0];
                                var val = id[1];
                                f = [{[ids]:val}];
                                l.push({"ids":f,"price":0,"old_price":0,"stock":0,"fare_money":0})
                                m++;
                                status = true;
                            }
                            a++;
                        }
                    })
                    console.log(d);
                    t[index] = {'id':i,'name':n,"sub":d};
                }
                i++;
            })
            $('#content').remove();
            $('#skus').remove();
            if(status){ data = l; console.log(l)}
            SKU = sku.init({id:'sku',item:t,data:data},table_data);
        }

        $body.on('change','.change',function(){
            table();
        })

        //初始化选项
        if(item.length > 0){
            datas = <?php echo $data; ?>;
            SKU = sku.init({id:'sku',item:item,data:datas},table_data);
        }

        //打印结果数据 调试用
        $('#transmit').click(function(){
            var data = SKU.getData();
            var data2 = SKU.getItem();
            //$('#data-html').html(JSON.stringify(data)+"<br><br>"+JSON.stringify(data2));
        })

        //添加属性值框
        $body.on('click','.adds',function(){
            var num = $('.adds').index($(this));
            var i = num + 1;
            var s = $('.spec').length;
            var data_id = i+'_'+s;
            var str = '';
                str += '<div class="layui-input-inline pane">';
                str += '<input type="checkbox" class="data_id" data-id="'+data_id+'" style="float:left" lay-skin="primary" lay-filter="item">';
                str += '<input type="text" class="layui-input spec change" style="float:left" placeholder="属性值">';
                str += '</div>';
                str += '<div class="layui-input-inline remove">[移除]</div>';
            $('.adds').eq(num).before(str);
            form.render();
        })

        //添加规格属性框
        $('.add').click(function(){
            var i = $('.name').length;
            var h = $('#block').html();
            var s = $('.spec').length;
            h = h.replace(/data-id="i"/g, "data-id='"+i+"'");
            h = h.replace(/data-id="i_s"/g, "data-id='"+i+"_"+s+"'");
            $(this).before(h);
            form.render();
        })

        //移除单个属性
        $body.on('click','.remove',function(){
            var num = $('.remove').index($(this));
            $('.remove').eq(num).remove();
            $('.pane').eq(num).remove();
            table();
        })

        //删除整个规格属性
        $body.on('click','.removes',function(){
            var num = $('.removes').index($(this));
            $(this).closest('.layui-form-item').remove();
            $('[pane]').eq(num).remove();
            table();
        })

        $('#transmit').click(function(){
            var url = "<?php echo url('Goods/attr_spec'); ?>";
            var data = {
                attr:SKU.getItem(),
                spec:SKU.getData(),
                goods_id:$('#goods_id').val(),
            };
            get_request(url,data,function(data){
                if(data.code == 200){
                    layer.msg(data.msg,{time:1500},function(){
                        window.location.href= "<?php echo url('Goods/index'); ?>";
                    });
                } else {
                    layer.msg(data.msg);
                }
            })
            //调试用
            //console.log(SKU.getItem());
            //console.log(SKU.getData());
        })

    });
</script>