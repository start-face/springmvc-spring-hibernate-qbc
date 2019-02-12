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
            <div class="progress radius">
                <div class="progress-bar">
                    <span class="sr-only" style="width:1%"></span>
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
    <form id="form" method="post" enctype="multipart/form-data">
        <input id="js-file" name="images" type="file" style="display:none;" multiple="multiple"/>
    </form>
</div>

<jsp:include page="pretemplate/footer.jsp"/>
<script>

    var uploadInterval;

    $("#startUpload").click(function () {

        var images = $("#js-file").val();
        if (images === "") {
            alert("没有数据");
            return false;
        }

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/uploadImage?id=${user.id}",
            data: new FormData($("#form")[0]),
            cache: false,
            processData: false,
            contentType: false,
            async: false,
            success: function (data) {

                if (data === "0") {
                    alert("多图片上传失败");
                }
                // else {
                // alert("多图片上传成功");
                <%--&lt;%&ndash;window.location.href = "${pageContext.request.contextPath}/user/index";&ndash;%&gt;--%>
                // }
            }
        });
        uploadInterval = window.setInterval("showUpload()", 500);
    });

    function showUpload() {

        $.ajax({
            type: "POST",  //提交方式
            url: "${pageContext.request.contextPath}/loading",//路径
            dataType: "json",//返回的json格式的数据
            data: {},
            success: function (result) {//返回数据根据结果进行相应的处理

                $(".sr-only").width(result + '%');
                if (result == 100) {
                    window.clearInterval(uploadInterval);
                    $("#show").attr("display", "block");
                }
            },
            error: function (errorThrown) {
                console.log(errorThrown);
            }
        });
    }
</script>
</body>
</html>
