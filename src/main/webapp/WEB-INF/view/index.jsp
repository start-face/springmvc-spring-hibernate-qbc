﻿<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/2/5
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrom=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/common/lib/html5shiv.js"></script>
<script type="text/javascript" src="/common/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/lib/Hui-iconfont/1.0.8/iconfont.min.css" />
<!--[if lt IE 9]>
<link href="/common/static/h-ui/css/H-ui.ie.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/common/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<style type="text/css">
.ui-sortable .panel-header{ cursor:move}
</style>
<title>首页</title>
<meta name="keywords" content="关键词,5个左右,单个8汉字以内">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
</head>

<body ontouchstart>

<div class="containBox">
    <jsp:include page="head.jsp"/>
	<div class="wap-container">
        <jsp:include page="guide.jsp"/>

		<div class="container ui-sortable">
			<h1>Hi,H-ui!</h1>
			<div class="panel panel-default mt-20">
				<div class="panel-header">选项卡</div>
				<div class="panel-body">
					<div id="HuiTab-demo1" class="HuiTab">
						<div class="tabBar cl">
							<span>选项卡一</span>
							<span>选项卡二</span>
							<span>自适应宽度</span>
						</div>
						<div class="tabCon">内容一</div>
						<div class="tabCon">内容二</div>
						<div class="tabCon">内容三</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default mt-20">
				<div class="panel-header clearfix">
					<span class="f-l">H-ui官方插件</span>
					<span class="f-r">需要升级到 H-ui.js v3.1 版本</span>
				</div>
				<div class="panel-body">
					<table class="table table-border table-bordered table-bg">
						<thead>
							<tr>
								<th width="30%">名称</th>
								<th width="20%">版本号</th>
								<th>描述</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="http://www.h-ui.net/lib/jQuery.Huihover.js.shtml" target="_blank">jQuery.Huihover.js</a></td>
								<td>2.0</td>
								<td>hover</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/common/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/lib/jquery-ui/1.9.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>

<script>
//弹窗
function modaldemo(){
	$("#modal-demo").modal("show");
}
//消息框
function modalalertdemo(){
	$.Huimodalalert('我是消息框，2秒后我自动滚蛋！',2000);
}
$(function(){
	$(".input-text,.textarea").Huifocusblur();
	
	//幻灯片
	jQuery("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:true,delayTime:700,interTime:3000,pnLoop:false,titOnClassName:"active"});
	
	$(".panel").Huifold({
		titCell:'.panel-header',
		mainCell:'.panel-body',
		type:1,
		trigger:'click',
		className:"selected",
		speed:"first"
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
		todayBtn:  1,
		autoclose: 1,
		endDate : new Date()
	}).on('hide',function(e) {
		//此处可以触发日期校验。
	});
	
	/*+1 -1效果*/
	$("#spinner-demo").Huispinner({
		value:1,
		minValue:1,
		maxValue:99,
		dis:1
	});
	
	$(".textarea").Huitextarealength({
		minlength:10,
		maxlength:200.
	});
	
	$("#demoform").validate({
		rules:{
			email:{
				required:true,
				email:true
			},
			username:{
				required:true,
				minlength:4,
				maxlength:16
			},
			telephone:{
				required:true,
				isMobile:true
			},
			password:{
				required:true,
				isPwd:true
			},
			password2:{
				required:true,
				equalTo: "#password"
			},
			sex:{
				required:true
			},
			datetimepicker:{
				required:true
			},
			checkbox2:{
				required:true
			},
			city:{
				required:true
			},
			website:{
				required:true,
				url:true
			},
			beizhu:{
				maxlength:500
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$("#modal-shenqing-success").modal("show");
			$(form).ajaxSubmit();
		}
	});

	//选项卡
	$("#HuiTab-demo1").Huitab({
		index:0
	});
	
	$("#Huitags-demo1").Huitags();
	
	//返回顶部
	$.Huitotop();
	
	//hover效果
	$('.maskWraper').Huihover();
	
	//星级评价
	$("#star-1").raty({
		hints: ['1','2', '3', '4', '5'],//自定义分数
		starOff: 'iconpic-star-S-default.png',//默认灰色星星
		starOn: 'iconpic-star-S.png',//黄色星星
		path: 'static/h-ui/images/star',//可以是相对路径
		number: 5,//星星数量，要和hints数组对应
		showHalf: true,
		targetKeep : true,
		click: function (score, evt) {//点击事件
			//第一种方式：直接取值
			$("#result-1").html('你的评分是'+score+'分');
		}
	});

	$( ".ui-sortable" ).sortable({
		//connectWith: ".panel",
		items:".panel",
		handle: ".panel-header",
		//delay: 300, //时间延迟
		//distance: 15, //距离延迟
		placeholder: "ui-state-highlight", //占位符样式
		update: function(event, ui){
			
		}
	}).disableSelection();

 	var _bodyHeight = $(window).height();
	var _doch = $(document).height();
	$(".containBox").height(_bodyHeight);

	/*左右滑动菜单*/
    $(".JS-nav-toggle").click(function() {
		$("body").addClass('sideBox-open');
        $(".containBox-bg").height(_bodyHeight).show();
    });
    $(".containBox-bg").click(function() {
		$(this).hide();
		$("body").removeClass('sideBox-open');
    });
});
</script>
</body>
</html>
<!--H-ui前端框架提供前端技术支持 h-ui.net @2017-01-01 -->