<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
	<center>
		<h1>로그인 인사</h1>
		<img src="image/123123123.png" width="100" heigh="80">
		<hr>
		<form action="loginProcess" method="get">
			<table border ="orange" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange">아이디</td>
					<td><input type="text" name="id"/></td>
				</tr>
				<tr>
					<td bgcolor="orange">비밀번호</td>
					<td><input type="text" name="pass"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="로그인"/>
					</td>
				</tr>
			</table>
		</form>
		<br>
		<a href="insertUser.html">회원가입</a>
	<hr>
	</center>		
	</body>
</html>