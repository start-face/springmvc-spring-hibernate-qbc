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
    
    <%--<div class="panel-body">--%>
        <%--<table class="table table-border table-bordered table-bg">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th width="30%">标题</th>--%>
                <%--<th width="20%">发生地</th>--%>
                <%--<th>内容</th>--%>
                <%--<th>发生时间</th>--%>
                <%--<th>作者</th>--%>
                <%--<th>是否热门</th>--%>
                <%--<th>图片</th>--%>
                <%--<th>操作</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<c:forEach items="${newsList.list}" var="one">--%>
                    <%--<tr>--%>
                        <%--<td>${one.title}</td>--%>
                        <%--<td>${one.newsAddress}</td>--%>
                        <%--<td>${one.content}</td>--%>
                        <%--<td>${one.pushDate}</td>--%>
                        <%--<td>${one.author}</td>--%>
                        <%--<td>${one.isPopular}</td>--%>
                        <%--<td>${one.images}</td>--%>
                        <%--<td><<a href="/news/addNews?id=${one.id}">删除</a></td>--%>
                    <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
        <%--</table>--%>
    <%--</div>--%>

    <div id="view1"></div>
    <div id="page"></div>
</div>

<jsp:include page="pretemplate/footer.jsp"/>

<script>
    //从第6页开始请求。返回的json格式可以任意定义
    $.getJSON('/news/getNews', {curr: 1}, function(res){

        laypage({
            cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：&lt;div id="page1">&lt;/div>
            pages: res.totalPage, //通过后台拿到的总页数
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调

                $.getJSON('/news/getNews', {curr: e.curr}, function(res){
                    e.pages = e.last = res.pages; //重新获取总页数，一般不用写
                    //渲染
                    var view = document.getElementById('view1'); //你也可以直接使用jquery
                    var demoContent = "<div class='panel-body'>";
                            demoContent += "<table class='table table-border table-bordered table-bg'>";
                                demoContent += "<thead>";
                                    demoContent += "<tr>";
                                        demoContent += "<th width='30%'>标题</th>";
                                        demoContent += "<th width='20%'>发生地</th>";
                                        demoContent += "<th>内容</th>";
                                        demoContent += "<th>发生时间</th>";
                                        demoContent += "<th>作者</th>";
                                        demoContent += "<th>是否热门</th>";
                                        demoContent += "<th>图片</th>";
                                        demoContent += "<th>操作</th>";
                                    demoContent += "</tr>";
                                demoContent += "</thead>";

                                demoContent += "<tbody>";
                                    demoContent += "<c:forEach items='${res.list}' var='one'>";
                                    demoContent += "<tr>";
                                        demoContent += "<td>${one.title}</td>";
                                        demoContent += "<td>${one.newsAddress}</td>";
                                        demoContent += "<td>${one.content}</td>";
                                        demoContent += "<td>${one.pushDate}</td>";
                                        demoContent += "<td>${one.author}</td>";
                                        demoContent += "<td>${one.isPopular}</td>";
                                        demoContent += "<td>${one.images}</td>";
                                        demoContent += "<td><<a href='/news/addNews?id=${one.id}'>删除</a></td>";
                                    demoContent += "</tr>";
                                    demoContent += "</c:forEach>";
                                demoContent += "</tbody>";
                            demoContent += "</table>";
                        demoContent += "</div>";
                    view.innerHTML = demoContent;
                    console.log(res.list);
                    alert(res.list);
                    view.innerHTML = res.list;
                });
            }
        });
    });
</script>
</body>
</html>
