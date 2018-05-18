<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/5/14
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改密码界面</title>
</head>

<body>

<div class="containBox">
    <jsp:include page="pretemplate/head.jsp"/>
    <div class="wap-container">
        <i class="Hui-iconfont">&#xe67f;</i>
        <a href="${pageContext.request.contextPath}/" class="c-primary">首页</a>
        <span class="c-gray en">&gt;</span>
        <a href="#">安全</a>
        <span class="c-gray en">&gt;</span>
        <span class="c-gray">修改密码</span>

        <div class="container ui-sortable">

            <div class='panel-header clearfix'>
                <span class='f-l'>密码</span>
                <span class='f-r'>修改密码</span>
            </div>

            <div class='panel-body'>
                <form id="form" action="${pageContext.request.contextPath}/user/updatePassWord" method="post">

                    <table class='table table-border table-bordered table-bg'>
                        <tr>
                            <th>旧密码</th>
                            <input type="hidden" name="id" value="${user.id}"/>
                            <td><input type="password" id="old" name="oldPassWord" value="${oldPassWord}"
                                       placeholder="旧密码" class="input-text size-M"></td>
                        </tr>
                        <tr>
                            <th>新密码</th>
                            <td><input type="password" id="new" name="passWord" value="${newPassWord}"
                                       placeholder="新密码" class="input-text size-M"></td>
                        </tr>
                        <tr>
                            <th>确认密码</th>
                            <td><input type="password" id="check" name="newPassWord" value="${newPassWord}"
                                       placeholder="确认密码" class="input-text size-M"></td>
                        </tr>
                        <tr>
                            <td><input type="button" value="确认" id="btn" class="input-text size-M"></td>
                            <td><input type="button" value="取消" id="cancel" class="input-text size-M"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <jsp:include page="pretemplate/footer.jsp"/>
        </div>
    </div>
</div>

<script>

    $("#btn").click(function () {

        var old = $("#old").val();
        var newPwd = $("#new").val();
        var check = $("#check").val();

        if (old === "" || newPwd === "" || check === "") {
            alert("参数未填写完整");
            return false;
        }

        if (newPwd !== check) {
            alert("两次输入的密码不一致");
            return false;
        }

        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/user/updatePassWord",//url
            data: $('#form').serialize(),
            success: function (result) {

                if (result === 1) {
                    alert("更新成功,请重新登录!");
                    window.location.href = "${pageContext.request.contextPath}/logout";
                } else if(result === 2){
                    alert("旧密码输入错误");
                }else {
                    alert("密码更新失败,请重试!")
                }
            }
        });
    });
</script>
</body>
</html>
