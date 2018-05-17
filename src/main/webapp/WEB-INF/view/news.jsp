<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/5/11
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>发布信息界面</title>
</head>
<body>
<jsp:include page="pretemplate/head.jsp"/>

<form action="/news/addNews" method="post" enctype="multipart/form-data" id="demoform-3">
    <legend>信息发布中心</legend>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">标题：</label>
        <div class="formControls col-xs-8 col-sm-6">
            <input type="text" class="input-text" placeholder="请输入标题" name="title" id="title" datatype="e"
                   nullmsg="请输入邮箱！">
        </div>
        <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"></div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">信息类型：</label>
        <div class="formControls skin-minimal col-xs-8 col-sm-6">
            <div class="check-box">
                <input type="checkbox" id="newsType-1" name="newsType" datatype="*" nullmsg="信息类型不能为空！">
                <label>科技</label>
            </div>
            <div class="check-box">
                <input type="checkbox" id="newsType-2" name="newsType">
                <label>军事</label>
            </div>
        </div>
        <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"></div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">附件：</label>
        <div id="up" class="formControls col-xs-8 col-sm-6">
            <span id="upFile" class="btn-upload form-group">
                <input type="hidden" value="" id="img" name="file"/>
                <input class="input-text upload-url" type="text" name="file" readonly datatype="*" nullmsg="请添加附件！" style="width:200px">
                <a href="" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
                <input type="file" multiple="multiple" name="file" id="images" class="input-file">
            </span>
        </div>
        <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"></div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">所在城市：</label>
        <div class="formControls col-xs-8 col-sm-6">
            <span class="select-box">
                <select class="select" size="1" id="newsAddress" name="newsAddress" datatype="*" nullmsg="请选择所在城市！">
                    <option value="" selected>请选择城市</option>
                    <option value="北京">北京</option>
                    <option value="上海">上海</option>
                    <option value="广州">广州</option>
                </select>
            </span>
        </div>
        <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"></div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">内容：</label>
        <div class="formControls col-xs-8 col-sm-6">
            <textarea name="content" id="content" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" datatype="*10-500"
                      nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,500)">
            </textarea>
            <p class="textarea-numberbar">
                <em class="textarea-length">0</em>/500
            </p>
        </div>
        <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"></div>
    </div>
    <div class="row cl">
        <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
    </div>
</form>

<jsp:include page="pretemplate/footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<!--表单验证插件-->
<script type="text/javascript">

    $("#btn").click(function(){

        if (!check()){
            alert("参数未填写完整");
            return false;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/news/addNews",
            data: $('#demoform-3').serialize(),
            success: function (result) {

                if (result === 1) {
                    window.location.href="/user/index";
                } else {
                    alert("新闻发布失败,请重试!")
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    });

    function check(){

        var title = $("#title").val();
        var newsType_1 = $("#newsType-1").val();
        var newsType_2 = $("#newsType-2").val();
        var newsAddress = $("#newsAddress").val();
        var content = $("#content").val();

        if (title === "" || newsType_1 === "" || newsType_2 === "" || newsAddress ==="" || content === ""){
            return false;
        }
        return true;
    }

    $("#images").on("change", function () {

        $.ajax({
            url:"/user/upload",
            type:"post",
            data: new FormData($("#demoform-3")[0]),
            cache: false,
            processData: false,
            contentType: false,
            async:false,
            success:function(data){
                $("#img").attr("value",data);
                console.log(data);
            },
            error:function(e){
                console.log(e);
                alert("网络错误，请重试！！");
            }
        });

        // $.ajax({
        //     url: "/user/upload",
        //     type: 'POST',
        //     cache: false,
        //     // data: new FormData($('#infoLogoForm')[0]),
        //     data: new FormData(upFile),
        //     processData: false,
        //     contentType: false,
        //     dataType: "json",
        //     beforeSend: function () {
        //         alert(12)
        //     },
        //     success: function (data) {
        //         alert(data.msg);
        //     }
        // });
    });
</script>
</body>
</html>
