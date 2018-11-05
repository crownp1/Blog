<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Dao.IndexDao" %>
<%@ page import="Entity.Article" %>
<%@ page import="Entity.User" %>
<%@ page import="Entity.ArticleType" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html>
<head>
<meta charset="gbk">
<title>个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/m.css" rel="stylesheet">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/comm.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%
      User user =(User) request.getSession().getAttribute("user");
	   IndexDao indexDao = new IndexDao();
	  List<Article> articleList = indexDao.queryById(String.valueOf(user.getId())); 
 	  request.getSession().setAttribute("article",articleList); 
%>
<header class="header-navigation" id="header">
  <nav><div class="logo"><a href="/">个人博客</a></div>
    <h2 id="mnavh"><span class="navicon"></span></h2>
    <ul id="starlist">
	  <li><a>欢迎你：${user.getUsername()}</a> | <a href="index.jsp">安全退出</a></li>
    </ul>
</nav>
</header>
<article>
  <aside class="l_box">
      <div class="search">
<!--         <form action="index.jsp" method="post" name="searchform" id="searchform">
          <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字词" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字词'}" type="text">
          <input name="show" value="title" type="hidden">
          <input name="tempid" value="1" type="hidden">
          <input name="tbname" value="news" type="hidden">
          <input name="Submit" class="input_submit" value="搜索" type="submit">
        </form> -->
      </div>
      <div class="fenlei">
        <h2>博客管理</h2>
        <ul>
          <li><a href="index1.jsp">主页</a></li>
          <li><a href="/">个人信息</a></li>
          <li><a href="uediter.jsp">发布文章</a></li>
          <li><a href="Blog.jsp">我的博客</a></li>
        </ul>
      </div>
  </aside>
  <main class="r_box">
   <c:forEach var="art" items="${sessionScope.article}">                                                         
    <li><!-- <i><a href="/"><img src="images/1.jpg"></a></i> -->
      <h3><a href="/">${art.title}</a></h3>
       <button id="btnEdit" type="button" class="btn   btn-warning">
       <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        <a href="update.jsp?id=${art.id}" >修改</a> 
        </button>
        <button id="btnDel" type="button" class="btn  btn-danger" data-toggle="modal" data-target="#DeleteForm" onclick="">
        <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
          <a href="/BoKe/Del?id=${art.id}" onclick="return confirm('确定要删除吗?')" class="del">删除</a>
         </button>        
      <p>${art.content}</p>
	 <span style="float:float">发布日期:${art.pub_date}</span>
    </li>
    </c:forEach> 
  </main>
</article>
<footer>
  <p>Design by <a href="http://www.yangqq.com" target="_blank">${user.getUsername()}个人博客</a> <a href="/">蜀ICP备11002373号-1</a></p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
</html>
