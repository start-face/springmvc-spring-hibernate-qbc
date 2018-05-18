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

<div id="wrapper">
    <div id="container">
        <div id="uploader">
            <div class="queueList">
                <div id="dndArea" class="placeholder">
                    <div class="" id="uploaderPick">
                        <a id="chooseFile" href="javascript:void(0);" class="text">点击选择文件</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="statusBar" class="statusBar">
            <div class="total-progress">
                <div id="totalProgressBar"
                     class="total-progress-bar"
                     role="progressbar"
                     aria-valuenow="0"
                     aria-valuemin="0"
                     aria-valuemax="100"
                     style="min-width: 2em;">
                    0%
                </div>
            </div>
            <div class="start-uploader" style="padding-right:20px; float: right;">
                <a id="startUpload" href="javascript:void(0);" class="text">开始上传</a>
            </div>
            <div class="start-uploader" style="padding:0 20px; float: right;margin: 20 10px">
                <a id="addBtn" href="javascript:void(0);" class="text">继续添加</a>
            </div>

        </div>
        <div class="" style="clear: both;">
        </div>
    </div>
</div>
<div class="container bs-docs-container">
    <form id="form">
        <input id="js-file" type="file" style="display:none;"  multiple="multiple"/>
    </form>
</div>

<jsp:include page="pretemplate/footer.jsp"/>
</body>
</html>
