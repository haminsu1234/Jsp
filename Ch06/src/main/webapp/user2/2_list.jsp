<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.User2VO"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");

	List<User2VO> user2=new ArrayList<>();
	
	User2VO vo =null;
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("jdbc:comp/env");
		
		DataSource ds= (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn =ds.getConnection();
		
		
		Statement stmt =conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `USER2`");
		
		while(rs.next()){
			
			vo=new User2VO();
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



%>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>User2목록</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user2/2_register.jsp">User2등록</a>
		<form>
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>나이</th>
					<th>관리</th>
				</tr>
				
				<%for(User2VO users2vo : user2){ %>
				<tr>
					<td><%=users2vo.getUid() %></td>
					<td><%=users2vo.getName() %></td>
					<td><%=users2vo.getHp() %></td>
					<td><%=users2vo.getAge() %></td>				
					<td>

						<a href="/Ch06/user2/2_modify.jsp">수정</a>
						<a href="/Ch06/user2/2_delete.jsp">삭제</a>
					
					</td>				
				</tr>
				<% } %>
				
				
			</table>
		
		
		</form>
	</body>
</html>