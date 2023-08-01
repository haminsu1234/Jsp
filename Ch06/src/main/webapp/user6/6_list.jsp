<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.User2VO"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script>
		
			$(function(){
				//문서로딩이 끝나고 바로 ajax요청
				$.ajax({
					
					url:'./6_listProc.jsp',
					type:'GET',
					dataType:'json',
					success:function(data){
						for(let user of data){
							console.log(user.uid)
							let tr =`<tr>
										<td>\${user.uid}</td>//표현식 //jQuery 식벌자와 충돌나서 \붙여서 사용
										<td>\${user.name}</td>//표현식
										<td>\${user.hp}</td>//표현식
										<td>\${user.age}</td>//표현식
										<td>
											<a href='./6_modify.jsp?uid=\${user.uid}'}>수정</a>
											<a href='./6_delete.jsp?uid=\${user.uid}'}>삭제</a>
										</td>//표현식
									</tr>`;
									
							$('table').append(tr);
						}
						
					}
					
				})
				
			});
		
		</script>
		
		
	</head>
	<body>
		<h3>User6목록</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user6/6_register.jsp">User6등록</a>
		<form>
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>나이</th>
					<th>관리</th>
				</tr>

			</table>
		
		
		</form>
	</body>
</html>