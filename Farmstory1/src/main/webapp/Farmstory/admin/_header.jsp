<<<<<<< HEAD
<%@page import="kr.farmstory1.dto.UserDTO"%>
<%@page import="com.mysql.cj.Session"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserDTO	sessUser=(UserDTO)session.getAttribute("sessUser");

	if(sessUser==null){
		response.sendRedirect("/Farmstory1/Farmstory/user/login.jsp?=errorCode=102");
		return;
	}

%>
=======
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
<<<<<<< HEAD
    <link rel="stylesheet" href="./css/style.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="/Farmstory1/Farmstory/admin/js/popup.js"></script>
=======
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="./css/style.css">
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
</head>
<body>
    <div id="container">
        <header>
<<<<<<< HEAD
            <a href="/Farmstory1/Farmstory/admin/index.jsp" class="logo"><img src="./images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="/">HOME |</a>
                <a href="/Farmstory1/Farmstory/user/logout.jsp">로그아웃 |</a>
=======
            <a href="/Farmstroy1/Farmstory/admin/index.jsp" class="logo"><img src="./images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="/">HOME |</a>
                <a href="#">로그아웃 |</a>
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
                <a href="#">고객센터</a>
            </p>
        </header>