<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/5/10
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="containBox-bg"></div>
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
                        <a href="/loginPage">核心</a>
                    </li>
                    <li>
                        <a href="#" target="_blank">脚本</a>
                    </li>
                    <c:if test="${user eq null}">
                        <li style="margin-left: 62%;"><span>&nbsp;&nbsp;</span></li>
                        <li>
                            <a href="/loginPage">登录</a><a href="/register">注册</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
            <nav class="navbar-userbar hidden-xs"></nav>
        </div>
    </div>
</header>
</body>
</html>
