<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid =request.getParameter("uid");
	String pass =request.getParameter("pass");
	String success=null;
	//사용자 db 조회
	UserDTO vo= UserDAO.getInstance().selectUser(uid, pass);
	
	//회원여부확인
	if(vo!=null){
		//사용자 세션 저장
		session.setAttribute("sessUser", vo);
		//리다이렉트
		response.sendRedirect("/Jboard1/list.jsp");
	}else{
		//리다이렉트 (로그인 실패시)
		success="100";
		response.sendRedirect("/Jboard1/user/login.jsp?success=100");
	}
	


%>