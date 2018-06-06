<%@ page language="java" import="java.util.*,service.LoginService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

    //设置请求的编码
    //request.setCharacterEncoding("UTF-8");
    //获取客户端传递过来参数
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
    	out.print("-1"); //错误代码-1，用户和密码不能为空，错误代码传递给login.jsp
    }else{
    	LoginService  loginService = new LoginService();
    	User user = loginService.getUser(username);
    	if(user==null){
    		out.print("-2");  //错误代码-2，用户不存在
    	}else{
    		if(!username.equals(user.getUsername())||!password.equals(user.getPassword())){
    			out.print("-3"); //错误代码-3，用户名或者密码错误
    		}else{//用户存在且密码正确，把user放在session中
    			out.print("1");
    			session.setAttribute("user", user);
    			session.setAttribute("username", user.getUsername());
    		}
    	}
    }
    //如果用户名和密码不为空
    
%>