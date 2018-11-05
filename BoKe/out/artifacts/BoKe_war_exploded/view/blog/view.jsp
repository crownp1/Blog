<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'view.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		$(function(){
			var url = "${pageContext.request.contextPath}/RemarkServlet?method=list&blogid="+${requestScope.Blog.blogid};
			$.post(url,function(data){
				$("#remark").html(data);
			});
		});
		
	</script>
  </head>
  
  <body>
  	<div class="blogdiv">
  		<input type="hidden" id="blogid" value="${requestScope.Blog.blogid}">
   		<table width="100%">
   		<tbody>    		
   			<tr>
   				<td>创建时间：${requestScope.Blog.createdate}</td>
   				<td>修改时间：${requestScope.Blog.updatedate}</td>
    		</tr>
    		<tr>
   				<td colspan="2"><b>${requestScope.Blog.headline}</b></td>
   			</tr>
   			<tr>
   				<td colspan="2">
   					${requestScope.Blog.content}
   				</td>
   			</tr>	
   			</tbody>
   		</table>
		<table width="100%">
			<tbody>
				<tr><td><hr></td></tr>
				<tr>
					<td>
						<div id="remark">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
    </div>
  </body>
</html>
