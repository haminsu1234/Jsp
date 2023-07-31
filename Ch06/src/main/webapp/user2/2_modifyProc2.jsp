<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");


	try{

		Context initCtx = new InitialContext();
		Context ctx=(Context)initCtx.lookup("jdbc:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn =ds.getConnection();
		
		
		PreparedStatement psmt =conn.prepareStatement("UPDATE FROM `USER2` SET NAME=?,HP=?,AGE=? WHERE UID=?");		
		
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, age);
		psmt.setString(4, uid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("/Ch06/user2/2_list.jsp");




%>