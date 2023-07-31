<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.User2VO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<User2VO> user2 = new ArrayList<>();



	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds= (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn =ds.getConnection();
		
		Statement stmt =conn.createStatement();
		ResultSet rs =stmt .executeQuery("SELECT * FROM `user2`");
		
		
		
		
		while(rs.next()){
			User2VO user = new User2VO();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setHp(rs.getString(3));
			user.setAge(rs.getInt(4));
			
			user2.add(user);

		}
		rs.close();
		stmt.close();
		conn.close();
		
		
		
		
	}catch(Exception e ){
		e.printStackTrace();
	}

	//json 출력(gson)
	Gson gson = new Gson();
	String jsonData=gson.toJson(user2);
	

	out.print(jsonData);

%>