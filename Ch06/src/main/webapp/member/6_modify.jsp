<%@page import="vo.User5VO"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

String uid = request.getParameter("uid");
String name = request.getParameter("name");
String date = request.getParameter("date");
String gender = request.getParameter("gender");
String age = request.getParameter("age");
String addr = request.getParameter("addr"); 
String hp = request.getParameter("hp"); 

	
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234";
	User5VO vo =new User5VO();
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection(host,user,pass);
		PreparedStatement psmt =conn.prepareStatement("SELECT * FROM `USER5` WHERE UID =? ");
		psmt.setString(1, uid);
		
		ResultSet rs =psmt.executeQuery();
		
		
		
		if(rs.next()){
			
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setDate(rs.getString(3));
			vo.setGender(rs.getInt(4));
			vo.setAge(rs.getInt(5));
			vo.setAddr(rs.getString(6));
			vo.setHp(rs.getString(7));
			
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::modify</title>
	</head>
	<body>
		<h3>User5 수정</h3>
		<a href ="/Ch06/1_JDBC.jsp">처음으로</a>		
		<a href ="/Ch06/user5/5_list.jsp">User5목록</a>
		<form action="/Ch06/user5/5_modifyProc.jsp" method="post"><!-- 경로가 중간에 src 등이 빠지는 이유는 실제 이프로젝트가 구동되고 있는폴더에서는 webapp으로 가기때문에-->
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" readonly name="uid" value=<%= vo.getUid() %>></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"value=<%= vo.getName() %>></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="date"value=<%= vo.getDate() %>></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="1">남자</label>
					<label><input type="radio" name="gender" value="2">여자</label>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"value=<%= vo.getAge() %>></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"value=<%= vo.getAddr() %>></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp"value=<%= vo.getHp() %>></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정"></td>
			</tr>
		
		

		</table>
		</form>
	</body>
</html>