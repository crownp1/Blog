<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function(){
		$("#btnMessage").click(function(){
			if($("#username").val()==""){
				$("#info").html("请您先登录后再评论");
				return;
			}
			if($("#message").val()==""){
				$("#info").html("请输入留言");
				return;
			}
			$("#info").ajaxStart(function(){
				$(this).html("正在提交评论...");
			});
			var url = "${pageContext.request.contextPath}/RemarkServlet?method=add";
			$.post(url,{username:$("#username").val(),message:$("#message").val(),blogid:$("#blogid").val()},function(data){
				$("#remark").html(data);
			});
		});
	});
	
	
	//删除当前用户下的博客信息的评论信息：
	function deleteRemark(obj){
		var sure = window.confirm("您确定要删除该条的信息吗？");
		if(sure){
			var url = "../../RemarkServlet";
			$.post(url,{"method":"delete",id:obj.title},function(data){
				$("#remark").html(data);
				$("#remarkblog").click();
				$("#viewBlog").click();
			});
		}
	}
</script>
<table width="100%">
	<tbody>
		<tr><td><b>用户评论</b></td></tr>
		<c:forEach items="${requestScope.list}" var="remark" varStatus="status">
		<input type="hidden" name="id" value="${remark.id}"/>
			<tr>
				<td>${status.count}楼&nbsp;&nbsp;<b>${remark.name}</b>&nbsp;&nbsp;${remark.createdate }&nbsp;&nbsp;${remark.ip }</td>
			</tr>
			<tr>
				<td>${remark.message}</td>
				<c:if test="${!empty sessionScope.userInfo.username}">
				<td align="right" style="padding-right: 20px;"><a onclick="deleteRemark(this);" style="cursor: pointer;text-decoration: underline;color: blue;" title="${remark.id}" id="deleteRemark">删除</a></td>
				</c:if>
			</tr>
			<tr><td><hr></td></tr>
		</c:forEach>
		<tr>
			<td>
				<jsp:include page="../common/pageroll_remark.jsp">
					<jsp:param name="path" value="RemarkServlet?method=list"/>
					<jsp:param name="blogid" value="${requestScope.blogid}"/>
		</jsp:include>	 
			</td>
		</tr>
		<tr>
			<td>
				<table width="80%">
					<tbody>
						<tr>
							<td align="center" colspan="2"><span style="color: red" id="info"></span></td>
						</tr>
						<tr>
							<td>用户名</td>
							<td><input type="text" name="username" id="username" value="${sessionScope.userInfo.username}" class="inputtext"></td>
						</tr>
						<tr>
							<td>留言</td>
							<td>
								<textarea rows="10" cols="40" id="message" name="message" style="width: auto;height: auto" class="inputtext"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" id="btnMessage" value="提交" class="inputbutton">
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>
