<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	String no1 =request.getParameter("no");

	int no = Integer.parseInt(no1);

	ArticleDTO dto = new ArticleDTO();
	dto.setNo(no);
	
	ArticleDAO dao =new ArticleDAO();
	dao.updateUseynView(dto);
	
	response.sendRedirect("/Jboard1/list.jsp");
	//useyn 컬럼을 추가해서 db상에서는 존재하지만 list page에서는 안보이게 처리했음
	// why? 실제로 서비스를 운영한다라고 가정하면 실수로 지운글에대해 복구문의가 들어올수도 있고 법적인 문제나 수사기관에 제출해야할수도있으므로 db는 그대로 들고있는게 옳다고판단
	// 대형 커뮤니티가 아닌이상 게시글이 수십만~수억 이렇게 될리는 없기에 db에도 무리가 안간다고 판단함 			
	
	
%>