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
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/common/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/common/lib/Hui-iconfont/1.0.8/iconfont.min.css"/>
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
    <title>欢迎登录</title>
</head>

<body>
<div class="containBox">
    <jsp:include page="head.jsp"/>
    <jsp:include page="guide.jsp"/>

    <div class="container ui-sortable">
        <h3>请输入帐号密码</h3>
        <div class="panel panel-default">
            <div class="panel-body">

                <form action="" method="post" class="form form-horizontal responsive" id="demoform">

                    <div class="row cl">
                        <label class="form-label col-xs-3">用户名：</label>
                        <div class="formControls col-xs-8">
                            <input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="userName" id="username">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-3">密码：</label>
                        <div class="formControls col-xs-8">
                            <input type="password" class="input-text" placeholder="密码" name="passWord" id="password">
                        </div>
                    </div>
                    <div class="row cl">
                        <div class="col-xs-8 col-xs-offset-3">
                            <input class="btn btn-primary" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script>

    $("#btn").click(function () {

        var passWord = $("#password").val();
        var username = $("#username").val();

        if (passWord === "" || username === "") {
            alert("未填写完整");
            return false;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/login",
            data: $('#demoform').serialize(),
            success: function (result) {

                console.log(result);
                if (result === 1) {
                    window.location.href="/user/index";
                } else {
                    alert("登录失败,请重试!")
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    });
</script>
</body>
</html>