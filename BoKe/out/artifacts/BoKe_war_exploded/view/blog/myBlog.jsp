<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'myBlog.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<body>
	<div>
	<c:forEach items="${requestScope.list}" var="blog">
	<div class="blogdiv">
		<table width="100%">
		<tbody>    		
			<tr>
				<td>创建时间：${blog.createdate}</td>
				<td>修改时间：${blog.updatedate}</td>
			</tr>
			<tr>
				<td colspan="1" id="viewblog"><b><a onclick="viewBlog(this)" style="cursor: pointer;text-decoration: underline;color: blue;" title="${blog.blogid}" target="_blank">${blog.headline}</a></b></td>
				<td align="right">
					<a onclick="deleteBlog(this)" style="cursor: pointer;text-decoration: underline;color: blue;" title="${blog.blogid}" id="deleteMyBlog">删除</a> |  
					<a onclick="updateBlog(this)" style="cursor: pointer;text-decoration: underline;color: blue;" title="${blog.blogid}" id="updateMyBlog">修改</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					${blog.content}
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	</c:forEach>
	</div>
	<table width="90%" align="center">
	<tr>
	<td>
		<jsp:include page="../common/pageroll_myblog.jsp">
			<jsp:param name="path" value="BlogServlet?method=findMyBlog"/>
			<jsp:param name="username" value="${requestScope.username}"/>
		</jsp:include>	 
	</td>
	</tr>
	</table>	
</body>
</html>