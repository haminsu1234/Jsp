<%@page import="vo.User4VO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//db처리
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234";

	List<User4VO> users4 =new ArrayList<>();

	try{

		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection(host,user,pass);
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("SELECT * FROM `user4`");
		
		
		
		while(rs.next()){
			User4VO vo= new User4VO();
			vo.setSeq(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setGender(rs.getInt(3));
			vo.setAge(rs.getInt(4));
			vo.setAddr(rs.getString(5));

			users4.add(vo);
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
		<title>user1::list</title>
	</head>
	<body>
		<h3>User4 목록</h3>
		
		<a href ="/Ch06/1_JDBC.jsp">처음으로</a>		
		<a href ="/Ch06/user4/4_register.jsp">User4등록</a>
		<table border="1">
			<tr>
				<th>등록순번</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<%for(User4VO uservo : users4){ %>	
			<tr>
				
				<td><%= uservo.getSeq()  %></td>
				<td><%= uservo.getName()  %></td>
				<td><%= uservo.getGender()  %></td>
				<td><%= uservo.getAge()  %></td>
				<td><%= uservo.getAddr()  %></td>
				<td>
					<a href="/Ch06/user4/4_modify.jsp?seq=<%= uservo.getSeq() %>">수정</a>
					<a onclick="confirm('삭제하시겠습니까?')" href="/Ch06/user4/4_delete.jsp?seq=<%= uservo.getSeq() %>" >
					삭제
					</a>

				</td>
			</tr>
			<%} %>
		
		</table>
		
		
		
	</body>
</html>