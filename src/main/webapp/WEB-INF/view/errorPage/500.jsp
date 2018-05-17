<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/2/5
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <link rel="stylesheet" type="text/css" href="/common/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/common/lib/Hui-iconfont/1.0.8/iconfont.min.css" />
    <script>
        if (self == top) {
            document.documentElement.style.display = 'block'
        } else {
            top.location = self.location
        }
    </script>

    <title>500页面</title>
    <meta name="keywords" content="500页面,后台出现错误啦!">
    <meta name="description" content="500页面。">
</head>

<body id="page-404">

<header class="navbar-wrapper">
    <div class="navbar navbar-black navbar-fixed-top">
        <div class="container cl">
            <a class="logo navbar-logo hidden-xs" href="/aboutHui.shtml">欢迎访问</a>
            <a class="logo navbar-logo-m visible-xs" href="/aboutHui.shtml"></a>
            <span class="logo navbar-slogan hidden-xs">XX网站</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs JS-nav-toggle"
               href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
                <ul class="cl">
                    <%--target="_blank" 表示新开窗口--%>
                    <li class="current">
                        <a href="/index">首页</a>
                    </li>
                    <li>
                        <a href="/user/pushNewsPage">发布信息</a>
                    </li>
                    <li>
                        <a href="/user/getNewsList" target="_blank">信息管理</a>
                    </li>
                </ul>
            </nav>
            <nav class="navbar-userbar hidden-xs"></nav>
        </div>
    </div>
</header>

<section class="container">
    <article class="page-404 minWP text-c">
        <p class="error-title"><i class="Hui-iconfont va-m">&#xe688;</i><span class="va-m"> 505</span></p>
        <p class="error-description">不好意思，您访问的服务存在错误~</p>
        <p class="error-info">您可以：<a href="javascript:;" onclick="history.go(-1)" class="c-primary">&lt; 返回上一页</a><span
                class="ml-20">|</span><a href="/" class="c-primary ml-20">去首页 &gt;</a></p>
    </article>
</section>

<jsp:include page="/WEB-INF/view/pretemplate/footer.jsp"/>
</body>
</html>
