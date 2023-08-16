<%@page import="javax.websocket.SendResult"%>
<%@page import="kr.farmstory1.dao.UserDAO"%>
<%@page import="kr.farmstory1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String uid =request.getParameter("uid");
	String pass =request.getParameter("pass");
	

	UserDTO dto = UserDAO.getInstance().selectUser(uid, pass);
	
	if (dto != null){
		session.setAttribute("sessUser", dto);
		response.sendRedirect("/Farmstory1/Farmstory/index.jsp");
		
		
	}else {
		response.sendRedirect("/Farmstory1/Farmstory/user/login.jsp");
	}





%>