<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div id="sub">
    <div><img src="../images/sub_top_tit5.png" alt="COMMUNITY"></div>
    <section class="community">
        <aside>
            <img src="../images/sub_aside_cate5_tit.png" alt="커뮤니티"/>

            <ul class="lnb">
            	<li class="${cate eq 'chef'?'on':'off'}"><a href="/Farmstory2/board/list.do?group=Community&cate=chef">공지사항</a></li>
                <li class="${cate eq 'faq'?'on':'off'}"><a href="/Farmstory2/board/list.do?group=Community&cate=faq">오늘의식단</a></li>
                <li class="${cate eq 'menu'?'on':'off'}"><a href="/Farmstory2/board/list.do?group=Community&cate=menu">나도요리사</a></li>
                <li class="${cate eq 'notice'?'on':'off'}"><a href="/Farmstory2/board/list.do?group=Community&cate=notice">1:1고객문의</a></li>
                <li class="${cate eq 'qna'?'on':'off'}"><a href="/Farmstory2/board/list.do?group=Community&cate=qna">자주묻는질문</a></li>

            </ul>
        </aside>
        
        <article>
            <nav>
                <img src="../images/sub_nav_tit_cate5_tit1.png" alt="커뮤니티"/>
                <p>
                    HOME > 커뮤니티 > <em>공지사항</em>
                </p>
            </nav>
            <!-- 내용 시작 -->