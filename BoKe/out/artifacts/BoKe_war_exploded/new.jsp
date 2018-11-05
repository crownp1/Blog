<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>news</title>  
<style type="text/css">  
.news {  
    width: 800px;  
    margin: 0 auto;  
}  
</style>  
</head>  
<body>  
<%
    //图片保存的路径,可以到这个路径下查看
    out.println(request.getRealPath(""));
%>
    <div class="news">  
       ${content}
  
    </div>  
</body>  
</html>