<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" errorPage="./error/404.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>6_exception</title>
		<!-- 
			날짜:2023/07/24
			이름 : 하민수
			내용 : JSP application 내장객체 실습하기
			
			exception
			-JSP예외가 발생했을 때 예외를 처리하기위한 내장객체
			-직접적으로 exception 객체를 통해 에러코드별 에러 페이지 작성
			
			주요응답코드
			200 : 요청성공
			3xx : 리다이렉트
			404 : 페이지 없음
			500 : 서버 내부 에러
					

			
		 -->
	</head>
	<body>
		<h3> 6.exception</h3>

		<a href="./sample.jsp">404에러</a>
		<a href="./exception.jsp">500에러</a>



	</body>
</html>