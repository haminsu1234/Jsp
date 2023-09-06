<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

        <div id="sub">
            <div><img src="${ctxPath}/images/sub_top_tit2.png" alt="MARKET"></div>
            <section class="market">
                <aside>
                    <img src="${ctxPath}/images/sub_aside_cate2_tit.png" alt="장보기"/>

                    <ul class="lnb">
                        <li class="on"><a href="./market.html">장보기</a></li>
                    </ul>
                </aside>
                <article class="list">
                    <nav>
                        <img src="${ctxPath}/images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                        <p>
                            HOME > 장보기 > <em>장보기</em>
                        </p>
                    </nav>

                    <!-- 내용 시작 -->
                    <p class="sort">
                           <a href="${ctxPath }/market/list.do?type=1" class="${ type.equals('1') ? 'on':''}">전체 ${ type.equals('1') ? total :'' } |</a>
                           <a href="${ctxPath }/market/list.do?type=2" class="${ type.equals('2') ? 'on':''}">과일 ${ type.equals('2') ? total :'' } |</a>
                           <a href="${ctxPath }/market/list.do?type=3" class="${ type.equals('3') ? 'on':''}">야채 ${ type.equals('3') ? total :'' } |</a>
                           <a href="${ctxPath }/market/list.do?type=4" class="${ type.equals('4') ? 'on':''}">곡류 ${ type.equals('4') ? total :'' } |</a>
                    </p>
                    <table border="0">
                    <c:forEach var ="product" items="${requestScope.products }">
                        <tr>
                            <td>
                                <a href="${ctxPath}/market/view.do"><img src="${ctxPath}/upload/${product.getThumb1()}" alt="썸네일" class="thumb"></a>
                            </td>
                            <td>
                            <c:if test="${product.getType() eq 2}"> 
                            	과일
                            </c:if>
                            <c:if test="${product.getType() eq 3}"> 
                            	야채
                            </c:if>
                            <c:if test="${product.getType() eq 4}"> 
                            	곡물
                            </c:if>
                            </td>
                            <td><a href="#">${product.getpName() }</a></td>
                            <td><strong>${product.getPrice() }</strong>원</td>
                        </tr>
					</c:forEach>
                    </table>

                    <p class="paging">
                        <a href="#"><</a>
                        <a href="#" class="on">[1]</a>
                        <a href="#">[2]</a>
                        <a href="#">[3]</a>
                        <a href="#">[4]</a>
                        <a href="#">[5]</a>
                        <a href="#">></a>
                    </p>

                    <!-- 내용 끝 -->

                </article>
            </section>

        </div>
 <%@ include file="../_footer.jsp" %>      
        
