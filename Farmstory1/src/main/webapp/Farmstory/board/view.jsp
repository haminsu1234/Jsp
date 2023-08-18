
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String no =request.getParameter("no");
	
	if(sessUser ==null){
		errorCode="102";
		response.sendRedirect("/Farmstory1/Farmstory/board/list.jsp?group="+group+"&cate="+cate+"&errorCode="+errorCode+"&no="+no+"&target=view");
		return;
	}
	
	ArticleDAO dao =new ArticleDAO();
	ArticleDTO dto = dao.selectview(no);
	dao.updateViewHit(no);
	
	List<ArticleDTO> comments = dao.selectsComments(no);
	
	pageContext.include("./_aside"+group+".jsp");
%>
<script>
	$(function(){
		// 댓글 수정
		$('.mod').click(function(e){
			e.preventDefault();
			
			const txt = $(this).text();
			
			if(txt == '수정'){
				$(this).parent().prev().addClass('modi');
				$(this).parent().prev().attr('readonly', false);
				$(this).parent().prev().focus();
				$(this).text('수정완료');
				$(this).prev().show();
			}else{
				// 수정완료 클릭
				if(confirm('정말수정하시겠습니까')){
					$(this).closest('form').submit();
				}
				// 수정 데이터 전송
				
				
				// 수정모드 해제 
				$(this).parent().prev().removeClass('modi');
				$(this).parent().prev().attr('readonly', true);
				$(this).text('수정');
				$(this).prev().hide();
			}
		});
		
		// 댓글 삭제
		$('.del').click(function(){
			const result = confirm('정말 삭제 하시겠습니까?');
			
			if(result){
				return true;
			}else{
				return false;					
			}
		});
		
		// 댓글쓰기 취소
		// Javascript 방식
		const commentContent = document.querySelector('form > textarea[name=content]');
		const btnCancel = document.querySelector('.btnCancel');
		btnCancel.onclick = function(e){
			e.preventDefault();
			commentContent.value = '';
		}
		
		// jQuery 방식
		$('.btnCancel').click(function(e){
			e.preventDefault();
			$('form > textarea[name=content]').val('');
		});
		
		/*let commentContent2 = document.querySelector('form > textarea[name=content]');
		
		$('.can').click(function(e){
			e.preventDefault();
			$('form > textarea[name=comment]').val(commentContent2);
		});*/
		
		
		
		// 원글 삭제
		const btnDelete = document.getElementsByClassName('btnDelete')[0];
		btnDelete.onclick = function(){
			if(confirm('정말 삭제 하시겠습니까?')){
				return true;
			}else{
				return false;					
			}
		}
		
	
	});
</script>


 <section class="view">
     <h3>글보기</h3>
     <table>
         <tr>
             <td>제목</td>
             <td><input type="text" name="title" value="<%= dto.getTitle() %>" readonly/></td>
         </tr>
		<%if(dto.getFile()> 1) {%>
         <tr>
             <td>첨부파일</td>
             <td>
                 <a href="#">1</a>
                 <span>1회 다운로드</span>
             </td>
         </tr>
         <%} %>
        
         <tr>
             <td>내용</td>
             <td>
                 <textarea name="content" readonly><%=dto.getContent() %></textarea>
             </td>
         </tr>
     </table>
     <div>
         <a href="/Farmstory1/Farmstory/board/proc/deleteProc.jsp?group=<%=group %>&cate=<%= cate %>&no=<%= no %>" class="btnDelete">삭제</a>
         <a href="./modify.jsp?group=<%=group %>&cate=<%= cate %>&no=<%= no %>" class="btnModify">수정</a>
         <a href="./list.jsp?group=<%=group %>&cate=<%= cate %>" class="btnList">목록</a>
     </div>  
     
     <!-- 댓글리스트 -->
     <section class="commentList">
         <h3>댓글목록</h3>
         
		<% for(ArticleDTO comment : comments){ %>
      	<article class="comment">
      	<form action="/Farmstory1/Farmstory/board/proc/commentModify.jsp?group=<%=group %>&cate=<%= cate %>" method="post">
       	<input type="hidden" name="no" value="<%= comment.getNo() %>">
       	<input type="hidden" name="parent" value="<%= comment.getParent()%>">	                    
               <span>
                   <span><%= comment.getNick() %></span>
                   <span><%= comment.getRdate() %></span>
               </span>
               <textarea name="comment" readonly><%= comment.getContent() %></textarea>
              <%if(sessUser.getUid().equals(comment.getWriter())){ %>
                <div>
                    <a href="/Farmstory1/Farmstory/board/proc/commentDelete.jsp?group=<%=group %>&cate=<%= cate %>&no=<%= comment.getNo() %>&parent<%=comment.getParent() %>" class="del">삭제</a>
                    <a href="#" class="can ">취소</a>
                    <a href="/Farmstory1/Farmstory/board/proc/commentModify.jsp?group=<%=group %>&cate=<%= cate %>&no=<%= comment.getNo() %>&parent<%=comment.getParent() %>" class="mod">수정</a>
                </div>
				<%} %>
               </form>
              </article>
           <% }%> 
 
              <% if(comments.isEmpty()){ %>
                    	<p class="empty">
                        	등록된 댓글이 없습니다.
                    	</p>
                    <% } %>

     </section>

     <!-- 댓글입력폼 -->
     <section class="commentForm">
         <h3>댓글쓰기</h3>
         <form action="/Farmstory1/Farmstory/board/proc/commentProc.jsp" method="post">
         	<input type="hidden" name="group" value="<%= group %>">
         	<input type="hidden" name="cate" value="<%= cate %>">
         	<input type="hidden" name="parent" value="<%= no %>">
         	<input type="hidden" name="writer" value="<%= sessUser.getUid() %>">
             <textarea name="content"></textarea>
             <div>
                 <a href="" class="btnCancel">취소</a>
                 <input type="submit" class="btnWrite" value="작성완료"/>
             </div>
         </form>
     </section>

 </section>
         </article>
    </section>
</div>	


<%@ include file="../_footer.jsp" %>
