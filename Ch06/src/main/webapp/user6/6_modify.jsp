<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="vo.User2VO"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String uid =request.getParameter("uid");
%>
	


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::modify</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
		$(function(){
			
			
			
			$.get("./6_getUser.jsp?uid=<%=uid%>",function(data){
				console.log(data);
				
				$('input[name=uid]').val(data.uid);
				$('input[name=name]').val(data.name);
				$('input[name=hp]').val(data.hp);
				$('input[name=age]').val(data.age);
				
				
			});
			
			$('input[type=submit]').click(function(e){
				e.preventDefault();
				
				//수정데이터 가져오기
				const uid = $('input[name=uid]').val();
				const name = $('input[name=name]').val();
				const hp = $('input[name=hp]').val();
				const age = $('input[name=age]').val();
				
				//JSON 생성
				const jsonData={
						"uid" : uid,
						"name" : name,
						"hp" : hp,
						"age" : age,
				};
				
				console.log(jsonData);
				
				$.post('./6_modifyProc.jsp',jsonData,function(data){
					if(data.result>=1){
						alert('데이터가 수정되었습니다')
						location.href ='./6_list.jsp'
					}else{
						alert('데이터가 수정실패했습니다')
					}
				});
				
			});
			
			
		})
	
	</script>
	
	</head>
	<body>
		<h3>User6 수정</h3>
		<a href ="/Ch06/1_JDBC.jsp">처음으로</a>		
		<a href ="/Ch06/user6/6_list.jsp">User6목록</a>
		<form action="#" method="post"><!-- 경로가 중간에 src 등이 빠지는 이유는 실제 이프로젝트가 구동되고 있는폴더에서는 webapp으로 가기때문에-->
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" readonly ></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" ></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" ></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정"></td>
			</tr>
		

		</table>
		</form>
	</body>
</html>