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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>

    <link rel="stylesheet" href="./css/style.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="/Farmstory1/Farmstory/admin/js/popup.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="./css/style.css">

</head>
<body>
    <div id="container">
        <header>

            <a href="/Farmstory1/Farmstory/admin/index.jsp" class="logo"><img src="./images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="/">HOME |</a>
                <a href="/Farmstory1/Farmstory/user/logout.jsp">로그아웃 |</a>
                <a href="#">고객센터</a>
            </p>
        </header>