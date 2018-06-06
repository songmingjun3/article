<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/login.css "/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
</head>
<body>
	<!-- 头部页面 -->
	<%@include file="common/header.jsp" %>
	<!-- 展示信息 -->
	<div class='show'>
		<img src = "static/img/msg.png" ></img>
	</div>
	<!-- 登陆界面 -->
	<div class='content'>
		<div class='logo'>用户登陆</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username" autofocus="autofocus" autocomplete="off" 
			maxlength="60" placeholder="请输入账号/邮箱/手机号"	/>
			<i style='font-size:20px;margin-left:-32px;opacity:0.8;' class='iconfont icon-yonghuming'>
			</i>
		</div>
		
		<div class='inputBox mt50 ml32'>
			<input type="password" id=password autofocus="autofocus" autocomplete="off"
			maxlength="60" placeholder="请输入密码" />
			<i style='font-size:20px;margin-left:-32px;opacity:0.8;' class='iconfont icon-mima'></i>
		</div>	
		
		<div class='mt50 ml32'>
			<button class="login_btn" onclick="login()">登陆</button>
		</div>
	</div>
	<script>
		function login(){
			var username = $('#username').val();
			var password = $('#password').val();
			$.ajax({
				type:"post",//请求方式
				url:"${basePath}/controller/loginController.jsp",//请求地址
				data:{"username":username,"password":password},//传递给controller的json数据
				error:function(){//返回错误
					alert("登陆出错！");
				},
				success:function(data){
					//返回成功执行的回调函数，data为loginCtroller返回的代码
					if(data == -1)
					{	
						alert('用户名和密码不能为空！');
					}else if(data == -2){
						alert('用户名不存在！');
					}else if(data == -3){
						alert('用户名或者密码错误');
					}else{
						//登录成功返回首页
						window.location.href = "${basePath}";
					}
				}
			});
		}
	</script>
</body>
</html>