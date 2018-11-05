<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Dao.IndexDao" %>
<%@ page import="Entity.Article" %>
<%@ page import="Entity.ArticleType" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人博客网站</title>
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
   IndexDao indexDao = new IndexDao();
   String id = request.getParameter("id");
   String condition = request.getParameter("keyboard");
    List<Article> list = null;
    list = indexDao.queryAll(condition,id);
    List<ArticleType> count = indexDao.queryAll();
     session.setAttribute("list", list);
     session.setAttribute("count", count);
%>
<header class="header-navigation" id="header">
  <nav><div class="logo"><a href="index.jsp">博客首页</a></div>
    <h2 id="mnavh"><span class="navicon"></span></h2>
    <ul id="starlist">
    <li><a onclick="history.go(-1)">返回</a></li>
	  <li><a href="login.jsp">登录</a>|<a href="sgin.jsp">注册</a></li>
    </ul>
</nav>
</header>
<article>
  <aside class="l_box">
      <div class="search">
        <form action="index.jsp">
          <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字词" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字词'}" type="text">
          <input name="Submit" class="input_submit" value="搜索" type="submit">
          </form>
      </div>
      <div class="fenlei">
        <h2>文章分类</h2>
        <ul>
       <c:forEach var="type" items="${sessionScope.count}">
          <li><a href="?id=${type.id}">${type.type}（${type.count }篇）</a></li>
     </c:forEach>
        </ul>
      </div>
      <div class="tuijian">
      <h2>站长推荐</h2>
      <ul>
        <li><a href="/">你是什么人便会遇上什么人</a></li>
        <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
        <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
        <li><a href="/">个人博客模板《绅士》后台管理</a></li>
        <li><a href="/">你是什么人便会遇上什么人</a></li>
      </ul>
    </div>
     <div class="tuijian">
      <h2>点击排行</h2>
      <ul>
        <li><a href="/">你是什么人便会遇上什么人</a></li>
        <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
        <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
        <li><a href="/">个人博客模板《绅士》后台管理</a></li>
        <li><a href="/">你是什么人便会遇上什么人</a></li>
      </ul>
    </div>
  </aside>
  <main class="r_box">
    <c:forEach var="art" items="${sessionScope.list}">
    <li><!-- <i><a href="/"><img src="images/1.jpg"></a></i> -->
      <h3><a href="new.jsp?id=${art.id}">${art.title}</a></h3>
      <%-- <p>${art.content}</p> --%>
	  <a href="" style="float:left">发布人:${art.username}</a><span style="float:right">发布日期:${art.pub_date}</span>
    </li>
  

    </c:forEach>
   
  </main>
</article>
<footer>
  <p>Design by <a href="http://www.yangqq.com" target="_blank">个人博客</a> </p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
</html>
