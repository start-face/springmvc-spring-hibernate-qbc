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

<div class="containBox">
    <jsp:include page="pretemplate/head.jsp"/>

    <div class="wap-container">
        <nav class="breadcrumb">
            <div class="container">
                <i class="Hui-iconfont">&#xe67f;</i>
                <a href="${pageContext.request.contextPath}/" class="c-primary">首页</a>
                <span class="c-gray en">&gt;</span>
                <a href="#">新闻</a>
                <span class="c-gray en">&gt;</span>
                <span class="c-gray">信息管理</span>
            </div>
        </nav>

        <div class="container ui-sortable">

            <div class="clearfix">
                <form id="form" method="post" action="${pageContext.request.contextPath}/news/getNews">
                    <input type="text" placeholder="请输入关键词" class="input-text ac_input" name="title" value="${title}" id="search_text" autocomplete="off" style="width:300px">
                    <button type="button" class="btn btn-default" id="search_button">搜索</button>
                </form>
            </div>

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
            <div style="margin-left: 40%;" id="page" class="pager"></div><br/>
        </div>
    </div>
</div>
<jsp:include page="pretemplate/footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/newsList.js"></script>
<script src="${pageContext.request.contextPath}/js/toolDate.js"></script>
<script>

    $("#search_button").click(function(){
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/news/getNews" ,//url
            data: $('#form').serialize(),
            success: function (result) {
                $('#tbody').html(parseUserList(result,""));
            },
            error : function() {
                alert("异常！");
            }
        });
    });

    function parseUserList(res, currentPage) {
        var content = "";
        $.each(res.list, function (i, o) {

            content += "<tr>";
            content += "<td>" + o.title + "</td>";
            content += "<td>" + o.newsAddress + "</td>";
            content += "<td>" + o.content + "</td>";
            content += "<td>" + new Date(o.pushDate).Format('yyyy-MM-dd hh:mm:ss') + "</td>";
            content += "<td>" + o.author + "</td>";
            content += "<td>" + o.isPopular + "</td>";
            content += '<td><a href="javascript:;" onclick="deleteNews(\'' + o.id + '\')">' + '删除' + '</a></td>';
            content += "</tr>";
        });
        return content;
    }

    function deleteNews(value) {

        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/news/deleteNews",//url
            data: {"id":value},
            success: function (result) {

                if(result){
                    window.location.href="${pageContext.request.contextPath}/news/getNewsList";
                }else {
                    alert("删除新闻失败");
                }
            }
        });
    }

    $(function () {
        //引入core.js中的方法进行分页
        newsList.getUserListByPage();
    });
</script>
</body>
</html>
