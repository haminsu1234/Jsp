<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");


	String group =request.getParameter("group");
	String cate =request.getParameter("cate");
	String writer =request.getParameter("writer");
	String content =request.getParameter("content");
	String parent =request.getParameter("parent");
	String regip =request.getRemoteAddr();
	
	
	ArticleDTO dto =new ArticleDTO();
	dto.setParent(parent);
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setRegip(regip);
	
	ArticleDAO dao =new ArticleDAO();
	dao.insertComment(dto);
	
	response.sendRedirect("/Farmstory1/Farmstory/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);

	
	
	
%>