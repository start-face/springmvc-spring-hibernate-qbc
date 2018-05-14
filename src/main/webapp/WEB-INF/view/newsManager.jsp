<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/5/11
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>信息管理中心</title>

    <style type="text/css">
        .pager {
            float: left;
            padding-top: 10px;
        }
    </style>
</head>

<body>

<jsp:include page="pretemplate/head.jsp"/>

<div class="panel panel-default mt-20">

    <div class='panel-header clearfix'>
        <span class='f-l'>新闻</span>
        <span class='f-r'>信息管理</span>
    </div>

    <div class='panel-body'>
        <table class='table table-border table-bordered table-bg'>
            <thead>
            <tr>
                <th width='30%'>标题</th>
                <th width='20%'>发生地</th>
                <th>内容</th>
                <th>发生时间</th>
                <th>作者</th>
                <th>是否热门</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody id="tbody"></tbody>
        </table>
    </div>
    <!-- 分页标签 -->
    <div style="margin-left: 40%;" id="page" class="pager"></div>
</div>

<jsp:include page="pretemplate/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/core.js"></script>
<script>

    $(function () {
        //引入core.js中的方法进行分页
        core.getUserListByPage();
    });
</script>
</body>
</html>
