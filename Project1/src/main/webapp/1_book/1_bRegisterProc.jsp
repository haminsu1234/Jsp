<%@page import="java.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
		Context initCtx = new InitialContext();
		Context ctx= (Context)initCtx.lookup("java:comp/env");
		Connection conn=(Connection)ctx.lookup("jdbc/userdb");
		PreparedStatement psmt =conn.prepareStatement("INSERT INTO VALUE(?,?,?,?,?,?)");
		psmt.setString(1,bcode);
		psmt.setString(2,bname );
		psmt.setString(3,btype);
		psmt.setString(4,bautor);
		psmt.setString(5,bmcom);
		psmt.setString(6,bdate);
		
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("/Project1/1_book/1_bookList.jsp");

%>