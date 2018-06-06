<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.User"%>
<%@page import="service.RegisterService"%>
<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<% 
	RegisterService registerService =new RegisterService();
	User user = new User();
	String username=request.getParameter("username");
	int sex =Integer.parseInt(request.getParameter("sex").toString());
    String password = request.getParameter("password");
	String confirm = request.getParameter("confirm");
	String telephone = request.getParameter("telephone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	
	if(username==""|password==""|confirm=="")
		out.print("-1");
	else if(telephone=="")
		out.print("-2");
	else if(email=="")
		out.print("-3");
	else if(address=="")
		out.print("-4");
	else if(!password.equals(confirm))
		out.print("-5");
	else if(registerService.usernameExist(username))
		out.print("-6");
	else if(registerService.telephoneExist(telephone))
		out.print("-7");
	else if(registerService.emailExist(email))
		out.print("-8");
	else{
		out.print("1");
		/*System.out.println(username);
		System.out.println(password);
		System.out.println(sex);
		System.out.println(telephone);
		System.out.println(email);
		System.out.println(address);*/
		String createTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		UUID id =UUID.randomUUID();
		user.setId(id.toString());
		user.setUsername(username);
		user.setAddress(address);
		user.setCreateTime(createTime);
		user.setSex(sex);
		user.setPassword(password);
		user.setTelephone(telephone);
		user.setIsDelete(0);
		registerService.saveUser(user);
		
	}
%>