<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file ="./_header.jsp" %>

        <main id="board">
            <section class="list">                
                <form action="#">
                    <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
                    <input type="submit" value="검색">
                </form>
                
                <table border="0">
                    <caption>글목록</caption>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <c:forEach var ="articles" items="${requestScope.article }">                    
                    <tr>
                        <td>${pageStartNum=pageStartNum-1 }</td>
                        <td><a href="/Jboard2/view.do?no=${articles.getNo() }">${articles.getTitle()}</a></td>
                        <td>${articles.getWriter() }</td>
                        <td>${ articles.getRdate()}</td>
                        <td>${articles.getHit()}</td>
                    </tr>
                    </c:forEach>
                </table>

                <div class="page">
        			<c:if test="${pageGroupStart > 1 }">
                    <a href="/Jboard2/list.do?pg=1" class="prev">처음으로</a>
                    <a href="/Jboard2/list.do?pg=${pageGroupStart -1}" class="prev">이전</a>
					</c:if>
               
					<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}" >               
                    <a href="/Jboard2/list.do?pg=${i}" class="num ${currentPage==i ? 'current':''}">${i}</a>
                    </c:forEach>
					
					<c:if test="${pageGroupEnd < lastPageNum }">
                    <a href="/Jboard2/list.do?pg=${pageGroupEnd +1 }" class="next">다음</a>
                    <a href="/Jboard2/list.do?pg=${lastPageNum}" class="next">마지막으로</a>
              		</c:if>

				</div>

                <a href="/Jboard2/write.do" class="btn btnWrite">글쓰기</a>
                
            </section>
        </main>
<%@ include file="./_footer.jsp" %>