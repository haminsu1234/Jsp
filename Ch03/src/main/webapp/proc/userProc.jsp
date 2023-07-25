<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid=request.getParameter("uid");//파리미터 이름을 끌고오는데 request에서의 name 속성
	String name =request.getParameter("name");
	String age =request.getParameter("age");

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>userProc</title><!--  request에서 받은 정보(데이터)를 여기로 전송함  
									requsest 에서 3개의 정보를 전송했으므로 여기서도 3개를 수신받아야함
									따지자면 request는 프론트 여기는 백
									requset객체는 클라이언트에서 서버로 정보를 전송할때 사용
									http://localhost:8080(url)/Ch03/proc/userProc.jsp?(uri)uid=3&name=4&age=5(parameter queryString)(get 방식)
									이게 데이터 전송받는곳의 주소 jsp? 뒤에는 전송받은 데이터 표시해주는듯?
									 -->
	</head>
	<body>
		<h3>사용자 데이터 수신</h3>
		<p>
			아이디 : <%= uid %><br>
			이름 : <%= name %><br>
			나이 : <%= age %><br>
			
			
		</p>
		
		<a href ="../1_request.jsp">뒤로가기</a>
		
		
		
		
	</body>
</html>