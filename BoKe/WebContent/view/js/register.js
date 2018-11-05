var XMLHttpReq;
var userAviable;
创建XMLHttpRequest对象
function createXMLHttpRequest() {
	if (window.XMLHttpRequest) { //Mozilla 浏览器
		XMLHttpReq = new XMLHttpRequest();
	} else {
		if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
	}
}

//发送请求函数
function sendRequest(url) {
	createXMLHttpRequest();
	XMLHttpReq.open("GET", url, true);
	XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
	XMLHttpReq.send(null);
}

// 处理返回信息函数
function processResponse() {
	if (XMLHttpReq.readyState == 4) {// 判断对象状态
		if (XMLHttpReq.status == 200) {// 信息已经成功返回，开始处理信息
			var result = XMLHttpReq.responseText;
			if (result == 1) {
				window.alert("用户名已经被占用,请输入新的!");
				document.regForm.username.focus();
				userAviable = false;
			} else {
				userAviable = true;
			}
		} else {
			//页面不正常
			window.alert("您所请求的页面有异常");
		}
	}
}

function checkUser() {
	var username = document.regForm.username.value;
	//在js中判断为空只能使用"",不能使用null.
	if (username == "") {
		window.alert(document.regForm.username.msg);
		document.regForm.username.focus();
		return false;
	} else{
		sendRequest("../../CheckUserNameServlet?username=" + username);
	}
}


// 注册函数
function regist() {
	if (!userAviable) {
		return false;
	}
	var username = document.regForm.username.value;
	var password = document.regForm.password.value;
	var nickname = document.regForm.nickname.value;
	var motto = document.regForm.motto.value;
	var photo = document.regForm.photo.value;
	if (username == "") {
		window.alert(document.regForm.username.msg);
		document.regForm.username.focus();
		return false;
	} else {
		if (password == "") {
			window.alert(document.regForm.password.msg);
			document.regForm.password.focus();
			return false;
		} else {
			if (nickname == "") {
				window.alert(document.regForm.nickname.msg);
				document.regForm.nickname.focus();
				return false;
			} else {
				if (motto == "") {
					window.alert(document.regForm.motto.msg);
					document.regForm.motto.focus();
					return false;
				} else {
					if (photo == "") {
						window.alert(document.regForm.photo.msg);
						document.regForm.photo.focus();
						return false;
					} else {
						return true;
					}
				}
			}
		}
	}
}
