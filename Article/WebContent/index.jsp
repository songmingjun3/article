<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="service.ArticleService" %>
<% ArticleService articleService =new ArticleService(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script src="${basePath}/static/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/public.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/index.css"/>
<style>
	.category {
		margin-top: 10px;
		margin-bottom:20px;
	}
		
	.category .title {
		margin-bottom: 10px;
	    border-bottom: 1px solid #cac5c5;
	    height: 30px;
		text-indent:1em;
		font-size:18px;
		color:#666;
	}
	.category .items {
		margin-left:10px;
	}
	.category .items .item {
	    width: 230px;
	    height: 320px;
	    background: #ccc;
	    margin: 20px;
	    float: left;
	    margin-right:20px;
	    cursor:pointer;
	}
	
	.category .items .item div {
		text-align:center;
	}
	
	.item-banner {
		background: #666;
	    color: #FFF;
	}
	
	.item-header {
		font-size: 12px;
	    line-height: 52px;
	}
	
	.item-name {
	    font-size: 22px;
	    line-height: 74px;
	       white-space:nowrap;
	       overflow:hidden;
	       text-overflow: ellipsis;	
	}
	
	.item-author {
	    font-size: 14px;
	    text-indent: 7em;
	    padding-bottom: 70px;
	}
	
	.item-description {
		background: #eee;
	    height: 104px;
	    line-height: 76px;
	    text-indent: 3em;
	    font-size: 12px;
	    magin-bottom:12px;
	}
</style>
</head>

<body>
<!-- 头部页面 -->
<%@include file="common/header.jsp" %>	
	
	<!-- 轮播图 -->
	<div class="banner">
		<div class='content'>
			<!-- 图片列表 -->	
			<ul>
			<li class='fl'>
				<a href="javascript.void(0)">
					<img src="${basePath}/static/img/5.png"/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/1.png"/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/2.png"/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/3.png"/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/4.png"/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript:void(0)">
					<img src="${basePath}/static/img/5.png"/>
				</a>
			</li>
			<li class='fl'>
				<a href="javascript.void(0)">
					<img  src="${basePath}/static/img/1.png"/>
				</a>
			</li>
		</ul>
		<!-- 按钮区 -->
		<span class='banner_left'><i class='btn_left'></i></span>
		<span class='banner_right'><i class='btn_right'></i></span>
		</div>
	</div>
	
<!-- 内容区域（待做） -->
<div  style='border:1px solid #ccc'>
	<% //查询出连载小说类的相关文章
		List<Map<String,Object>> articles1 = articleService.getArticlesByCategoryId(1, 0, 6);
		pageContext.setAttribute("articles1", articles1);
	%>
	
	<div class='category'>
		<div class='title'>连载小说</div>
		<ul class='items'>
			<c:forEach items="${articles1}" var="item">
				<li class='item' onclick="detail('${item.id}')">
					<div class='item-banner'>
						<div class='item-header'>${item.header}</div>
						<div class='item-name' title = "${item.name}">${item.name}</div>
						<div class='item-author'>@${item.author} 著</div>
					</div>
					<div class='item-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	<% //查询出编程代码类的相关文章
		List<Map<String,Object>> articles2 = articleService.getArticlesByCategoryId(2, 0, 6);
		pageContext.setAttribute("articles2", articles2);
	%>
	
	<div class='category'>
		<div class='title'>编程代码类</div>
		<ul class='items'>
			<c:forEach items="${articles2}" var="item">
				<li class='item' onclick="detail('${item.id}')">
					<div class='item-banner'>
						<div class='item-header'>${item.header}</div>
						<div class='item-name' title = "${item.name}">${item.name}</div>
						<div class='item-author'>@${item.author} 著</div>
					</div>
					<div class='item-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<% //查询出干货分享的相关文章
		List<Map<String,Object>> articles3 = articleService.getArticlesByCategoryId(3, 0, 6);
		pageContext.setAttribute("articles3", articles3);
	%>
	
	<div class='category'>
		<div class='title'>干货分享</div>
		<ul class='items'>
			<c:forEach items="${articles3}" var="item">
				<li class='item' onclick="detail('${item.id}')">
					<div class='item-banner'>
						<div class='item-header'>${item.header}</div>
						<div class='item-name' title = "${item.name}">${item.name}</div>
						<div class='item-author'>@${item.author} 著</div>
					</div>
					<div class='item-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
</div>


<!-- 尾部页面 -->	
<%@include file="common/footer.jsp" %>
	
	<script>
		var leftBtn =$('.btn_left').eq(0);
		var rightBtn = $('.btn_right').eq(0);
		var ul = $('.banner .content ul').eq(0);
		var index=0;
		var imgwidth = $('.banner .content ul li').width();
		var len = $('.banner .content ul li').length -2;
		
		var timer =null;
		//图片移动函数，当index=len时回复到初始位置，当index=-1时跳转到末端位置
		var timers =null;

		
		function movePicture(){
		    $('.banner .content ul').animate({'margin-left':-imgwidth * (index+1)},1000,function(){
		        if(index == len){
		            $(this).css('margin-left',-imgwidth);
		            index = 0;
		        }
		        if(index == -1){
		            $(this).css('margin-left',-imgwidth * len);
		            index = len - 1;
		        }
		    });
		}
		leftBtn.on('click',function(){ 
			clearTimeout(timer);
			//设置定时器，在500毫秒后函数才能生效
			timer = setTimeout(function(){
				index--;
				movePicture();
				},500)
			
		});
		rightBtn.on('click',function(){
			clearTimeout(timer);
			timer = setTimeout(function(){
				index++;
				movePicture();
			},500);
			
		})
		
		//用于从首页跳入详情页
		function detail(id){
			var a = document.createElement("a");
			a.href ="detail.jsp?id="+id;
			a.target = '_new'; //新建窗口
			a.click();        //设置点击事件
		}
	</script>
	
</body>
	
</html>