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
		<a href ="/Ch06/user6/6_list.jsp">User6목록</a>
		<form action="/Ch06/user6/6_registerProc.jsp" method="post"><!-- 경로가 중간에 src 등이 빠지는 이유는 실제 이프로젝트가 구동되고 있는폴더에서는 webapp으로 가기때문에-->
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name="pos">
						<option value="부장">부장</option>
						<option value="차장">차장</option>
						<option value="과장">과장</option>
						<option value="대리">대리</option>
						<option value="사원">사원</option>
					</select>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="dep">
						<option value="영업1부">영업1부</option>
						<option value="영업2부">영업2부</option>
						<option value="영업3부">영업3부</option>
						<option value="영업4부">영업4부</option>
						<option value="영업5부">영업5부</option>
						<option value="영업지원부">영업지원부</option>
						<option value="인사부">인사부</option>
					</select>
			</tr>
			
		
			<tr>
				<td colspan="2" align="right"><input type="submit" value="등록"></td>
			</tr>
		

		</table>
		</form>
	</body>
</html>