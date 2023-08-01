<%@page import="com.google.gson.Gson"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="vo.User2VO"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");	

String uid=request.getParameter("uid");
String name =request.getParameter("name");
String hp =request.getParameter("hp");
String age =request.getParameter("age");



User2VO user =new User2VO();
try{
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
	Connection conn =ds.getConnection();
	
	
	

	PreparedStatement psmt =conn.prepareStatement("SELECT * FROM `USER6` WHERE UID =? ");
	psmt.setString(1, uid);
	
	ResultSet rs =psmt.executeQuery();
	
	
	
	if(rs.next()){
		user=new User2VO();
		user.setUid(rs.getString(1));
		user.setName(rs.getString(2));
		user.setHp(rs.getString(3));
		user.setAge(rs.getInt(4));
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	
}catch(Exception e){
	e.printStackTrace();
}

	Gson gson = new Gson();
	String jsonData=gson.toJson(user);
	
	out.print(jsonData);

%>
