<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_EL</title>
		<!-- 
			날짜 : 2023/08/22
			이름 : 하민수
			내용 : JSP 표현언어 실습
			
			표현언어(Expression Language)
			-MVC 패턴에 따라 JSP를 더욱 효율적으로 처리하기 위한 출력문법
			-JSP 내장객ㅊ를 이용해 표현언어로 출력
		 -->
	</head>
	<body>
		<h3>1. 표현언어 (Expression language)</h3>
		<%
			int num1=1;
			int num2=2;
			
			String str1 = "hello";
			String str2 = "welcome";
			
			//표현언어로 출력하기 위해 내장객체 영역에 저장
			pageContext.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			session.setAttribute("str1", str1);
			application.setAttribute("str2", str2);
		%>

		<h4>표현식</h4>
		<p>
			num1 : <%= num1 %><br>
			num2 : <%= num2 %><br>
			str1 : <%= str1 %><br>
			str21 : <%= str2 %><br>
		</p>
		
		<h4>표현언어</h4><!-- 표현언어를쓸려면 내장객체 영역에 setAttribute 에 값을 저장해준다음에 참조함 
							표현식은 직접참조 표현언어는 위의방식 
						
						
						-->
		<p>
			num1 : ${num1}<br>
			num2 : ${num2}<br>
			str1 : ${str1}<br>
			str21 : ${str2}<br>
		</p>
		
		
		
	</body>
</html>