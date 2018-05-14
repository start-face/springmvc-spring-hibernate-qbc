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
</head>

<body>

<jsp:include page="pretemplate/head.jsp"/>

<div class="panel panel-default mt-20">

    <div id="view"></div>
    <div style="margin-left: 50%;" id="page"></div>
</div>

<jsp:include page="pretemplate/footer.jsp"/>

<script>
    //从第6页开始请求。返回的json格式可以任意定义
    $.getJSON('/news/getNews', {currentPage: 1}, function(res){

        laypage({
            cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为:<div id="page1"></div>
            pages: res.totalPage, //通过后台拿到的总页数
            currentPage: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调

                $.getJSON('/news/getNews', {currentPage: e.currentPage}, function(res){
                    // e.pages = e.last = res.pages; //重新获取总页数，一般不用写
                    //渲染
                    var view = document.getElementById('view'); //你也可以直接使用jquery
                    var demoContent ="<div class='panel-header clearfix'>";
                            demoContent +="<span class='f-l'>新闻</span>";
                            demoContent +="<span class='f-r'>信息管理</span>";
                        demoContent +="</div>";

                        demoContent += "<div class='panel-body'>";
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
                                for(var i = 0;i<res.list.length;i++){

                                    var one = res.list[i];

                                    demoContent += "<tr>";
                                        demoContent += "<td>"+ one.title +"</td>";
                                        demoContent += "<td>"+ one.newsAddress +"</td>";
                                        demoContent += "<td>"+ one.content +"</td>";
                                        demoContent += "<td>"+ one.pushDate +"</td>";
                                        demoContent += "<td>"+ one.author +"</td>";
                                        demoContent += "<td>"+ one.isPopular +"</td>";
                                        demoContent += "<td>"+ one.images +"</td>";
                                        demoContent += "<td><a href='/news/addNews?id='" + one.id +">" + '删除' + "</a></td>";
                                    demoContent += "</tr>";
                                }
                                demoContent += "</tbody>";
                            demoContent += "</table>";
                        demoContent += "</div>";

                    view.innerHTML = demoContent;
                });
            }
        });
    });
</script>
</body>
</html>
