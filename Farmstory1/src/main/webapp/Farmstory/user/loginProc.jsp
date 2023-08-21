<<<<<<< HEAD
=======
<%@page import="javax.websocket.SendResult"%>
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
<%@page import="kr.farmstory1.dao.UserDAO"%>
<%@page import="kr.farmstory1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String uid =request.getParameter("uid");
	String pass =request.getParameter("pass");
<<<<<<< HEAD
	String target =request.getParameter("target");
	String cate =request.getParameter("cate");
	String group =request.getParameter("group");
	String no =request.getParameter("no");
	
	
	String errorCode =null;
=======
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
	

	UserDTO dto = UserDAO.getInstance().selectUser(uid, pass);
	
	if (dto != null){
		session.setAttribute("sessUser", dto);
<<<<<<< HEAD
		
		
			if(target.equals("write")){
				response.sendRedirect("/Farmstory1/Farmstory/write.jsp?group="+group+"&cate="+cate);
			}else if(target.equals("view")){
				response.sendRedirect("/Farmstory1/Farmstory/view.jsp?group="+group+"&cate="+cate+"&no="+no);
			}else{
			response.sendRedirect("/Farmstory1/Farmstory/index.jsp");
			}
	
		//로그인 실패시
	}else {
		errorCode="101";
		response.sendRedirect("/Farmstory1/Farmstory/user/login.jsp?&errorCode="+errorCode);
=======
		response.sendRedirect("/Farmstory1/Farmstory/index.jsp");
		
		
	}else {
		response.sendRedirect("/Farmstory1/Farmstory/user/login.jsp");
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
	}





%>