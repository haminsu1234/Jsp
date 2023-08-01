<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");


	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	int result=0;
	try{
		//Class.forName("com.mysql.cj.jdbc.Driver");
		//Connection conn=DriverManager.getConnection(host, user, pass);
		
		//JNDI 서비스 객체 생성
		//context 개발환경
		Context initCtx = new InitialContext();
		Context ctx=(Context) initCtx.lookup("java:comp/env");//jndi 기본 환경 이름 
		
		//커넥션 풀에서 커넥션 가저오기
		DataSource ds =(DataSource)ctx.lookup("jdbc/userdb");
		Connection conn=ds.getConnection();
		
		
		PreparedStatement psmt =conn.prepareStatement("INSERT INTO `user6` VALUES(?,?,?,?)");
		
		psmt.setString(1, uid);
		
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);

		result =psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	//response.sendRedirect("/Ch06/user6/6_list.jsp");
	String jsonData ="{\"result\":"+result+"}";
	out.print(jsonData);


%>