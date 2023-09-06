<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside${group}.jsp"/>
			<section class="modify">
			    <h3>글수정</h3>
			    <article>
			        <form action="/Farmstory2/board/modify.do" method="post" enctype="multipart/form-data" >
			        <input type="hidden" name="no" value="${views.getNo()}"/>
			        <input type="hidden" name="group" value="${group}"/>
			        <input type="hidden" name="cate" value="${cate}"/>
			        
			            <table>
			                <tr>
			                    <td>제목</td>
			                    <td><input type="text" name="title" value="${views.getTitle() }" placeholder="제목을 입력하세요."/></td>
			                </tr>
			                <tr>
			                    <td>내용</td>
			                    <td>
			                        <textarea name="content">${views.getContent() }</textarea>
			                    </td>
			                </tr>
			                <tr>
			                    <td>첨부</td>
			                    <c:if test="${views.getFile() eq 0 }">
			                    	<td><input type="file" multiple="multiple" name="file"/></td>
			                	</c:if>
			                	<c:if test="${views.getFile() > 0 }">
			                	<td>
			                		<a href="/Farmstory2/upload/${file.getNewName()}" download="${file.getOriName()}">${file.getOriName()}</a>
			                		<a href="/Farmstory2/board/delete.do?no=${views.getNo()}&onlyfile=yes&group=${group}&cate=${cate}">[X]</a>
			                	</td>
			                	</c:if>
			                </tr>
			            </table>
			            <div>
			                <a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}" class="btn btnCancel">취소</a>
			                <input type="submit"  class="btn btnWrite" value="수정완료">
			            </div>
			        </form>
			    </article>
			</section>
			<!-- 내용 끝 -->
        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>