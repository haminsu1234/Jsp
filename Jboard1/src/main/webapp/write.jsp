<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="./_header.jsp"%>

        <main>
            <section class="write">
                <h3>글쓰기</h3>
                <article>
                    <form action="/Jboard1/proc/writeProc.jsp">
                        <input type="hidden" name="writer" readonly value=<%=sessUser.getUid() %>><!--session 으로 처리하거나 파리미터를 받아 처리하거나 둘중하나인데 파라미터로 처리받을때 굳이 정보는 화면에 띄울필요는 없으므로 히든처리함  -->
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
                            <a href="/Jboard1/list.jsp" class="btnCancel">취소</a>
                            <input type="submit"  class="btnWrite" value="작성완료">
                        </div>
                    </form>
                </article>
            </section>
        </main>
<%@ include file ="./_footer.jsp"%>