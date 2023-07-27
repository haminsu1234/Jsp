<%@ page import="sub1.UserVo" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_session</title>
		<!-- 
			날짜:2023/07/24
			이름 : 하민수
			내용 : JSP application 내장객체 실습하기
			
			session
			session은  최초 요청 부터 마지막 요청까지의 전체시간 경과
			클라이언트에 대응되는 객체 (클라이언트별로 다른id값을가짐), 서버에 기록되는 클라이언트 고유번호(Session Table) 중복되지않음
			서버(WAS)는 각 클라이언트에 대한 고유식별번호(SID)를 자동으로 발급 			

			
		 -->
	</head>
	<body>
		<h3>5 session</h3>
		
		<h4> session ID 확인</h4><!-- 클라이언트(브라우저)끼리 다름  id값은 session 테이블에 기록됨 이걸로 클라이언트를 식별함-->
		<%= session.getId() %>
		
		<h4>session 설정</h4>
		<%
			UserVo user = new UserVo("a101","김유신","010-1234-1001",23) ;
			//session table에 user 컬럼명으로 user객체저장	
			session.setAttribute("userColumn", user);
		
			UserVo userVo =(UserVo)session.getAttribute("userColumn");
			
		
		
		%>
		<p>
			아이디 : <%= userVo.getUid() %><br>
			이름 : <%= userVo.getName() %><br>
			휴대폰 : <%= userVo.getHp() %><br>
			나이 : <%= userVo.getAge() %><br>
		</p>
		
		
	</body>
</html>