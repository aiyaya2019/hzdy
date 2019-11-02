<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"/klwl_web/klwl_pj/hzdy.kailly.com/public/../application/admin/view/index/index.html";i:1552352846;s:73:"/klwl_web/klwl_pj/hzdy.kailly.com/application/admin/view/common/meta.html";i:1552356108;}*/ ?>
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
    


<body class="layui-layout-body">
	<div id="LAY_app">
		<div class="layui-layout layui-layout-admin">

			<div class="layui-header">
				<!-- 头部区域 -->
                <ul class="layui-nav layui-layout-left">
                    <li class="layui-nav-item layadmin-flexible" lay-unselect>
                        <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                            <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                        </a>
                    </li>
                    <li class="layui-nav-item layui-hide-xs" lay-unselect>
                        <a href="/" target="_blank" title="前台">
                            <i class="layui-icon layui-icon-website"></i>
                        </a>
                    </li>
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;" layadmin-event="refresh" title="刷新">
                            <i class="layui-icon layui-icon-refresh-3"></i>
                        </a>
                    </li>
                    <!-- <li class="layui-nav-item layui-hide-xs" lay-unselect>
                        <input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search" layadmin-event="serach" lay-action="template/search.html?keywords=">
                    </li> -->
                </ul>
                <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                    <!-- <li class="layui-nav-item" lay-unselect>
                        <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
                            <i class="layui-icon layui-icon-notice"></i>
                            如果有新消息，则显示小圆点
                            <span class="layui-badge-dot"></span>
                        </a>
                    </li> -->
                    <li class="layui-nav-item layui-hide-xs" lay-unselect>
                        <a href="javascript:;" layadmin-event="theme">
                            <i class="layui-icon layui-icon-theme"></i>
                        </a>
                    </li>
                    <li class="layui-nav-item layui-hide-xs" lay-unselect>
                        <a href="javascript:;" layadmin-event="note">
                            <i class="layui-icon layui-icon-note"></i>
                        </a>
                    </li>
                    <li class="layui-nav-item layui-hide-xs" lay-unselect>
                        <a href="javascript:;" layadmin-event="fullscreen">
                            <i class="layui-icon layui-icon-screen-full"></i>
                        </a>
                    </li>
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;">
                            <cite><?php echo $AdminInfo['name']; ?></cite>
                        </a>
                        <dl class="layui-nav-child">
                           <!--  <dd><a lay-href="set/user/info.html">基本资料</a></dd>
                            <dd><a lay-href="set/user/password.html">修改密码</a></dd> -->
                            <hr>
                            <dd onclick="out()" style="text-align: center;cursor:pointer;"><a>退出</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item layui-hide-xs" lay-unselect>
                        <a href="javascript:;"><i class="layui-icon layui-icon-more-vertical"></i></a>
                        <!-- class layadmin-event="about" -->
                    </li>
                    <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                        <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                    </li>
                </ul>
			</div>

			 <!-- 侧边菜单 -->
            <div class="layui-side layui-side-menu">
            	<div class="layui-side-scroll">
					<div class="layui-logo" lay-href="home/console.html">
                        <span style="font-weight: bold;"><?php echo $config['title']; ?></span>
                    </div>
                    <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    	<li data-name="home" class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;" lay-tips="主页" lay-direction="2">
                                <i class="layui-icon layui-icon-home"></i>
                                <cite>主页</cite>
                            </a>
                            <dl class="layui-nav-child">	
                                <dd data-name="console" class="layui-this">
                                    <a lay-href="home/console.html">控制台</a>
                                </dd>
                            </dl>
                        </li>
                    <?php if(is_array($nav['coll']) || $nav['coll'] instanceof \think\Collection || $nav['coll'] instanceof \think\Paginator): if( count($nav['coll'])==0 ) : echo "" ;else: foreach($nav['coll'] as $key=>$vo): ?>
                        <li data-name="home" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="<?php echo $vo['title']; ?>" lay-direction="2">
                                <i class="layui-icon iconfont <?php echo $vo['icon']; ?>"></i>
                                <cite><?php echo $vo['title']; ?></cite>
                            </a>
                            <dl class="layui-nav-child">
                                <?php if(is_array($nav['Access']) || $nav['Access'] instanceof \think\Collection || $nav['Access'] instanceof \think\Paginator): if( count($nav['Access'])==0 ) : echo "" ;else: foreach($nav['Access'] as $key=>$val): if($val['pid'] == $vo['id']): ?>
                                <dd data-name="console">
                                    <a lay-href="<?php echo url($vo['url'].'/'.$val['url']); ?>"><?php echo $val['title']; ?></a>
                                </dd>
                                <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                            </dl>
                        </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
            	</div>
            </div>

            <!-- 页面标签 -->
            <div class="layadmin-pagetabs" id="LAY_app_tabs">
                <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
                <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
                <div class="layui-icon layadmin-tabs-control layui-icon-down">
                    <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                        <li class="layui-nav-item" lay-unselect>
                            <a href="javascript:;"></a>
                            <dl class="layui-nav-child layui-anim-fadein">
                                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                            </dl>
                        </li>
                    </ul>
                </div>
                <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                    <ul class="layui-tab-title" id="LAY_app_tabsheader">
                        <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
                    </ul>
                </div>
            </div>

            <!-- 主体内容 -->
            <div class="layui-body" id="LAY_app_body">
                <div class="layadmin-tabsbody-item layui-show">
                    <iframe src="<?php echo url('index/console'); ?>" frameborder="0" class="layadmin-iframe"></iframe>
                </div>
            </div>
			
			<!-- 辅助元素，一般用于移动设备下遮罩 -->
            <div class="layadmin-body-shade" layadmin-event="shade"></div>

		</div>
	</div>

	<script src="/static/admin/layui/layui.js"></script>
	<script>
        layui.config({
            base: "/static/admin/" //静态资源所在路径
        }).extend({
            index: 'lib/index' //主入口模块
        }).use('index');

        /**---退出---**/
        function out()
        {
            layer.confirm('您确定要退出吗？', {
                title:'提示信息',
                btn: ['确定','取消'] //按钮
            }, function(){
                layer.msg('安全退出中...',{time:1500},function(){
                    window.location.href="<?php echo url('Login/logout'); ?>";
                });

            });
        }
    </script>
</body>
</html>