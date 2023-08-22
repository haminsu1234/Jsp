<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_표현언어 내장객체</title>
		<!-- 
			날짜 : 2023/08/22
			이름 : 하민수
			내용 : JSP 표현언어 내장객체 실습
		 -->
	</head>
	<body>
		<h3>2표현언어 내장객체</h3>
		<%
		
			pageContext.setAttribute("name", "김유신");	
			request.setAttribute("name", "김춘추");	
			session.setAttribute("name", "강감찬");	
			application.setAttribute("name", "장보고");	
		
		%>
		<p> <!--  스코프 없이 표현언어를 쓰면 이거다 pageContext로 나옴  
				 각 내장객체별로 Scope가 대응댐
				-->
			pageScope name : ${pageScope.name}<br>
			requestScope name : ${requestScope.name }<br>
			sessiontScope name : ${sessionScope.name }<br>
			applicationScope name : ${applicationScope.name }
					
		
		</p>
		
		
		
		
		
		
		
		
		
	</body>
</html>