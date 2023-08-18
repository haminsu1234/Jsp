<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String writer =request.getParameter("writer");
	String cate =request.getParameter("cate");
	String title =request.getParameter("title");
	String content =request.getParameter("content");
	String file =request.getParameter("file");
	String group =request.getParameter("group");
	String regip =request.getRemoteAddr();
	
	ArticleDTO dto =new ArticleDTO();
	
	
	dto.setTitle(title);
	dto.setCate(cate);
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setRegip(regip);
	
	ArticleDAO dao =new ArticleDAO();
	dao.insertArticle(dto);
	
	response.sendRedirect("/Farmstory1/Farmstory/board/list.jsp?group="+group+"&cate="+cate);
%>