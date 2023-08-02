<%@page import="vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");	

	String bcode =request.getParameter("bcode");
	String bname =request.getParameter("bname");
	String type =request.getParameter("type");
	String bautor =request.getParameter("autor");
	String bmcom = request.getParameter("bmcom");
	String bdate = request.getParameter("bdate");

	List<BookVO> bkvo = new ArrayList<>();
	
	try{
		Context initCtx= new InitialContext();
		Context ctx=(Context)initCtx.lookup("java:comp/env");
		
		DataSource ds=(DataSource)ctx.lookup("jdbc/userdb");
		Connection conn=ds.getConnection();
		
		Statement stmt=conn.createStatement();
		ResultSet rs =stmt.executeQuery("SELECT * FROM `booklist`");

		while(rs.next()){
			BookVO vo = new BookVO();
			vo.setBcode(rs.getString(1));
			vo.setBname(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setAutor(rs.getString(4));
			vo.setBmcom(rs.getString(5));
			vo.setBdate(rs.getString(6));
		
			bkvo.add(vo);
		}
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	


%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_booklist</title>
	</head>
	<body>
	
		<a href="/Procject1/1_book.jsp">처음화면으로</a>
		<a href="/Procject1/1_book/1_bookRegister.jsp">도서등록</a>
			<table border="1">
				<tr>
					<th></th>
				</tr>
			</table>

		
	</body>
</html>