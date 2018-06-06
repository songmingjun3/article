<%@ page language="java" import="java.util.*"   pageEncoding="UTF-8"%>
<% 
	session.removeAttribute("username");
	//session.removeAttribut("user")  //不用删除user?
	session.invalidate();    //关闭session
	String path = request.getContextPath();
	//System.out.println(path);
	int port = request.getServerPort();
	String basePath = null;
	if(port == 80 ){
		basePath = request.getScheme()+"://"+request.getServerName()+path;
		//System.out.println(basePath);
	}else{
		basePath = request.getScheme()+"://"+request.getServerName()+":"
				+request.getServerPort()+path;
		//System.out.println(basePath);
	}
	response.sendRedirect(basePath+"/index.jsp");
%>