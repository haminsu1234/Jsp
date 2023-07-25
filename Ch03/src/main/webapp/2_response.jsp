<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_response</title>
		<!-- 
			날짜:2023/07/24
			이름 : 하민수
			내용 : JSP response 내장객체 실습하기
			
			response 내장객체
			클라이언트에서 서버로 요청한 결과를 응답해주는 객체
			서버에서 클라이언트로 전승 객체
			
			redirect
			서버에서 클라이언트로 다시 요청을 명령하는 response 기능
			최종 요청 주소가 반영 cf) forward 는 최초 요청주소가 반영
						

		 -->
	</head>
	<body>
		<h3>2.response</h3>
		
		<a href="./proc/redirect1.jsp">리다이렉트 페이지 요청1</a><!-- 여기서 redirect1로 값을 요청했는데 요청된값이 1request라서 1request로 다시 요청되서  1request값을 응답받음  -->
		<a href="./proc/redirect2.jsp">리다이렉트 페이지 요청2</a>
		<a href="./proc/requestFile.jsp">파일요청</a>
		
		
		
	</body>
</html>