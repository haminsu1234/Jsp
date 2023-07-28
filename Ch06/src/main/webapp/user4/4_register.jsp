<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::resgister</title>
	</head>
	<body>
		<h3>User4 등록</h3>
		<a href ="/Ch06/1_JDBC.jsp">처음으로</a>		
		<a href ="/Ch06/user4/4_list.jsp">User4목록</a>
		<form action="/Ch06/user4/4_registerProc.jsp" method="post"><!-- 경로가 중간에 src 등이 빠지는 이유는 실제 이프로젝트가 구동되고 있는폴더에서는 webapp으로 가기때문에-->
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
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
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="number" name="addr"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="등록"></td>
			</tr>
		

		</table>
		</form>
	</body>
</html>