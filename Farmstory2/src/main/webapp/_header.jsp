<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 개발/배포에서 ContextPath 포함 여부에 따른 동적처리 -->
<!-- 요방법은 좀 신박하다 -->
<c:set var="ctxPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::로그인</title>    

     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
     <link rel="stylesheet" href="/Farmstory2/css/style.css"/>
    <link rel="stylesheet" href="/Farmstory2/user/css/style.css"/>
    
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="/Farmstory2/js/timeout.js"></script>  
	  <script src="/Farmstory2/js/validation.js"></script>  
    <script src="/Farmstory2/js/zipcode.js"></script>  
    <script src="/Farmstory2/js/checkUser.js"></script>  
    <!-- 
    	18줄부터 순서대로
    	유효성검사
    	주소검색 openapi
    	거뭐냐 그 중복검사
    
     -->
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
      
  	/*const success = ${success};
	
	if(success == 100){
		alert('로그인에 실패 했습니다. 아이디, 비번을 다시 확인하시기 바랍니다.');
	}else if(success == 101){
		alert('로그인을 먼저 하셔야 합니다.');    		
	} */ 
      
  
    </script>

</head>
<body>
    <div id="container">
        <header>
            <a href="${ctxPath}" class="logo"><img src="${ctxPath}/images/logo.png" alt="로고"/></a>
            <p>
                <a href="${ctxPath}">HOME |</a>
                <c:if test="${empty sessUser }">
                	<a href="${ctxPath}/user/login.do">로그인 |</a>
                	<a href="${ctxPath}/user/terms.do">회원가입 |</a>
                </c:if>
                <c:if test="${not empty sessUser}">
	                <a href="${ctxPath}/user/logout.do">로그아웃 |</a>
	                	<c:if test="${sessUser.getRole() ne 'USER'}">
	                		<a href="${ctxPath}/admin">관리자 |</a>
	                	</c:if>
				</c:if>

                <a href="#">고객센터</a>
            </p>
            <img src="${ctxPath}/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="${ctxPath}/introduction/hello.do">팜스토리소개</a></li>
                <li><a href="${ctxPath}/market/list.do?type=1&pg=1"><img src="${ctxPath}/images/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="${ctxPath}/board/list.do?group=Croptalk&cate=story">농작물이야기</a></li>
                <li><a href="${ctxPath}/board/list.do?group=Event&cate=event">이벤트</a></li>
                <li><a href="${ctxPath}/board/list.do?group=Community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>