<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="./css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>    
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
    </script>

</head>
<body>
    <div id="container">
        <header>
            <a href="./index.jsp" class="logo"><img src="./images/logo.png" alt="로고"/></a>
            <p>
                <a href="#">HOME |</a>
                <a href="/Farmstory2/user/login.do">로그인 |</a>
                <a href="/Farmstory2/user/register.do">회원가입 |</a>
                <a href="./admin/">관리자 |</a>
                <a href="#">고객센터</a>
            </p>
            <img src="./images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/Farmstory2/introduction/hello.do">팜스토리소개</a></li>
                <li><a href="/Farmstory2/market/list.do"><img src="./images/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory2/croptalk/story.do">농작물이야기</a></li>
                <li><a href="/Farmstory2/event/event.do">이벤트</a></li>
                <li><a href="/Farmstory2/community/notice.do">커뮤니티</a></li>
            </ul>
        </header>
        <main>
            <div class="slider">
                <ul>
                    <li><img src="./images/main_slide_img1.jpg" alt="슬라이더1"></li>
                    <li><img src="./images/main_slide_img2.jpg" alt="슬라이더2"></li>
                    <li><img src="./images/main_slide_img3.jpg" alt="슬라이더3"></li>
                </ul>

                <img src="./images/main_slide_img_tit.png" alt="사람과 자연을 사랑하는 팜스토리"/>

                <div class="banner">
                    <img src="./images/main_banner_txt.png" alt="GRAND OPEN"/>
                    <img src="./images/main_banner_tit.png" alt="팜스토리 오픈기념 30% 할인 이벤트"/>
                    <img src="./images/main_banner_img.png" alt="과일"/>
                </div>
            </div>

            <div class="quick">
                <a href="#"><img src="./images/main_banner_sub1_tit.png" alt="오늘의 식단"></a>
                <a href="#"><img src="./images/main_banner_sub2_tit.png" alt="나도 요리사"></a>                
            </div>

            <div class="latest">
                <div>
                    <a href="#"><img src="./images/main_latest1_tit.png" alt="텃밭 가꾸기"/></a>
                    <img src="./images/main_latest1_img.jpg" alt="이미지"/>
                    <table border="0">
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <a href="#"><img src="./images/main_latest2_tit.png" alt="귀농학교"/></a>
                    <img src="./images/main_latest2_img.jpg" alt="이미지"/>
                    <table border="0">
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <a href="#"><img src="./images/main_latest3_tit.png" alt="농작물 이야기"/></a>
                    <img src="./images/main_latest3_img.jpg" alt="이미지"/>
                    <table border="0">
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                        <tr>
                            <td>></td>
                            <td><a href="#">토마토! 건강하게 길러서 안심하고 먹자</a></td>
                            <td>20-12-22</td>
                        </tr>
                    </table>
                </div>
                
            </div>

            <div class="info">
                <div>
                    <img src="./images/main_sub2_cs_tit.png" class="tit" alt="고객센터 안내"/>
                    <div class="tel">
                        <img src="./images/main_sub2_cs_img.png" alt="">
                        <img src="./images/main_sub2_cs_txt.png" alt="1666-777">
                        <p class="time">
                            평일: AM 09:00 ~ PM 06:00<br>
                            점심: PM 12:00 ~ PM 01:00<br>
                            토, 일요일, 공휴일 휴무
                        </p>
                    </div>
                    <div class="btns">
                        <a href="#"><img src="./images/main_sub2_cs_bt1.png" alt="1:1 고객문의"></a>
                        <a href="#"><img src="./images/main_sub2_cs_bt2.png" alt="자주묻는질문"></a>
                        <a href="#"><img src="./images/main_sub2_cs_bt3.png" alt="배송조회"></a>
                    </div>
                </div>
                <div>
                    <img src="./images/main_sub2_account_tit.png" class="tit" alt="계좌안내"/>
                    <p class="account">
                        기업은행 123-456789-01-01-012<br />
                        국민은행 01-1234-56789<br />
                        우리은행 123-456789-01-01-012<br />
                        하나은행 123-456789-01-01<br />
                        예 금 주 (주)팜스토리
                    </p>
                </div>
                <div>
                    <div id="tabs">
                        <ul>
                            <li><a href="#tabs-1">공지사항</a></li>
                            <li><a href="#tabs-2">1:1 고객문의</a></li>
                            <li><a href="#tabs-3">자주묻는 질문</a></li>
                        </ul>
                        <div id="tabs-1">
                            <ul class="txt">
                                <li><a href="#">· 홈페이지 오픈 기념 이벤트를 진행합니다.</a></li>
                                <li><a href="#">· 홈페이지 오픈 기념 이벤트를 진행합니다.</a></li>
                                <li><a href="#">· 홈페이지 오픈 기념 이벤트를 진행합니다.</a></li>
                            </ul>
                        </div>
                        <div id="tabs-2">
                            <ul class="txt">
                                <li><a href="#">· 홈페이지 이용 관련 불편사항을 들려주세요.</a></li>
                                <li><a href="#">· 홈페이지 이용 관련 불편사항을 들려주세요.</a></li>
                                <li><a href="#">· 홈페이지 이용 관련 불편사항을 들려주세요.</a></li>
                            </ul>
                        </div>
                        <div id="tabs-3">
                            <ul class="txt">
                                <li><a href="#">· 홈페이지를 오픈하였습니다.</a></li>
                                <li><a href="#">· 홈페이지를 오픈하였습니다.</a></li>
                                <li><a href="#">· 홈페이지를 오픈하였습니다.</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer>
            <img src="./images/footer_logo.png" alt="로고"/>
            <p>
                (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-팜스토리구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호<br />
                등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동<br />
                대표 : 홍길동 / 이메일 : email@mail.mail / 전화 : 01) 234-5678 / 경기도 성남시 잘한다구 신난다동 345<br />
                <em>Copyright(C)홍길동 All rights reserved.</em>
            </p>
        </footer>
    </div>
    
</body>
</html>