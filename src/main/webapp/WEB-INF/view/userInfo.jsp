<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/5/11
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户详情界面</title>
</head>
<body>
<jsp:include page="pretemplate/head.jsp"/>

<div class="panel panel-default mt-20">
    <div class="panel-header clearfix">
        <span class="f-l">用户信息</span>
        <span class="f-r">用户个人信息展示</span>
    </div>
    <div class="panel-body">
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th width="30%">用户名</th>
                <th width="20%">邮箱</th>
                <th>电话</th>
                <th>地址</th>
                <th>生日</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${user.userName}</td>
                <td>${user.mail}</td>
                <td>${user.phone}</td>
                <td>${user.address}</td>
                <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="pretemplate/footer.jsp"/>
</body>
</html>
