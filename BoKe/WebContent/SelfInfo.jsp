<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Dao.UserDao" %>
<%@ page import="Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>info</title>
	<link rel="stylesheet" href="css1/common.css"/>
	<link href="css1/style5.css" rel='stylesheet' type='text/css'/>
	<link href="//fonts.googleapis.com/css1?family=Montserrat:400,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css1?family=Roboto+Condensed:300,400" rel="stylesheet">
	<link href="css1/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">  
<meta name="apple-mobile-web-app-status-bar-style" content="black">  
<meta content="telephone=no" name="format-detection">

		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Accessible Profile Widget Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
			<script src="js1/jquery.min.js"></script>
			<script>$(document).ready(function(c) {
			$('.alert-close').on('click', function(c){
				$('.main-agile').fadeOut('slow', function(c){
					$('.main-agile').remove();
				});
			});	  
		});
		</script>
		<script type="text/javascript" src="js1/jquery.min.js"></script>
<script type="text/javascript">
var w,h,className;
function getSrceenWH(){
	w = $(window).width();
	h = $(window).height();
	$('#dialogBg').width(w).height(h);
}

window.onresize = function(){  
	getSrceenWH();
}  
$(window).resize();  

$(function(){
	getSrceenWH();
	
	//显示弹框
	$('.box a').click(function(){
		className = $(this).attr('class');
		$('#dialogBg').fadeIn(300);
		$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
	});
	
	//关闭弹窗
	$('.claseDialogBtn').click(function(){
		$('#dialogBg').fadeOut(300,function(){
			$('#dialog').addClass('bounceOutUp').fadeOut();
		});
	});
});
</script>
</head>
<body>
 
	<h1>你的资料</h1>
		<div class="main-agileits">
		<div class="right-wthree">
				<img src="images/1.jpg" alt="image" />
				<h2>姓名 ：${sessionScope.user.username}</h2>
				<p>个性签名：${sessionScope.user.info}</p>
			</div>
			<div class="left-w3ls">
			<ul class="address">
													<li>
														<ul class="address-text">
															<li><b>电话 </b></li>
															<li>: ${sessionScope.user.phone}</li>
														</ul>
													</li>
													<li>
														<ul class="address-text">
															<li><b>邮箱 </b></li>
															<li>: ${sessionScope.user.email}</li>
														</ul>
													</li>
													<li>
														<ul class="address-text">
															<li><b>QQ </b></li>
															<li>: ${sessionScope.user.qq}
													</li>
													
												</ul>
				
				<div class="box">
		<div class="demo">
			<a href="javascript:;" class="flipInX">修改密码</a>
		</div>
		<div id="dialogBg"></div>
		<div id="dialog" class="animated">
			<img class="dialogIco" width="50" height="50" src="images1/ico.png" alt="" />
			<div class="dialogTop">
				<a href="javascript:;" class="claseDialogBtn">关闭</a>
			</div>
			<form action="Info" method="post" id="editForm">
				<ul class="editInfos">
					<li><label><font color="#ff0000">* </font> 原密码：<input type="text" name="pwd" required value="" class="ipt" /></label></li>
					<li><label><font color="#ff0000">* </font> 新密码：<input type="text" name="password1" required value="" class="ipt" /></label></li>
					<li><input type="submit" value="确认提交" class="submitBtn" /></li>
				</ul>
			</form>
		</div>
	</div>
						<div id="small-dialog" class="mfp-hide w3ls_small_dialog wthree_pop">		
						<div class="agileits_modal_body">
							<iframe src="https://player.vimeo.com/video/8483438?title=0&byline=0&portrait=0"></iframe>
						</div>
					</div>
	<!-- //pop-up-box -->
					<script src="js1/jquery.magnific-popup.js" type="text/javascript"></script>
					<script>
					$(document).ready(function() {
					$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
					});

					});
					</script>

			</div>
			
			<div class="clear"></div>
		</div>
	
</body>
</html>