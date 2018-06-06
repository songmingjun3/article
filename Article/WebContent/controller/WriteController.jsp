<%@page import="com.sun.glass.ui.Pixels.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.Article"%>
<%@page import="service.ArticleService"%>
<%@page import="bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("user");
	if(user==null){
		out.print("-1");
			return;
	}
	out.print("1");
	String header = request.getParameter("header").toString();
	String name = request.getParameter("name").toString();
	int categoryId =Integer.parseInt(request.getParameter("category"));
	String content =request.getParameter("content").toString();
	String description =request.getParameter("description").toString();
	ArticleService articleService = new ArticleService();
	/*将数据封装成article类*/
	String articleId= UUID.randomUUID().toString();
	Article article=new Article();
	article.setId(articleId);
	article.setAuthor(user.getUsername());
	article.setUserId(user.getId());
	article.setHeader(header);
	article.setName(name);
	article.setDescription(description);
	article.setContent(content);
	article.setCategoryId(categoryId);
	article.setIsPublished(1);
	article.setIsDelete(0);
	Date createTime = new Date();
	article.setCreateTime(createTime);
	/*写入都数据库*/
	articleService.addArticle(article);
%>