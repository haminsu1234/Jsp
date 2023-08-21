<%@page import="kr.farmstory1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
<<<<<<< HEAD
	request.setCharacterEncoding("UTF-8");
	UserDTO sessUser = (UserDTO)session.getAttribute("sessUser");
	String errorCode =request.getParameter("errorCode");
=======
	UserDTO sessUser = (UserDTO)session.getAttribute("sessUser");
	
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/Farmstory1/Farmstory/css/style.css"/>
    <link rel="stylesheet" href="/Farmstory1/Farmstory/user/css/style.css"/>
<<<<<<< HEAD
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>    
   <script src= "/Farmstory1/Farmstory/user/js/timeout.js"></script>
=======
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>    
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
    <script>
        $(function(){
            $('.slider > ul').bxSlider({
                slideWidth: 980,
                pager: false,
                controls: false,
                auto: true
            });

            $('#tabs').tabs();
        });
<<<<<<< HEAD
        
    	const errorCode=<%=errorCode %>
    	
    	if(errorCode==102){	
    		alert('먼저 로그인을 해주세요');
    	}else if(errorCode==101){
    		alert('아이디와 비밀번호를 확인해주세요');
    	}
=======
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
    </script>

</head>
<body>
    <div id="container">
        <header>
            <a href="/Farmstory1/Farmstory" class="logo"><img src="/Farmstory1/Farmstory/images/logo.png" alt="로고"/></a>
            <p>
                <a href="/Farmstory1/Farmstory/index.jsp">HOME |</a>
                <% if(sessUser == null) { %>
                <a href="/Farmstory1/Farmstory/user/login.jsp">로그인 |</a>
                <a href="/Farmstory1/Farmstory/user/terms.jsp">회원가입 |</a>
                <% }else{ %>
                <a href="/Farmstory1/Farmstory/user/logout.jsp">로그아웃 |</a>
                	<%if(!sessUser.getRole().equals("USER")){ %>
                	<a href="/Farmstory1/Farmstory/admin/">관리자 |</a>
                	<%} %>
                <%} %>
                <a href="#">고객센터</a>
            </p>
            <img src="/Farmstory1/Farmstory/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/Farmstory1/Farmstory/introduction/hello.jsp">팜스토리소개</a></li>
                <li><a href="/Farmstory1/Farmstory/market/list.jsp"><img src="/Farmstory1/Farmstory/images/head_menu_badge.png" alt="30%"/>장보기</a></li>
<<<<<<< HEAD
                <li><a href="/Farmstory1/Farmstory/board/list.jsp?group=Croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/Farmstory1/Farmstory/board/list.jsp?group=Event&cate=event">이벤트</a></li>
                <li><a href="/Farmstory1/Farmstory/board/list.jsp?group=Community&cate=notice">커뮤니티</a></li>
=======
                <li><a href="/Farmstory1/Farmstory/croptalk/story.jsp">농작물이야기</a></li>
                <li><a href="/Farmstory1/Farmstory/event/event.jsp">이벤트</a></li>
                <li><a href="/Farmstory1/Farmstory/community/notice.jsp">커뮤니티</a></li>
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
            </ul>
        </header>
