<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%out.println("<script>alter(삭제완료)</script>"); %>
<% 
	request.setCharacterEncoding("UTF-8");
	//전송데이터 수신
	String seq = request.getParameter("seq");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age"); 
	String addr = request.getParameter("addr"); 
	
	//데이터베이스 처리
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234"; //계정정보 하드코딩 x 
	

	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection(host,user,pass);
		PreparedStatement psmt =conn.prepareStatement("Delete from `user4` where seq=?");
		
		psmt.setString(1, seq);

		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Ch06/user4/4_list.jsp");

%>
