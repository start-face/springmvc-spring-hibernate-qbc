<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/2/5
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <meta name="keywords" content="关键词,5个左右,单个8汉字以内">
    <meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
</head>

<body ontouchstart>

<div class="sideBox">
    <ul class="nav navbar-nav pt-20">
        <li><a href="${pageContext.request.contextPath}/loginPage">登录</a></li>
        <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
        <li><a href="#">关于我们</a></li>
        <li><a href="#">联系我们</a></li>
        <li><a href="#">隐私保护</a></li>
        <li><a href="#">免责声明</a></li>
    </ul>
</div>

<div class="containBox">
    <div class="containBox-bg"></div>
    <jsp:include page="pretemplate/head.jsp"/>
    <div class="wap-container">
        <nav class="breadcrumb">
            <div class="container">
                <i class="Hui-iconfont">&#xe67f;</i>
                <a href="${pageContext.request.contextPath}/" class="c-primary">首页</a>
                <span class="c-gray en">&gt;</span>
            </div>
        </nav>

        <div id="slider-3">
            <div class="slider">
                <div class="bd">
                    <ul>
                        <li>
                            <a href="http://www.h-ui.net/" target="_blank">
                                <img src="${pageContext.request.contextPath}/common/temp/banner1.jpg">
                            </a>
                        </li>
                        <li>
                            <a href="http://www.h-ui.net/zhaoshang.shtml" target="_blank">
                                <img src="${pageContext.request.contextPath}/common/temp/banner2.jpg">
                            </a>
                        </li>
                        <li>
                            <a href="http://h-ui.net/H-ui.admin.shtml" target="_blank">
                                <img src="${pageContext.request.contextPath}/common/temp/banner3.jpg">
                            </a>
                        </li>
                    </ul>
                </div>
                <ol class="hd cl dots">
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                </ol>
            </div>
        </div>

        <div class="panel panel-default mt-20">
            <div class="panel-body">
                <div id="HuiTab-demo1" class="HuiTab">
                    <div class="tabBar cl">
                        <span>新闻</span>
                        <span>科技</span>
                        <span>军事</span>
                        <span>视频</span>
                    </div>
                    <div class="tabCon">
                        <div class="panel panel-default mt-20">
                            <div class="panel-header clearfix">
                                <span class="f-l">新闻</span>
                                <span class="f-r">新闻展示</span>
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${newsList}" var="one">
                                        <c:if test="${one.newsType eq '1'}">
                                            <tr>
                                                <td>${one.title}</td>
                                                <td>${one.newsAddress}</td>
                                                <td>${one.content}</td>
                                                <td><fmt:formatDate value="${one.pushDate}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <td>${one.author}</td>
                                                <td>${one.isPopular}</td>
                                                <td>${one.images}</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tabCon">
                        <div class="panel panel-default mt-20">
                            <div class="panel-header clearfix">
                                <span class="f-l">科技</span>
                                <span class="f-r">科技新闻展示</span>
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${newsList}" var="one">
                                        <c:if test="${one.newsType eq '2'}">
                                            <tr>
                                                <td>${one.title}</td>
                                                <td>${one.newsAddress}</td>
                                                <td>${one.content}</td>
                                                <td><fmt:formatDate value="${one.pushDate}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <td>${one.author}</td>
                                                <td>${one.isPopular}</td>
                                                <td>${one.images}</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tabCon">
                        <div class="panel panel-default mt-20">
                            <div class="panel-header clearfix">
                                <span class="f-l">军事</span>
                                <span class="f-r">军事新闻展示</span>
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${newsList}" var="one">
                                        <c:if test="${one.newsType eq 'on'}">
                                            <tr>
                                                <td>${one.title}</td>
                                                <td>${one.newsAddress}</td>
                                                <td>${one.content}</td>
                                                <td><fmt:formatDate value="${one.pushDate}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <td>${one.author}</td>
                                                <td>${one.isPopular}</td>
                                                <td>${one.images}</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tabCon">
                        <div class="panel panel-default mt-20">
                            <div class="panel-header clearfix">
                                <span class="f-l">视频</span>
                                <span class="f-r">视频播放</span>
                            </div>
                            <div class="panel-body">
                                <jsp:include page="videoPage.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="pretemplate/footer.jsp"/>
    </div>
