<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>博客注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/index.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/js/register.js"></script>
  </head>
  <body>
<form action="${pageContext.request.contextPath}/UserInfoServlet?method=register" method="post"  onsubmit="return regist()" name="regForm" enctype="multipart/form-data">
	<table height="30" cellspacing="0" cellpadding="0" width="750" bgcolor="#ff0000" border="0" align="center">
		<tr>
			<td width="3"></td>
			<td width="252"></td>
			<td style="PADDING-TOP: 2px" align="center">
				<p align="center">
					<b><font color="#ffffff">新用户注册</font></b>
				</p>
			</td>
			<td width="252"></td>
			<td width="3"></td>
		</tr>
	</table>
	<table height="45" cellspacing="0" cellpadding="0" width="750" background="../images/bk_11.jpg" border="0" align="center">
			<tbody>
				<tr>
					<td align="center">
						<font color="#FF0000"><b>请填写您的个人信息！</b></font>
					</td>
				</tr>
			</tbody>
		</table>
	<table cellspacing="1" cellpadding="0" width="750" height="500" align="center" bgcolor="lightblue">
		<tr bgcolor="#FFFFFF" height="30">
			<td align="center">用户名*(必填)</td>
			<td style="padding-left: 5px;">
				<input onblur="checkUser()" type="text" name="username" id="username" msg="用户名不能为中文,为空,应为字母、数字、下划线"/>
				<span style="color: blue;"><b>用户名不能为中文,为空,应为字母、数字、下划线</b></span>
			</td>
		</tr>
		<tr bgcolor="#FFFFFF" height="30">
			<td align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码*(必填)</td>
			<td style="padding-left: 5px;">
				<input type="password" name="password" id="password" size="21" msg="密码应为6字母、数字、特殊字符"  max="18" min="6"/>
				<span style="color: blue;"><b>密码应为6字母、数字、特殊字符</b></span>
			</td>
		</tr>
		<tr bgcolor="#FFFFFF" height="30">
			<td align="center">别&nbsp;&nbsp;&nbsp;&nbsp;名*(必填)</td>
			<td style="padding-left: 5px;">
				<input type="text" name="nickname" id="nickname" msg="您的别名不能为空"/>
				<span style="color: blue;"><b>请输入您的别名</b></span>
			</td>
		</tr>
		<tr bgcolor="#FFFFFF" height="30">
			<td align="center">座右铭*(必填)</td>
			<td style="padding-left: 5px;"><input type="text" name="motto" id="motto" msg="您的座右铭不能为空"/></td>
		</tr>
		<tr bgcolor="#FFFFFF" height="30">
			<td align="center">个人头像*(必填)</td>
			<td style="padding-left: 5px;"><input type="file" name="photo" id="photo" msg="您的个人照片不能为空"/></td>
		</tr>
			<tr bgcolor="#FFFFFF">
			<td align="center" colspan="2">
				<input type="button" value="返回" onclick="javascript:history.go(-1)"/>
				<input type="submit" value="注册"/>
				<input type="reset" value="重置"/>
			</td>
		</tr>
	</table>
</form>
  </body>
</html>
