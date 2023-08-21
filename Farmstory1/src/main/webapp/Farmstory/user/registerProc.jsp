<%@page import="kr.farmstory1.dao.UserDAO"%>
<%@page import="kr.farmstory1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass1");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	UserDTO dto =new UserDTO();
	
	dto.setUid(uid);
	dto.setPass(pass);
	dto.setName(name);
<<<<<<< HEAD
	dto.setNick(nick);
=======
	dto.setNice(nick);
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
	dto.setEmail(email);
	dto.setHp(hp);
	dto.setZip(zip);
	dto.setAddr1(addr1);
	dto.setAddr2(addr2);
	dto.setRegip(regip);
	
	UserDAO.getInstance().insertUser(dto);
	
	response.sendRedirect("/Farmstory1/Farmstory/user/login.jsp");

%>
