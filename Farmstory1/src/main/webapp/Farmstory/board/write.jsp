
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../_header.jsp" %>
<%
	

	request.setCharacterEncoding("UTF-8");
	
	//로그인 체크여부 확인
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	if(sessUser ==null){
		errorCode="102";
		response.sendRedirect("/Farmstory1/Farmstory/user/login.jsp?group="+group+"&cate="+cate+"&errorCode="+errorCode+"&target=write");
		return;
	}
	
	
	
	pageContext.include("./_aside"+group+".jsp");
	
	
%>

			<section class="write">
			    <h3>글쓰기</h3>
			    <article>
			        <form action="/Farmstory1/Farmstory/board/proc/writeProc.jsp">
			            <input type="hidden" name="writer" readonly value="<%= sessUser.getUid()%>"><!--session 으로 처리하거나 파리미터를 받아 처리하거나 둘중하나인데 파라미터로 처리받을때 굳이 정보는 화면에 띄울필요는 없으므로 히든처리함  -->
						 <input type="hidden" name="cate" readonly value="<%=cate %>">
			            <input type="hidden" name="group" readonly value="<%=group %>">
			            <table>
			                <tr>
			                    <td>제목</td>
			                    <td><input type="text" name="title" required placeholder="제목을 입력하세요."/></td>
			                </tr>
			                <tr>
			                    <td>내용</td>
			                    <td>
			                        <textarea name="content" required></textarea>                                
			                    </td>
			                </tr>
			                <tr>
			                    <td>첨부</td>
			                    <td><input type="file" name="file"/></td>
			                </tr>
			            </table>
			            <div>
			                <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnCancel">취소</a>
			                <input type="submit"  class="btnWrite" value="작성완료">
			            </div>
			        </form>
			    </article>
			</section>
        </article>
    </section>
</div>	


<%@ include file="../_footer.jsp" %>