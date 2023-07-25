<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4_application</title>
			<!-- 
			날짜:2023/07/24
			이름 : 하민수
			내용 : JSP application 내장객체 실습하기
			
			application
			현재 웹 애플리케이션을 실행하는 WAS(톰캣)의 환경 객체
			서버 환경값(Context)를 설정하고 참조 로그작업 지원
			
		 -->
	</head>
	<body>
		<h3>4.application 내장객체</h3>	
	
		<h4>서버정보</h4>
		<%= application.getServerInfo() %><!-- 서버관련 정보 -->
		
		<h4>파라미터정보</h4>
		<%  
		String value1=application.getInitParameter("PARAM1"); 
		String value2=application.getInitParameter("PARAM2"); 
		
		
		%>
		
		<p>
			value : <%= value1 %><br>
			value : <%= value2 %><br>
			
		</p>
		
		
		<h4>로그정보</h4>
		<%
			application.log("로그기록");
		
		%>
		
		
		
		
		<h4>자원경로</h4>
		<%= application.getRealPath("./4_application.jsp") %>
		<!-- 실행경로랑 개발경로랑은 다름 -->
		
	
	</body>
	
	
</html>