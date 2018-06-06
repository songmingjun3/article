<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common/taglib.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${basePath}/static/js/jQuery.js"></script>
<link href="${basePath}/static/css/index.css" rel="stylesheet" type="text/css">
<link href="${basePath}/static/css/public.css" rel="stylesheet" type="text/css">
<title>register</title>
<style type="text/css">
input[type=text]{
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
    font-size:16px;
}
input[type=password]{
	width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
    font-size:16px;
	
}
input[type=button] {
    background-color: #4CAF50;
    color: white;
    margin-left:120px;
    padding: 12px 60px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=button]:hover {
    background-color: #45a049;
}

.main {
	margin:auto;
	height:600px;
	width:400px;
	border-radius: 5px;
	background-color: #EDF7F8;
	padding: 20px;
}
input[type="checkbox"] + label::before {
content: '\a0'; /* non-break space */
display: inline-block;
vertical-align: .2em;
width: .20em;
height: .8em;
margin-right: .2em;
border-radius: .2em;
background: silver;
text-indent: .15em;
line-height: .65;
float:left;
}
.header_pic{
	margin-top:20px;
	margin-bottom:20px;
	width:100px;
	height:100px;
	margin-left:auto;
	margin-right:auto;
}
.header_pic .text{
	visibility:hidden;
	width:100px;
	font-size:10px;
	text-align:center;
}
.header_pic:hover .text{
	visibility:visible;
}
</style>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<div class="header_pic">
		<img  src="${basePath}/static/img/defaultHeaderPic.jpg" href="">
		<p class="text">上传头像</p>
	</div>
 	<div class="main">
			<label for="username">用户名
				<input type="text" id="username" name="username" maxlength="20">
			</label>
		    
			<label for="password">密码
				<input type="password" id="password" name="password" maxlength="20">
			</label>
		    
		    <label for="confirm">确认密码
		    	<input type="password" id="confirm" name="confirm" maxlength="20">
		    </label>
		   	<div id="sex" style="margin-bottom:16px;">性别
		   		<input type="checkbox" id="male" name="sex" value="1"/>
				<lable for="male" >男</label>
				<input type="checkbox" id="female" name="sex" value="0">
				<lable for="female">女</lable>
				<div style="clear:both"></div>
			</div>
			
		    <label for="telephone">手机号
		    	<input type="text" id="telephone" name="telephone" maxlength="11">
		    </label>
		    <label for="email">邮箱
		    	<input type="text" id="email" name="email" maxlength="100">	
		    </label>
		    <label for="address">地址
		    	<input type="text" id="address" name="address" maxlength="100">
		    </label>
		    <input type="button"  class="button" value="注册">
    </div>
</body>
	<script>
	/*使sex复选框只能选中一个*/
	$(document).ready(function(){  
	    $('#sex').find('input[type=checkbox]').bind('click', function(){  
	        $('#sex').find('input[type=checkbox]').not(this).attr("checked", false);  
	    });  
	}); 
		
		$(".button").eq(0).on('click',function(){
			/*判断选中的性别*/
			var sexCheck=document.getElementsByName("sex");
			if(sexCheck[0].checked)
				var sex=sexCheck[0].value;
			else
				var sex=sexCheck[1].value;
			var username=$("#username").val();
			var password=$("#password").val();
			var confirm =$("#confirm").val();
			var telephone=$("#telephone").val();
			var email=$("#email").val();
			var address=$("#address").val();
			$.post("${basePath}/controller/registerController.jsp",
					{
						sex:sex,
						username:username,
						password:password,
						confirm:confirm,
						telephone:telephone,
						email:email,
						address:address
					},
					function(data){
					data=data.trim();
					if(data=="-1")
						alert("用户名或密码为空");
					else if(data=="-2")
						alert("手机号不能为空");
					else if(data=="-3")
						alert("邮箱不能为空");
					else if(data=="-4")
						alert("地址不能为空");
					else if(data=="-5")
						alert("输入的密码不一致");
					else if(data=="-6")
						alert("用户名已存在");
					else if(data=="-7")
						alert("手机号已被注册");
					else if(data=="-8")
						alert("邮箱已被注册");
					else if(data=="1")
					{
						alert("注册成功");
						window.location.href="${basePath}";
					}
						
				})
		});
	</script>
</html>