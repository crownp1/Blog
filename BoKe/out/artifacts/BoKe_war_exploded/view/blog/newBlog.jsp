<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'newBlog.jsp' starting page</title>
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
  	<c:forEach items="${requestScope.list}" var="blog">
	<table width="100%">
		<tbody>   
			<tr>
				<td colspan="2" style="color: graytext;"><b><a onclick="viewBlog(this)" style="cursor: pointer;text-decoration: underline" title="${blog.blogid}" target="_blank">${blog.headline}</a></b></td>
			</tr>
			<tr>
				<td colspan="2">更新时间：${blog.updatedate}</td>
			</tr>
		</tbody>
	</table>
	</c:forEach>
  </body>
</html>
