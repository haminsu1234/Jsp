<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="./_header.jsp" %>
<<<<<<< HEAD
<%

	request.setCharacterEncoding("UTF-8");
	String no =request.getParameter("no");
	String title =request.getParameter("title");
	String content =request.getParameter("content");
	

%>

=======
>>>>>>> e3757f69da9b7b02913c348d742788c031e0c640
        <main>
            <section class="modify">
                <h3>글수정</h3>
                <article>
                    <form action="/Jboard1/proc/updateProc.jsp" method="post">
                        <table>
                        	<input type="hidden" name="no" value="<%= no %>">
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" value=<%= title %> placeholder="제목을 입력하세요."/></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content" vlaue=<%= content %>><%= content %></textarea>                                
                                </td>
                            </tr>
                            <tr>
                                <td>첨부</td>
                                <td><input type="file" name="file"/></td>
                            </tr>
                        </table>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit"  class="btnWrite" value="수정완료">
                        </div>
                    </form>
                </article>
            </section>
        </main>
<%@ include file ="./_footer.jsp"%>