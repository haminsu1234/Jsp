<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String success=request.getParameter("success");
	session.invalidate();
	

	response.sendRedirect("/Jboard1/user/login.jsp");

	

%>