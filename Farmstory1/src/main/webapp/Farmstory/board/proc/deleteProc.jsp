<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no =request.getParameter("no");
	String group =request.getParameter("group");
	String cate =request.getParameter("cate");

	
	ArticleDTO dto =new ArticleDTO();
	dto.setNo(no);
	
	ArticleDAO dao = new ArticleDAO();
	dao.deleteArticle(dto);
	
	response.sendRedirect("/Farmstory1/Farmstory/board/list.jsp?group="+group+"&cate="+cate);

%>