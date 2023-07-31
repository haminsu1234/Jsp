<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_bookRegister</title>
	</head>
	<body>
		<h3>도서등록</h3>
		<a href="/Procject1/1_book.jsp">처음화면으로</a>
		<a href="/Procject1/1_book/1_bookList.jsp">도서목록</a>
		<form action="/Procject1/1_book/1_bRegisterProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>책 고유번호</td>
					<td><input type="text" name="bcode" ></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="bname" ></td>
				</tr>				
				<tr>
					<td>장르</td>
					<td><input type="text" name="btype" ></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="text" name="bautor" ></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="bmcom" ></td>
				</tr>
				<tr>
					<td>출판일</td>
					<td><input type="date" name="bdate"></td>					
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
		
		
		
		
	</body>
</html>