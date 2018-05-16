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
    <title>欢迎注册</title>
</head>

<body>
<div class="containBox">
    <jsp:include page="pretemplate/head.jsp"/>
    <nav class="breadcrumb">
        <div class="container">
            <i class="Hui-iconfont">&#xe67f;</i>
            <a href="/" class="c-primary">首页</a>
            <span class="c-gray en">&gt;</span>
            <a href="#">用户</a>
            <span class="c-gray en">&gt;</span>
            <span class="c-gray">注册界面</span>
        </div>
    </nav>
        <div class="container ui-sortable">
            <h3>请填写注册信息</h3>
            <div class="panel panel-default">
                <div class="panel-body">

                    <form action="" method="post" class="form form-horizontal responsive" id="demoform">

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
                                <input type="text" class="input-text" placeholder="手机" name="phone" id="telephone">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">密码：</label>
                            <div class="formControls col-xs-8">
                                <input type="password" class="input-text" placeholder="密码" name="passWord" id="password">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">密码验证：</label>
                            <div class="formControls col-xs-8">
                                <input type="password" class="input-text" placeholder="密码" id="password2">
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
                                <input class="btn btn-primary" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="pretemplate/footer.jsp"/>
<script>

    $("#btn").click(function () {

        var passWord = $("#password").val();
        var password2 = $("#password2").val();

        if (passWord !== password2) {
            alert("两次输入的密码不一致");
            return false;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/registerUser",
            data: $('#demoform').serialize(),
            success: function (result) {

                console.log(result);
                if (result === 1) {
                    window.location.href="/loginPage";
                } else {
                    alert("注册失败,请重试!")
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
