<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_pageContext</title>
				<!-- 
			날짜:2023/07/24
			이름 : 하민수
			내용 : JSP page Context 내장객체 실습하기
			
			pageContext 
			요청에대한 최종대상 JSP 파일 객체
			JSP파일 하나당 하나의 pageContext 객체 생성
			주요기능은 페이지 흐름제어(include forward)기능제공
			
			forward 
			서버자원내에서(html, jsp,image 파일등등)페이지를 요청하는 기능
			최초요청에대한 주소 반영 cf)redirect 는 최종 요청에 대한 주소반영  //둘이 구분좀 잘해야할듯
			
		 -->
		
		
	</head>
	<body>
		<h3>3.pageContext 내장객체</h3>
		
		<h4>include</h4>
		<%
			pageContext.include("./inc/_header.html");//지시자로 해도됨 그냥 선택사항 상황에맞게쓰면됨
			pageContext.include("./inc/_footer.html");
		
		%>
		
		<h4>forward</h4>
		<a href="./proc/forward1.jsp">포워드 페이지 요청1</a> <!-- 주소는 이객체를 요청한 주소 -->
		<a href="./proc/forward2.jsp">포워드 페이지 요청2</a>
		
	</body>
</html>