<%@page import="javax.naming.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");	

	String bcode =request.getParameter("bcode");
	String bname =request.getParameter("bname");
	String btype =request.getParameter("btype");
	String bautor =request.getParameter("bautor");
	String bmcom = request.getParameter("bmcom");
	String bdate = request.getParameter("bdate");

	try{
		Context initCtx= new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");
		
		
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	


%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_booklist</title>
	</head>
	<body>
		
	</body>
</html>