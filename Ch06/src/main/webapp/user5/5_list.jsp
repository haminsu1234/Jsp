<%@page import="vo.User5VO"%>
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

	List<User5VO> users5 =new ArrayList<>();

	try{

		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection(host,user,pass);
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("SELECT * FROM `user5`");
		
		
		
		while(rs.next()){
			User5VO vo= new User5VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setDate(rs.getString(3));
			vo.setGender(rs.getInt(4));
			vo.setAge(rs.getInt(5));
			vo.setAddr(rs.getString(6));
			vo.setHp(rs.getString(7));
			
			users5.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}





%>
				<script type="text/javascript">
				
				function test(){
					
					if(confirm('삭제하시겠습니까?')){
						href="/Ch06/user5/5_delete.jsp?uid=< uservo.getUid() "
					} else {
						alter("삭제가 취소되었습니다")
					}
				}

			
				</script>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
	</head>
	<body>
		<h3>User5 목록</h3>
		
		<a href ="/Ch06/1_JDBC.jsp">처음으로</a>		
		<a href ="/Ch06/user5/5_register.jsp">User5등록</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<%for(User5VO uservo : users5){ %>	
			<tr>
				
				<td><%= uservo.getUid()  %></td>
				<td><%= uservo.getName()  %></td>
				<td><%= uservo.getDate()  %></td>
				<td><%= uservo.getGender()  %></td>
				<td><%= uservo.getAge()  %></td>
				<td><%= uservo.getAddr()  %></td>
				<td><%= uservo.getHp()  %></td>
				<td>
				<a href="/Ch06/user5/5_modify.jsp?uid=<%= uservo.getUid() %>">수정</a>
				<a onclick =test()>삭제</a>
				
				
				<!--  <a onclick="confirm('삭제하시겠습니까?')" href="/Ch06/user5/5_delete.jsp?uid=<%= uservo.getUid() %>" >
					삭제
				</a>
				-->
				</td>
			
			</tr>
			<%} %>
		
		</table>
		
		
		
	</body>
</html>