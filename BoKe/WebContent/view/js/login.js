$(function(){
	$("#login").click(function(){
		var _username = $.trim($("#username").val());
		var _password = $.trim($("#password").val());
		if(""==_username ||""==_password){
			alert("用户名或密码为空了，请查证后重新输入！");
			$("#username").val("");
			$("#password").val("");
		}else{
			url = "../../UserInfoServlet";
			$.post(url,{"method":"login","username":_username,"password":_password},function(data){
				if(data!=null){
					$("#login").attr("disabled","disabled");
					//重新加载个人头像
					window.location.href="/Blog/view/blog/index.jsp";
				}else{
					alert("您输入的登录信息有误，请查询后重新登录");
					$("#username").val("");
					$("#password").val("");
				}
			});
		}
	});
});