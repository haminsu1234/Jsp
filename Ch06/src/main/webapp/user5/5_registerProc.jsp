<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	//전송데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String date = request.getParameter("date");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr"); 
	String hp = request.getParameter("hp"); 
	
	//데이터베이스 처리
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234"; //계정정보 하드코딩 x 
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection(host,user,pass);
		
		PreparedStatement psmt =conn.prepareStatement("INSERT INTO `user5` VALUES (?,?,?,?,?,?,?)");
		
		psmt.setString(1,uid);
		psmt.setString(2,name);
		psmt.setString(3,date);
		psmt.setString(4,gender);
		psmt.setString(5,age);
		psmt.setString(6,addr);// 전송데이터가 문자열로 넘어오기때문에 db상에서 int컬럼이여도 string으로 받음 어짜피 문자열 23이나 숫자 23이나 똑같음...
		psmt.setString(7,hp);
		
		psmt.executeUpdate();
		
		psmt.close();
		
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("/Ch06/user5/5_list.jsp");

%>
