<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_Loop</title>
		<!-- 
			날짜:2023/07/24
			이름 : 하민수
			내용 : JSP 스크립트릿 반복문 실습하기
		 -->
	</head>
	<body>
		<h3>3_Loop</h3>
		
		<h4>for</h4>
		<%
			for(int i =1; i<=3 ; i++){
				out.println("<p> i : "+i+"</p>");
			}

		%>
		<%for(int i =1 ; i<=3; i++){ %>
			<p>i : <%=i %></p>
		<% } %>

		<h4>while</h4>
		<%
			int j =1;
			while(j<=3){
		
		%>
			<p> j : <%=j %></p>
		
		<% 	j++; } %>
		<h4>구구단</h4>
		<table border="1">
			<tr>
				<th>2단</th>
				<th>3단</th>
				<th>4단</th>
				<th>5단</th>
				<th>6단</th>
				<th>7단</th>
				<th>8단</th>
				<th>9단</th>
			
			</tr>
			<% for(int i=1; i<=9; i++) { %>
			<tr>
				<% for (int k=2;k<=9 ; k++) {
				%>
				<td>
					<% out.println(k+" x "+i+" = "+(i*k)); %>
				</td>			
				<% }%>
			</tr>
			<% } %>
			<tr>

			</tr>
		
		
		
		</table>
		
		
	</body>
</html>