</div>

<script>

    //弹窗
    function modaldemo() {
        $("#modal-demo").modal("show");
    }

    //消息框
    function modalalertdemo(value) {
        $.Huimodalalert(value, 2000);
    }

    $(function () {
        $(".input-text,.textarea").Huifocusblur();

        //幻灯片
        jQuery("#slider-3 .slider").slide({
            mainCell: ".bd ul",
            titCell: ".hd li",
            trigger: "click",
            effect: "leftLoop",
            autoPlay: true,
            delayTime: 700,
            interTime: 3000,
            pnLoop: false,
            titOnClassName: "active"
        });

        $(".panel").Huifold({
            titCell: '.panel-header',
            mainCell: '.panel-body',
            type: 1,
            trigger: 'click',
            className: "selected",
            speed: "first"
        });

        //邮箱提示
        $("#email").emailsuggest();

        //checkbox 美化
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        //日期插件
        $("#datetimepicker").datetimepicker({
            format: 'yyyy-mm-dd',
            minView: "month",
            todayBtn: 1,
            autoclose: 1,
            endDate: new Date()
        }).on('hide', function (e) {
            //此处可以触发日期校验。
        });

        /*+1 -1效果*/
        $("#spinner-demo").Huispinner({
            value: 1,
            minValue: 1,
            maxValue: 99,
            dis: 1
        });

        $(".textarea").Huitextarealength({
            minlength: 10,
            maxlength: 200.
        });

        $("#demoform").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                username: {
                    required: true,
                    minlength: 4,
                    maxlength: 16
                },
                telephone: {
                    required: true,
                    isMobile: true
                },
                password: {
                    required: true,
                    isPwd: true
                },
                password2: {
                    required: true,
                    equalTo: "#password"
                },
                sex: {
                    required: true
                },
                datetimepicker: {
                    required: true
                },
                checkbox2: {
                    required: true
                },
                city: {
                    required: true
                },
                website: {
                    required: true,
                    url: true
                },
                beizhu: {
                    maxlength: 500
                }
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $("#modal-shenqing-success").modal("show");
                $(form).ajaxSubmit();
            }
        });

        //选项卡
        $("#HuiTab-demo1").Huitab({
            index: 0
        });

        $("#Huitags-demo1").Huitags();

        //返回顶部
        $.Huitotop();

        //hover效果
        $('.maskWraper').Huihover();

        //星级评价
        $("#star-1").raty({
            hints: ['1', '2', '3', '4', '5'],//自定义分数
            starOff: 'iconpic-star-S-default.png',//默认灰色星星
            starOn: 'iconpic-star-S.png',//黄色星星
            path: 'static/h-ui/images/star',//可以是相对路径
            number: 5,//星星数量，要和hints数组对应
            showHalf: true,
            targetKeep: true,
            click: function (score, evt) {//点击事件
                //第一种方式：直接取值
                $("#result-1").html('你的评分是' + score + '分');
            }
        });

        $(".ui-sortable").sortable({
            //connectWith: ".panel",
            items: ".panel",
            handle: ".panel-header",
            //delay: 300, //时间延迟
            //distance: 15, //距离延迟
            placeholder: "ui-state-highlight", //占位符样式
            update: function (event, ui) {

            }
        }).disableSelection();

        var _bodyHeight = $(window).height();
        var _doch = $(document).height();
        $(".containBox").height(_bodyHeight);

        /*左右滑动菜单*/
        $(".JS-nav-toggle").click(function () {
            $("body").addClass('sideBox-open');
            $(".containBox-bg").height(_bodyHeight).show();
        });
        $(".containBox-bg").click(function () {
            $(this).hide();
            $("body").removeClass('sideBox-open');
        });
    });
</script>
</body>
</html>
<!--H-ui前端框架提供前端技术支持 h-ui.net @2017-01-01 -->