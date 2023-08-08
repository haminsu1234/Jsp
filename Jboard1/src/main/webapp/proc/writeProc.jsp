<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	UserDTO sessUser	=(UserDTO)session.getAttribute("sessUser");
	
	
	
	String title =request.getParameter("title");
	String content =request.getParameter("content");
	//String writer =request.getParameter("writer"); 
	//어짜피 sessUser에도 writer가 있기에 session을 받아서 하거나 직접 파라미터를 받아서하거나
	//이미 사용되고 있는 정보를 활요하면 좋을것같아서 session에서 받아서함
	String regip =request.getRemoteAddr();

	
	
	ArticleDTO vo = new ArticleDTO(); //article 객체선언
	vo.setTitle(title);
	vo.setContent(content);
	vo.setWriter(sessUser.getUid()); //ssesion에있는 uid를 받아서 writer에저장
	vo.setRegip(regip);
	
	
	ArticleDAO dao = new ArticleDAO();
	dao.insertArticle(vo);//Article객체는 싱글톤으로 안함 register 같은경우 로그인/회원가입시에만 사용하기에 
	//그렇게 많은일을 하거나 다른클래스의 인스턴스간에 결합도가 높아지지는 않아서 싱글톤을 사용했음 싱글톤을 사용하면 고정된 메모리 영억을 얻으면서 한번의 new로 인스턴스롤 사용하기에
	//메모리 낭비를 방지할수있어서 register는 싱글톤사용 Article은 사용안함
	
	
	
	response.sendRedirect("/Jboard1/list.jsp");





%>