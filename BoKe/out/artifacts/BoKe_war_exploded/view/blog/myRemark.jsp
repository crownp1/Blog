<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>My JSP 'myRemark.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath }/view/js/jquery-1.2.6.js"></script>
	<script type="text/javascript">
		function viewBlog(obj){
			$("#main").ajaxStart(function(){
				$(this).html("正在加载数据...");
			});
			var url = "${pageContext.request.contextPath }/BlogServlet?method=view";
			$.get(url,{blogid:obj.title},function(data){
				$("#main").html(data);
			});
		}
	</script>
	</head>
<body>
<div>
	<c:forEach items="${requestScope.list}" var="remark">
	<div class="blogdiv">
	<table width="100%">
	<tbody>    		
		<tr>
			<td>创建时间：${remark.createdate}</td>
			<td>修改时间：${remark.blog.updatedate}</td>
		</tr>
		<tr>
			<td colspan="2" id="viewblog">
			<b><a onclick="viewBlog(this)" style="cursor: pointer;text-decoration: underline;color: 33CCCC;" title="${remark.blog.blogid}" target="_blank">${remark.blog.headline}</a></b></td>
		</tr>
		<tr>
			<td colspan="2">
				${remark.blog.content}
			</td>
		</tr>	
		</tbody>
	</table>
	</div>
	</c:forEach>
	</div>
</body>
</html>
