<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>博客首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/index.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/global.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/jquery-ui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/js/date.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/js/login.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/js/myblog.js"></script>
	<script src="${pageContext.request.contextPath}/view/js/jquery-ui.js"></script>
	<style type="text/css">
	#addBlogDiv{
		position:absolute;
		left:200px;
		top:200px;
		width: 800px;
		height: 800px;
	}
	#updateBlogDiv{
		position:absolute;
		left:200px;
		top:200px;
		width: 800px;
		height: 800px;
	}
	</style>
	<script type="text/javascript">
		function register(){
			window.location.href="register.jsp";
		}
		$(function(){
			//调用jquery中的ajax方法开始加载数据:
			$("#main").ajaxStart(function(){
				$(this).html("正在加载数据...");
			});
		
			var blogtitle = $("#blogtitle").val();
			var date = $("#date").val();
			var url = "${pageContext.request.contextPath}/BlogServlet?method=search";
			$.get(url,{"blogtitle":blogtitle,"date":date},function(data){
				$("#main").html(data);
			});
			var url = "${pageContext.request.contextPath}/BlogServlet?method=find";
			$.get(url,function(data){
				$("#newBlog").html(data);
			});
			
			$("#search").click(function(){
				var blogtitle = $("#blogtitle").val();
				var date = $("#date").val();
				var url = "${pageContext.request.contextPath}/BlogServlet?method=search";
				$("#main").ajaxStart(function(){
					$(this).html("正在加载数据...");
				});
				$.post(url,{"blogtitle":blogtitle,"date":date},function(data){
					$("#main").html(data);
				});
			});
			
		});
		
	</script>
  </head>
  <body>
  <div id="index">
  	<div id="head">
  		<c:if test="${!empty userInfo.username}">
	  	<div align="left" style="padding-left: 5px; color: blue;">
	  	<c:if test="${!empty sessionScope.message}">
	  	<label><b>欢迎您：</b> </label>
	  	</c:if>
	  	<label id="welcome"><b>${sessionScope.message}</b></label>
	  	</div>
  		</c:if>
  		<!-- 隐藏传值uid -->
  		<input type="hidden" name="uid" value="${userInfo.uid}"/>
  		<input type="hidden" name="username" value="${userInfo.username}"/>
  		<c:if test="${empty userInfo.username}"> 
  		<div id="top" align="left" style="padding-left: 5px;padding-bottom: 5px;">
			用户名:<input type="text" name="username" size="10" id="username"/>&nbsp;
			密码:<input type="password" name="password" size=12" id="password"/>&nbsp;
			<input type="button" value="登录" id="login"/>
			<input type="button" value="注册" onclick="register();"/>
  		</div>
  		</c:if>
  		<table width="90%">
  			<tbody>
  				<tr>
  					<td>当太阳升起的时候<br/>一切黑暗将被击破</td>
  					<td><img alt="#" src="../images/head_03.jpg"></td>
  				</tr>
  			</tbody>
  		</table>
  		<table width="80%" border="0">
  			<tr>
  				<td align="left" valign="middle">
  					<%
  					Date date = new Date(); 
  					String[] days = {"日","一","二","三","四","五","六"};
  					%>
  					今天是:<%=date.getYear()+1900%>年<%=date.getMonth()+1%>月<%=date.getDate()%>日&nbsp;星期<%=days[date.getDay()]%>
  				</td>
  				<td align="center" valign="middle">
  					欢迎访问：http://www.myblog.com &nbsp;本站的目标是：将JAVA进行到底！
  				</td>
  				<td align="right" valign="middle">
  					<a href="http://192.168.30.11/Blog">首页</a>
  					<a href="#" id="myblog">我的博客</a>
  					<c:if test="${!empty sessionScope.userInfo.username}">
  					<a href="#" id="addblog">添加博客</a>
  					</c:if>
  					<a href="#" id="remarkblog">评论管理</a>
  					<a href="${pageContext.request.contextPath}/ExitServlet">退出</a>
  				</td>
  			</tr>
  		</table>
  	</div>
  
  	<div id="content">
  		<div id="left">
    			<table width="95%">
    				<tbody>
	    				<tr>
	    					<td align="center">
	    					<c:if test="${empty userInfo.username}">
	    						<img src="../images/zhaoxinguo.jpg" class="logoimg" id="logo"/>
	    					</c:if>
	    					<c:if test="${!empty userInfo.username}">
	    						<img class="logoimg" src="${pageContext.request.contextPath}/upload/${userInfo.photo}"/>
	    					</c:if>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td>
	    						<c:if test="${empty sessionScope.userInfo.motto}">
	    						个人信息：<span style="color: blue;">记得当初的决定和目标吧!</span><div id="userMoto"></div>
	    						</c:if>
	    						<c:if test="${!empty sessionScope.userInfo.motto}">
	    						个人信息：<span style="color: blue;">${userInfo.motto}</span><div id="userMoto"></div>
	    						</c:if>
	    						<hr>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td>
	    						<table width="95%">
	    							<tbody>
	    								<tr>
	    									<td align="center">查询日志</td>
	    								</tr>
	    								<tr>
	    									<td>日志标题：</td>
	    									<td><input type="text" id="blogtitle" name="blogtitle" class="inputtext" size="18"/></td>
	    								</tr>
	    								<tr>
	    									<td>发布日期：</td>
	    									<td><input type="text" onfocus="setday(this)" style="ime-mode:disabled;" id="date" size="18"></td>
	    								</tr>
	    								<tr>
	    									<td><input type="button" value="搜索" class="inputbutton" id="search"/></td>
	    								</tr>
	    							</tbody>
	    						</table>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td>
	    						<hr/>
	    						<table width="95%">
	    							<tbody id="newUpdateBlog">
		    							<tr>
		    								<td align="left" style="color: red; padding-left: 5px;"><b>最新更新的日志</b></td>
		    							</tr>
	    							</tbody>
	    						</table>
	    						<div id="newBlog">
	    						
	    						</div>
	    					</td>
	    				</tr>
    				</tbody>
    			</table>
    		</div>
    		<div id="main">
    		
    		</div>
  	</div>
  	<div id="bottom">
  		<hr/>
    	Copyright &copy; 2013 <a href="mailto:finally_m@yahoo.cn">Finally_m@yahoo.cn</a> Inc. All Rights Reserved. Finally_m 版权所有
    	<br/><br/>
  	</div>
  	<div id="addBlogDiv" style="display: none;">
		<table border="0" cellspacing="1" cellpadding="5" bgcolor="powderblue" align="center">
			<tr bgcolor="#FFFFFF">
				<td>博客标题:</td>
				<td><textarea rows="1" cols="60" name="headline" class="headline"></textarea></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>博客内容:</td>
				<td><textarea rows="10" cols="60" name="content" class="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				<input type="button" value="提交" id="submit"/>
				<input type="button" value="关闭" id="close"/>
				</td>
			</tr>
		</table>
  	</div>
  	<div id="updateBlogDiv" style="display: none;">
		<table border="0" cellspacing="1" cellpadding="5" bgcolor="powderblue" align="center">
			<tr bgcolor="#FFFFFF">
				<td>博客标题:</td>
				<td><textarea rows="1" cols="60" name="headline" class="update_headline"></textarea></td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td>博客内容:</td>
				<td><textarea rows="10" cols="60" name="content" class="update_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				<input type="button" value="更新" id="update_blog"/>
				<input type="button" value="关闭" id="closes"/>
				</td>
			</tr>
		</table>
  	</div>
  </div>
  </body>
</html>
