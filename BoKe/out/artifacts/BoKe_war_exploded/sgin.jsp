<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Welcome To CSDN -- Please sign</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Out Strip Sign In Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- css files -->
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<!-- //css files -->
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>
<div data-vide-bg="video/video2">
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1>Welcome To CSDN</h1>
		</div>
		<!--//header-->
		<!--main-->
		<div class="main-content-agile">
			<div class="wthree-pro">
				<h2>Sign in</h2>
			</div>
			<div class="sub-main-w3">	
				<form action="Register" method="post">
					
					<div class="icon1">
						<i>username</i>
						<input placeholder=" " name="username"  onclick="check()" type="text" required="">
					</div>
					
					<div class="icon2">
						<i>Password</i>
						<input  placeholder=" " name="Password" type="password" required="">
					</div>
					<div class="icon2">
						<i>email</i>
						<input  placeholder=" " name="email" type="Email" required="">
					</div>
					<div class="icon2">
						<i>phone</i>
						<input  placeholder=" " name="phone" type="text" required="">
					</div>
					<div class="icon2">
						<i>qq</i>
						<input  placeholder=" " name="qq" type="text" required="">
					</div>
					<div class="icon2">
						<i>info</i>
						<input  placeholder=" " name="info" type="text" required="">
					</div>
				   <div class="rem-w3">
						<a href="index.html" class="two-w3ls" ><i class="fa fa-google-plus" aria-hidden="true"></i>立即返回</a>	
					</div>
					<div class="navbar-right social-icons"> 
				<!-- 		<a href="login.jsp" class="one-w3ls" ><i class="fa fa-facebook" aria-hidden="true"></i> Login</a>
						<a href="sgin.html" class="two-w3ls" ><i class="fa fa-google-plus" aria-hidden="true"></i>Sign</a>  -->
						<input class="form-control btn btn-primary" id="submit" value="注册"  type="submit">

						<div class="clear"></div>
					</div>
				</form>
			</div>
		</div>
		<!--//main-->
		<!--footer-->
		<div class="footer">
			
		</div>
		<!--//footer-->
	</div>
</div>
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script src="js/jquery.vide.min.js"></script>
<script type="text/javascript">
   function check(){
  if(request.getAttribute("user")!=null){
	   alert("该用户已经注册");
}
}
</script>
<!-- //js -->
</body>
</html>