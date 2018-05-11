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

<form action="/news/addNews" method="post"<%-- class="form form-horizontal" --%>id="demoform-3">
    <legend>信息发布中心</legend>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">标题：</label>
        <div class="formControls col-xs-8 col-sm-6">
            <input type="text" class="input-text" placeholder="请输入标题" name="title" id="title" datatype="e" nullmsg="请输入邮箱！">
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
        <div class="formControls col-xs-8 col-sm-6">
            <span class="btn-upload form-group">
                <input class="input-text upload-url" type="text" name="images" id="images" readonly datatype="*" nullmsg="请添加附件！" style="width:200px">
                <a href="javascript:void();" class="btn btn-primary upload-btn">
                    <i class="Hui-iconfont">&#xe642;</i> 浏览文件
                </a>
                <input type="file" multiple name="file-2" class="input-file">
            </span>
        </div>
        <div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"></div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-3">所在城市：</label>
        <div class="formControls col-xs-8 col-sm-6">
            <span class="select-box">
                <select class="select" size="1" name="newsAddress" datatype="*" nullmsg="请选择所在城市！">
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
            <textarea name="content" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" datatype="*10-500"
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
            <input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
    </div>
</form>

<jsp:include page="pretemplate/footer.jsp"/>

<!--表单验证插件-->
<script type="text/javascript">

</script>
</body>
</html>
