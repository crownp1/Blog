<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE HTML>
<html lang="en-US">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间  

%>
<head>
    <meta charset="UTF-8">
    <title>ueditor demo</title>
</head>
 
<body>
    <form action="Uediter" method="post">
    <div style="width: 800px; height: 400px; margin: 0 auto;">
    <label>文章标题:</label>
    <input type="text" name="title" placeholder=" " required=" "/></br>
    <label>发布时间:</label>
    <input type="text" name="time" value="<%=datetime%>" required=" "/></br>
    <label>文章类型:</label>
    <select name="type">
     <option value="1">学无止境</option>
     <option value="2">日记</option>
     <option value="3">慢生活</option>
     <option value="4">美文欣赏</option>
    </select></br>
    <label>文章内容:</label></br>
        <!-- 加载编辑器的容器 -->
     <textarea id="container" name="container"  
        style="width: 800px; height: 400px; margin: 0 auto;"></textarea> 
     <input type="submit" onclick="AddConvention()" value="发布文章">
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
    
<script type="text/javascript">
    $(document).ready(function () {
 
        ue = UE.getEditor('editor');
        ue.ready(function () {
        })
 
    })
 
    function AddConvention() {
 
        ue = UE.getEditor('editor');
        var content = ue.getContent();
        var title = document.getElementById("title").value;
       
 
        if ($("#title").val() == "") {
            $.messager.alert('提示', '文章标题不能为空！', 'Info');
            return;
        }
 
        $.ajax({
            type: "POST",
            url: "/BoKe/Uediter",
            data:{ "Content": content,
                "Title": title,
                
            },
            success: function (data) {
                if (data == true) {
                    $.messager.alert('提醒', '添加成功');    
                }
                else {
                    $.messager.alert('提示', '已存在同名公约，请重新填写！')
                }
            },
            error: function () {
                $.messager.alert('提示',"公约添加失败，请联系管理员");
            }
 
        })
    }
 
</script>

    <!-- <script>
   <!--  //加载编辑器
    var ue = UE.getEditor('container', {
        toolbars: [[
                'fullscreen', 'source',
                'bold', 'italic', 'underline', 'forecolor', 'insertorderedlist',
               'fontfamily', 'fontsize',
                'justifyleft', 'emotion','justifycenter',
                'link', 'unlink',
                'simpleupload', 'snapscreen'
        ]]
    });
   
  </script> -->
</body>