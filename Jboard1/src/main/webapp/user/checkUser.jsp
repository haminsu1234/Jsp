<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String nick = request.getParameter("nick");
	String hp = request.getParameter("hp");
	String email = request.getParameter("email");
	
	
	
	
	int result = UserDAO.getInstance().selectCountUid(uid);
	int result2 = UserDAO.getInstance().selectCountNick(nick);
	int result3 =UserDAO.getInstance().selectCountHp(hp);
	int result4 =UserDAO.getInstance().selectCountEmail(email);
	
	
	
	// Json 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	json.addProperty("result2", result2);
	json.addProperty("result3", result3);
	json.addProperty("result4", result4);
	
	// Json 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>