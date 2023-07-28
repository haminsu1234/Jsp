<%@page import="vo.User4VO"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String seq=request.getParameter("seq");
	String name =request.getParameter("name");
	String addr =request.getParameter("addr");
	String age =request.getParameter("age");
	String gender =request.getParameter("gender");

	
	String host = "jdbc:mysql://localhost:3306/userdb";
	String user = "root";
	String pass = "1234";
	User4VO vo =new User4VO();
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection(host,user,pass);
		PreparedStatement psmt =conn.prepareStatement("SELECT * FROM `USER4` WHERE SEQ =? ");
		psmt.setString(1, seq);
		
		ResultSet rs =psmt.executeQuery();
		
		
		
		if(rs.next()){
			
			vo.setSeq(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setGender(rs.getInt(3));
			vo.setAddr(rs.getString(4));
			vo.setAge(rs.getInt(5));
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
		<h3>User4 수정</h3>
		<a href ="/Ch06/1_JDBC.jsp">처음으로</a>		
		<a href ="/Ch06/user4/4_list.jsp">User4목록</a>
		<form action="/Ch06/user4/4_modifyProc.jsp" method="post"><!-- 경로가 중간에 src 등이 빠지는 이유는 실제 이프로젝트가 구동되고 있는폴더에서는 webapp으로 가기때문에-->
		<table border="1">
			<tr>
				<td>등록순번</td>
				<td><input type="text" name="seq" readonly="readonly" value=<%= vo.getSeq() %>></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"  value=<%=vo.getName() %>></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="gender" value=<%= vo.getGender() %>></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value=<%=vo.getAge() %>></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="number" name="addr" value=<%=vo.getAddr() %>></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정"></td>
			</tr>
		

		</table>
		</form>
	</body>
</html>