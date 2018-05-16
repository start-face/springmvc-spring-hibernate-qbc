<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/4/30
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>欢迎登录</title>
</head>

<body ontouchstart>

<jsp:include page="pretemplate/head.jsp"/>
<div class="container ui-sortable">
    <h3>请输入帐号密码</h3>
    <div class="panel panel-default">
        <div class="panel-body">

            <form action="" method="post" class="form form-horizontal responsive" id="demoform">

                <div class="row cl">
                    <label class="form-label col-xs-3">用户名：</label>
                    <div class="formControls col-xs-8">
                        <input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="userName"
                               id="username">
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
<jsp:include page="pretemplate/footer.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/static/h-ui/src/js/jQuery.Huimodalalert.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script>

    $("#btn").click(function () {

        var passWord = $("#password").val();
        var username = $("#username").val();

        if (passWord === "" || username === "") {
            alertMsg("未填写完整");
            return false;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/login",
            data: $('#demoform').serialize(),
            success: function (result) {

                if (result === 1) {
                    window.location.href = "/user/index";
                } else {
                    alertMsg("登录失败,请重试!")
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    });

    //消息框
    function alertMsg(value) {
        $.Huimodalalert(value, 2000);
    }
</script>
</body>
</html>