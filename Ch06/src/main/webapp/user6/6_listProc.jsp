<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.*"%>
<%@page import="vo.User2VO"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");

	List<User2VO> user2=new ArrayList<>();
	

	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds= (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn =ds.getConnection();
		
		
		Statement stmt =conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `USER6`");
		
		while(rs.next()){
			
			User2VO vo=new User2VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getInt(4));
			
			user2.add(vo);
			
		}
		rs.close();
		stmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	Gson gson = new Gson();
	String jsonData=gson.toJson(user2);
	
	out.print(jsonData);
	
	
	
	
	
	

%>
