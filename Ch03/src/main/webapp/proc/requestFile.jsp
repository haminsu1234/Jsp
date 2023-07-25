<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>requestFile</title>
	</head>
	<body>
		<h3>requestFile</h3>
		<%
			//해당페이지를 파일 다운로드로 응답
			response.setHeader("Content-Type","application/octet-stream"); //이렇게하면 파일다운로드 기능을 구현한것 많이 쓸것같은데?
		
		
		
		%>
		
	</body>
</html>