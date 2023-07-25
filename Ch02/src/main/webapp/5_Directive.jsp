<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info="@ copyright haminsu.click" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_Directive</title>
		<!-- 
			날짜:2023/07/24
			이름 : 하민수
			내용 : JSP 지시자 실습하기
			
			지시자(Directive)
			JSP 페이지에 추가적인 정보를 설정하는 스크립트 문법
			스크립트릿, 표현식과 함꼐 JSP 기본구성요소
			page include taglib 지시자
		 -->
	</head>
	<body>
		<h3>5.지시자</h3>
		
		<h4>page 지시자</h4><!-- 선언 -->
		<p>
			page copyright : <%= getServletInfo() %> <!--  -->
		</p>
		
		
		<h4>include 지시자</h4><!-- 외부파일을 끌어와 쓰는듯? -->
		<%@ include file="./inc/_header.html" %>
		<%@ include file="./inc/_footer.html" %>
		
		
		
	</body>
</html>