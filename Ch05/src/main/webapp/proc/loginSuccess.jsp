<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id=(String) session.getAttribute("sessid");
	
	if(id ==null){
		response.sendRedirect("../2_Sessoin.jsp");
		return;
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		<p>
			<%= id %>님 반갑습니다 <br>
			<a href="./logout.jsp">로그아웃</a>
		</p>
	</body>
</html>