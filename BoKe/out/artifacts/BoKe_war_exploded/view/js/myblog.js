//添加博客信息:
$(function(){
	$("#addblog").click(function(){
		$("#addBlogDiv").fadeTo("fast",0.99);
	});
	$("#submit").click(function(){
		var uid = $(":input").val();
		var headline = $(".headline").val();
		var content = $(".content").val();
		var url = "../../BlogServlet";
		$.post(url,{"method":"add","uid":uid,"headline":headline,"content":content},function(data){
			$("#main").html(data);
			$("#addBlogDiv").hide();
			$("#myblog").click();
		});
		//添加博客后置空
		var headline = $(".headline").val("");
		var content = $(".content").val("");
	});
	
	$("#close").click(function(){
		$("#addBlogDiv").hide();
	});
});


//查看当前用户下的博客信息:
$(function() {
	//我的博客
	$("#myblog").click(function() {
		var username = $("#welcome").text();
		if (username == "") {
			window.alert("您还没有登录，请登录后再查看我的博客");
		} else {
		    var url = "../../BlogServlet";
			$.post(url,{"method":"findMyBlog","username":username},function(data) {
				$("#main").html(data);
			});
		}
	});
	//评论管理
	$("#remarkblog").click(function(){
		var username = $("#welcome").text();
		if(username == ""){
			window.alert("您还没有登录，请登录后再评论");
		}else{
			var url = "../../RemarkServlet";
			$.get(url,{"method":"remark","username":username},function(data){
				$("#main").html(data);
			});
		}
	});
});

//删除当前用户下的博客信息：
function deleteBlog(obj){
	var sure = window.confirm("您确定要删除该条的信息吗？");
	if(sure){
		var url = "../../BlogServlet";
		$.post(url,{"method":"delete",blogid:obj.title},function(data){
			$("#main").html(data);
			$("#myblog").click();
		});
	}
}

//修改当前用户下的博客信息:
function updateBlog(obj){
	$("#updateMyBlog").click(function(){
		$("#main").ajaxStart(function(){
			$(this).html("正在加载数据...");
		});
	});
	
	$("#updateBlogDiv").fadeTo("fast",0.99);
	var url = "../../BlogServlet?method=findByBlogId";
	$.get(url,{blogid:obj.title},function(returnedData, status){
		var headline= returnedData.headline;
		var createdate= returnedData.createdate;
		var content= returnedData.content;
		var headline = $(".update_headline").val(headline);
		var content = $(".update_content").val(content);
	});
	
	$("#update_blog").click(function(){
		var headline = $(".update_headline").val();
		var content = $(".update_content").val();
		var url = "../../BlogServlet";
		$.get(url,{"method":"update",blogid:obj.title,"headline":headline,"content":content},function(data){
			$("#myblog").click();
			$("#updateBlogDiv").hide();
		})
	});
		
	$("#closes").click(function(){
		$("#updateBlogDiv").hide();
	});
	
}
























