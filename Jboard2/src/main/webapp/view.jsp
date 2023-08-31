<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file ="./_header.jsp" %>
        <main id="board">
            <section class="view">


                    <table border="0">
                        <caption>글내용</caption>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" readonly value="${view.getTitle()}"/></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" readonly>${view.getContent() }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>파일</th>
                            <td>
                                <a href="./upload/${file.getNewName()}"download>${file.getOriName()}</a>
                            </td>
                        </tr>
                    </table>
                    
                    <div>
	                    <a href="/Jboard2/delete.do?no=${view.getNo() }" class="btn btnRemove">삭제</a>
	                    <a href="/Jboard2/modify.do?no=${view.getNo()}" class="btn btnModify">수정</a>
	                    <a href="/Jboard2/list.do" class="btn btnList">목록</a>
                    </div>

                <!-- 댓글목록 -->
                <section class="commentList">
                    <h3>댓글목록</h3>                   
					
                    <article>
                    <c:forEach var="comment" items="${comments}">
                        <span class="nick">${comment.getWriter() }</span>
                        <span class="date">${comment.getRdate() }</span>
                        <p class="content">${comment.getContent() }</p>                        
                        
                        <c:if test="${sessUser.getUid() eq comment.getWriter() }">
                        <div>
                            <a href="/Jboard2/delete.do?no=${comment.getNo() }" class="remove">삭제</a>
                            <a href="#" class="modify">수정</a>
                        </div>
                        </c:if>
                    </c:forEach>
                    </article>
					<c:if test="${comment.isEmpty()}"> 
                    	<p class="empty">등록된 댓글이 없습니다.</p>
					</c:if> 
                </section>

                <!-- 댓글쓰기 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="/Jboard2/view.do" method="POST">
                    	<input type="hidden" name="writer" value="${sessUser.getUid()}"/>
                    	<input type="hidden" name="parent" value="${view.getNo()}"/>
                        <textarea name="content" placeholder="댓글내용 입력"></textarea>
                        <div>
                            <a href="#" class="btn btnCancel">취소</a>
                            <input type="submit" value="작성완료" class="btn btnComplete"/>
                        </div>
                    </form>
                </section>
            </section>
        </main>
<%@ include file="./_footer.jsp" %>