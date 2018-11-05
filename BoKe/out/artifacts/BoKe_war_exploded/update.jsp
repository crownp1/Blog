<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<%@ page import="Dao.ArticleDao" %>
<%@ page import="Entity.Article" %>
<%@ page import="java.util.List" %>
<!DOCTYPE HTML>
<html lang="en-US">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间  
%>
<%  
		 int id = Integer.parseInt(request.getParameter("id")); 
		request.getSession().setAttribute("id", id);
		out.print("id："+request.getSession().getAttribute("id"));
		ArticleDao articleDao = new ArticleDao();
		Article article = articleDao.queryById(id);
		session.setAttribute("update", article);

%>
<head>
    <meta charset="UTF-8">
    <title>ueditor demo</title>
</head>
 
<body>
    <form action="Update" method="get">
    <div style="width: 800px; height: 400px; margin: 0 auto;">
    <label>文章标题:</label>
    <input type="text" name="title" placeholder=" " value="${update.title }" required=" "/></br>
    <label>文章类型:</label>
    <select name="type" onclick="check()">
     <option value="1" >学无止境</option>
     <option value="2">日记</option>
     <option value="3">慢生活</option>
     <option value="4">美文欣赏</option>
    </select></br>
    <label>文章内容:</label></br>
        <!-- 加载编辑器的容器 -->
     <textarea id="container" name="container"  
        style="width: 800px; height: 400px; margin: 0 auto;">
        ${update.content };
        </textarea> 
     <input type="submit" value="提交">
     </div>
    </form>
    <!-- 配置文件 -->
    <script type="text/javascript" src="<%=basePath%>ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=basePath%>ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var editor = UE.getEditor('container');     
    </script>
   <!--  <script type="text/javascript">
   var CategoryArray = [ 1, 2, 3 ,4];

   function  check() {

   var CategoryObj = document.getElementById("type");
   for ( var i = 0; i < CategoryArray.length; i++) {
 		　    var newOption = new Option();
  　　	  newOption.value = CategoryArray[i];
  　　	  newOption.innerHTML = CategoryArray[i];
　　	      CategoryObj.options.add(newOption);
  　	　       if('${update.id}'.equals("CategoryArray[i]")){
      　　	  CategoryObj.options[i].selected=true;
  	　　}
 	 };
	}
    </script> -->

</body>