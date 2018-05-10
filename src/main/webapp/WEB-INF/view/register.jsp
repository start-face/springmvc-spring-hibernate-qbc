<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/4/30
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrom=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/common/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/common/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/lib/Hui-iconfont/1.0.8/iconfont.min.css"/>
    <!--[if lt IE 9]>
    <link href="/common/static/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css"/>
    <![endif]-->
    <!--[if IE 6]>
    <script type="text/javascript" src="/common/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <style type="text/css">
        .ui-sortable .panel-header {
            cursor: move
        }
    </style>
    <title>欢迎注册</title>
</head>

<body>
<div class="sideBox">
    <ul class="nav navbar-nav pt-20">
        <li><a href="about.html">登录/注册</a></li>
        <li><a href="jiansuo.html">技术检索</a></li>
        <li><a href="about.html">关于我们</a></li>
        <li><a href="#">联系我们</a></li>
        <li><a href="#">隐私保护</a></li>
        <li><a href="#">免责声明</a></li>
        <li><a href="#">支付方式</a></li>
    </ul>
</div>
<div class="containBox">
    <div class="containBox-bg"></div>
    <header class="navbar-wrapper">
        <div class="navbar navbar-black navbar-fixed-top">
            <div class="container cl">
                <a class="logo navbar-logo hidden-xs" href="/aboutHui.shtml">H-ui前端框架</a>
                <a class="logo navbar-logo-m visible-xs" href="/aboutHui.shtml">H-ui</a>
                <span class="logo navbar-slogan hidden-xs">XX网站</span>
                <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs JS-nav-toggle" href="javascript:;">&#xe667;</a>
                <nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
                    <ul class="cl">
                        <li class="current">
                            <a href="http://www.h-ui.net/" target="_blank">首页</a>
                        </li>
                        <li>
                            <a href="http://www.h-ui.net/Hui-overview.shtml" target="_blank">核心</a>
                        </li>
                        <li>
                            <a href="http://www.h-ui.net/lib/jQuery.cookie.js.shtml" target="_blank">脚本</a>
                        </li>
                        <li class="dropDown dropDown_hover">
                            <a href="javascript:;" class="dropDown_A">工具 <i class="Hui-iconfont">&#xe6d5;</i></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <li>
                                    <a href="http://www.h-ui.net/bug.shtml" target="_blank">Bug兼容性汇总</a>
                                </li>
                                <li>
                                    <a href="http://www.h-ui.net/websafecolors.shtml" target="_blank">web安全色</a>
                                </li>
                                <li>
                                    <a href="http://www.h-ui.net/Hui-3.7-Hui-iconfont.shtml" target="_blank">Hui-iconfont</a>
                                </li>
                                <li>
                                    <a href="javascript:;">web工具箱<i class="arrow Hui-iconfont">&#xe6d7;</i></a>
                                    <ul class="menu">
                                        <li>
                                            <a href="http://www.h-ui.net/tools/jsformat.shtml" target="_blank">JS/HTML格式化工具</a>
                                        <li>
                                            <a href="http://www.h-ui.net/tools/HTMLtoJS.shtml" target="_blank">HTML/JS转换工具</a>
                                        <li>
                                            <a href="http://www.h-ui.net/tools/cssformat.shtml" target="_blank">CSS代码格式化工具</a>
                                        <li>
                                            <a href="http://www.h-ui.net/tools/daxiaoxie.shtml" target="_blank">字母大小写转换工具</a>
                                        <li>
                                            <a href="http://www.h-ui.net/tools/fantizhuanhuan.shtml" target="_blank">繁体字、火星文转换</a>
                                        <li>
                                            <a href="javascript:;">三级菜单<i class="arrow Hui-iconfont">&#xe6d7;</i></a>
                                            <ul class="menu">
                                                <li>
                                                    <a href="javascript:;">四级菜单</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">四级菜单</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">四级菜单</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">三级导航</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">二级导航</a>
                                </li>
                                <li class="disabled">
                                    <a href="javascript:;">二级菜单</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="http://h-ui.net/aboutHui.shtml" target="_blank">联系我们</a>
                        </li>
                    </ul>
                </nav>
                <nav class="navbar-userbar hidden-xs"></nav>
            </div>
        </div>
    </header>
    <div class="wap-container">
        <nav class="breadcrumb">
            <div class="container">
                <i class="Hui-iconfont">&#xe67f;</i>
                <a href="/" class="c-primary">首页</a>
                <span class="c-gray en">&gt;</span>
                <a href="#">用户</a>
                <span class="c-gray en">&gt;</span>
                <span class="c-gray">注册页面</span>
            </div>
        </nav>

        <div class="container ui-sortable">
            <h3>请填写注册信息</h3>
            <div class="panel panel-default">
                <div class="panel-body">

                    <form action="/registerUser" method="post" class="form form-horizontal responsive" id="demoform">

                        <div class="row cl">
                            <label class="form-label col-xs-3">邮箱：</label>
                            <div class="formControls col-xs-8">
                                <input type="text" class="input-text" placeholder="@" name="mail" id="email" autocomplete="off">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">用户名：</label>
                            <div class="formControls col-xs-8">
                                <input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="userName" id="username">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">手机：</label>
                            <div class="formControls col-xs-8">
                                <input type="text" class="input-text" autocomplete="off" placeholder="手机" name="phone" id="telephone">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">密码：</label>
                            <div class="formControls col-xs-8">
                                <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="passWord" id="password">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">密码验证：</label>
                            <div class="formControls col-xs-8">
                                <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password2" id="password2">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">单选框：</label>
                            <div class="formControls skin-minimal col-xs-5">
                                <div class="radio-box">
                                    <input type="radio" id="sex-1" name="sex">
                                    <label for="sex-1">男</label>
                                </div>
                                <div class="radio-box">
                                    <input type="radio" id="sex-2" name="sex">
                                    <label for="sex-2">女</label>
                                </div>
                                <div class="radio-box">
                                    <input type="radio" id="sex-3" name="sex">
                                    <label for="sex-3">保密</label>
                                </div>
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">附件：</label>
                            <div class="formControls col-xs-8">
								<span class="btn-upload form-group">
								<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2"
                                       readonly style="width:200px">
								<a href="javascript:void(0);" class="btn btn-primary upload-btn">
                                    <i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
								<input type="file" multiple name="file-2" class="input-file">
								</span>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <label class="form-label col-xs-3">所在城市：</label>
                            <div class="formControls col-xs-8">
                                <div class="row clearfix" style="margin-top:0">
                                    <div class="col-xs-6">
										<span class="select-box">
											<select class="select" size="1" name="address">
												<option value="" selected>选择省份</option>
												<option value="1">北京</option>
												<option value="2">上海</option>
												<option value="3">广州</option>
											</select>
										</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row cl">
                            <div class="col-xs-8 col-xs-offset-3">
                                <input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
