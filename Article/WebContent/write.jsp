<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common/taglib.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写作</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link href="${basePath}/static/css/index.css" rel="stylesheet" type="text/css">
<link href="${basePath}/static/css/public.css" rel="stylesheet" type="text/css">
<style type="text/css">
input[type=text], select, textarea {
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
    float:right;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=button]:hover {
    background-color: #45a049;
}

.main {
	margin:auto;
	height:800px;
	width:80%;
	border-radius: 5px;
	background-color: #EDF7F8;
	padding: 20px;
}
</style>
</head>

<body>
	<%@include file="common/header.jsp"%>
 	<div class="main">
			<label for="header">文章标题</label>
		    <input type="text" id="header" name="header" 		placeholder="请输入文章标题">
			<label for="name">文章名字</label>
		    <input type="text" id="name" name="name" 		placeholder="请输入文章标题">
		    <label for="desciption">文章简介</label>
		    <input type="text" id="description" name="description" placeholder="请输入文章简介..">
		
		    <label for="category">文章类别</label>
		    <select id="category" name="category">
		      <option value="1">连载小说</option>
		      <option value="2">编程代码类</option>
		      <option value="3">干活分享</option>
		    </select>
		
		    <label for="content">正文</label>
		    <textarea id="content" name="content" placeholder="输入正文" style="height:400px"></textarea>
		
		    <input type="button"  class="button" value="提交">
    </div>
    <script>
    	$(".button").eq(0).on('click',function(){
    		var content=$("#content").val();
       		var name=$("#name").val();
       		var description= $("#description").val();
       		var header = $("#header").val();
       		var select=document.getElementById("category");
       		var category = select.options[select.options.selectedIndex].value;
    		$.post("${basePath}/controller/WriteController.jsp",
    				{name:name,description:description,content:content,category:category,header:header},
    				function(data){
    			data = data.trim();
    			if(data == '-1'){
    				alert('请先登录！');
    			}else if(data == '1'){
    				alert('保存成功！');
    				location.reload();
    			}
    		});
    	});
    </script>
      	
</body>
</html>