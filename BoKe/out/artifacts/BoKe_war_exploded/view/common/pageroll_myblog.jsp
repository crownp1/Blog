<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'pageroll.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath }/view/js/jquery-1.2.6.js"></script>
	<script type="text/javascript">
		function ajaxSubmit(url){
			$("#main").ajaxStart(function(){
				$(this).html("正在加载数据...");
			});
			$.post(url,function(data){
				$("#main").html(data);
			});
		}
		//首页
		function fristPage(){
			var currPage = parseInt(document.rollForm.currPage.value);
			if(currPage==1){
				alert("已经是第一页了");
				return;
			}
			//document.rollForm.currPage.value = 1;
			//document.rollForm.submit();
			var username = document.rollForm.username.value;
			var url=document.rollForm.action+"&currPage=1&username="+username;;
			ajaxSubmit(url);
			
		}
		//上一页
		function previousPage(){
			var currPage = parseInt(document.rollForm.currPage.value);
			if(currPage>1){
				currPage--;
			}else{
				alert("已经是第一页了");
				return;
			}
			//document.rollForm.currPage.value = currPage;
			//document.rollForm.submit();
			var username = document.rollForm.username.value;	
			var url=document.rollForm.action+"&currPage="+currPage+"&username="+username;;
			ajaxSubmit(url);			
		}		
		//下一页
		function nextPage(){
			var currPage = parseInt(document.rollForm.currPage.value);
			var countPage = parseInt(document.rollForm.countPage.value);	
			if(currPage<countPage){
				currPage++;
			}else{
				alert("已经是最后一页了");
				return;
			}	
			//document.rollForm.currPage.value = currPage;
			//document.rollForm.submit();			
			var username = document.rollForm.username.value;
			var url=document.rollForm.action+"&currPage="+currPage+"&username="+username;
			ajaxSubmit(url);	
		}		
		//最后一页
		function lastPage(){
			var currPage = parseInt(document.rollForm.currPage.value);
			var countPage = parseInt(document.rollForm.countPage.value);
			if(currPage==countPage)	{
				alert("已经是最后一页了");
				return;
			}
			//document.rollForm.currPage.value = countPage;
			//document.rollForm.submit();
			var username = document.rollForm.username.value;
			var url=document.rollForm.action+"&currPage="+countPage+"&username="+username;;
			ajaxSubmit(url);
		}
		//去往第几页
		function gotoPage(_value){
			//document.rollForm.currPage.value = _value;
			//document.rollForm.submit();
			var username = document.rollForm.username.value;	
			var url=document.rollForm.action+"&currPage="+_value+"&username="+username;;
			ajaxSubmit(url);
		}
		
	</script>
  </head>
  
  <body>
  	<form action="<%=request.getContextPath()%>/${param.path}" name="rollForm" method="post" onsubmit="">
  		<input type="hidden" name="currPage" value="${requestScope.PageRoll.currPage}">
  		<input type="hidden" name="countPage" value="${requestScope.PageRoll.countPage}">
  		<input type="hidden" name="username" value="${param.username}">
  		<!-- 搜索关键字段 -->
  		<table align="center">
	    	<tr>
	    		<td>
	    			第[${requestScope.PageRoll.currPage}]页
	    			共[${requestScope.PageRoll.countPage}]页
	    			共有[${requestScope.PageRoll.countSize}]条记录
	    		</td>
	    		<c:if test="${requestScope.PageRoll.currPage!=1}">
			    	<td>
			    		<img src="<%=request.getContextPath()%>/view/images/firstPage.gif" onClick="fristPage()" alt="首页" style="cursor: pointer;">
			    	</td>
			    	<td>
			    		<img src="<%=request.getContextPath()%>/view/images/prevPage.gif" onClick="previousPage()" alt="上一页"  style="cursor: pointer;">		    	
			    	</td>
		    	</c:if>
		    	<c:if test="${requestScope.PageRoll.currPage==1}">
			    	<td>
			    		<img src="<%=request.getContextPath()%>/view/images/firstPageDisabled.gif" alt="首页">
			    	</td>
			    	<td>
			    		<img src="<%=request.getContextPath()%>/view/images/prevPageDisabled.gif" alt="上一页">		    	
			    	</td>		    		
		    	</c:if>
	    			<c:set var="curr_page" value="${requestScope.PageRoll.currPage}"></c:set>
	    			<c:set var="count_page" value="${requestScope.PageRoll.countPage}"></c:set>
					<c:if test="${(curr_page-1)>0}">
						<c:set var="p" value="${requestScope.PageRoll.pageCode+1}"></c:set>
						<c:forEach begin="1" end="${requestScope.PageRoll.pageCode}" var="s" step="1">
							<c:set var="p" value="${p-1}"></c:set>
							<c:if test="${(curr_page-p)>0}">
								<td><a style="cursor: pointer" onclick="gotoPage(${curr_page-p})">[${curr_page-p}] </a></td>
							</c:if>
						</c:forEach>
					</c:if>
	    			<td><c:out value="${curr_page}"></c:out></td>
					<c:if test="${(count_page-curr_page)>0}">
						<c:forEach begin="1" end="${requestScope.PageRoll.pageCode}" step="1" var="s">
							<c:if test="${(curr_page+s)<=count_page}">
									<td><a style="cursor: pointer" onclick="gotoPage(${curr_page+s})">[${curr_page+s}] </a></td>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${requestScope.PageRoll.currPage<requestScope.PageRoll.countPage}">
				    	<td>
			    			<img src="<%=request.getContextPath()%>/view/images/nextPage.gif" onClick="nextPage()" alt="下一页"  style="cursor: pointer;">
				    	</td>
				    	<td>
			    			<img src="<%=request.getContextPath()%>/view/images/lastPage.gif" onClick="lastPage()" alt="最后一页"  style="cursor: pointer;">
				    	</td>
			    	</c:if>
					<c:if test="${requestScope.PageRoll.currPage==requestScope.PageRoll.countPage}">
				    	<td>
			    			<img src="<%=request.getContextPath()%>/view/images/nextPageDisabled.gif"  alt="下一页">
				    	</td>
				    	<td>
			    			<img src="<%=request.getContextPath()%>/view/images/lastPageDisabled.gif" alt="最后一页">
				    	</td>
			    	</c:if>

	    	</tr>
	    </table>
    </form>
  </body>
</html>
