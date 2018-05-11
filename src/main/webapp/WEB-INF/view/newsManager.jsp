<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/5/11
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息管理中心</title>
</head>
<body>

<jsp:include page="pretemplate/head.jsp"/>

<div class="panel panel-default mt-20">
    <div class="panel-header clearfix">
        <span class="f-l">新闻</span>
        <span class="f-r">信息管理</span>
    </div>
    <div class="panel-body">
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th width="30%">标题</th>
                <th width="20%">发生地</th>
                <th>内容</th>
                <th>发生时间</th>
                <th>作者</th>
                <th>是否热门</th>
                <th>图片</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${news}" var="one">
                <c:if test="${one.newsType eq '1'}">
                    <tr>
                        <td>${one.title}</td>
                        <td>${one.newsAddress}</td>
                        <td>${one.content}</td>
                        <td>${one.pushDate}</td>
                        <td>${one.author}</td>
                        <td>${one.isPopular}</td>
                        <td>${one.images}</td>
                        <td><<a href="/news/addNews?id=${one.id}">删除</a></td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="pretemplate/footer.jsp"/>
</body>
</html>
