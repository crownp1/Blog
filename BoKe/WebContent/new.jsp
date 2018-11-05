<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="Entity.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.ArticleDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css1/bootstrap.min.css">
<title>博文信息</title>
</head>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ArticleDao articleDao = new ArticleDao();
    Article article = articleDao.queryById(id);
    session.setAttribute("atrcleOne", article);
    
%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-push-2">
				<article style="overflow-y:auto;"> <header>
				<div style="text-align: center;">
					<h2 style="display: inline;">${atrcleOne.title}</h2>
				</div>

				</header>
				<hr>
				</br>
				<div>${atrcleOne.content}</div>
				</br>
				<footer style="float:right;">
				<h5>发布人:${atrcleOne.username}</h5>
				<p>发布日期:${atrcleOne.pub_date}</p>
				</footer> </article>
				<div>  <button><a onclick="history.go(-1)">返回</a></button> </br></div>
			</div>
		</div>
	</div>
</body>
<style>
.container {
	height: 800px;
	/* boder: 1px solid black; */
	background-color:rgb(239,228,176);
	backgroun-size: 100%;
}

.row {
	margin-top: 30px;
	height: 800px;
	/* border: 1px solid black; */
}

.col-md-8 {
	height: 700px;
	/* border: 1px solid black; */
	overflow-y:auto;
	
}
</style>
</html>
