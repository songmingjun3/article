<%@page import="service.CommentService"%>
<%@page import="bean.Comment"%>
<%@ page import="bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	User user =(User) session.getAttribute("user");
	if(user==null){
		out.print("-1");
		return;
	}
	out.print("1");	
	String txt=request.getParameter("txt").toString();
	String articleId = request.getParameter("articleId").toString();
	
	CommentService commentService =new CommentService();
	Comment comment =new Comment();
	comment.setId(UUID.randomUUID().toString());
	comment.setUserId(user.getId());
	comment.setContent(txt);
	comment.setArticleId(articleId);
	commentService.saveComment(comment);
%>