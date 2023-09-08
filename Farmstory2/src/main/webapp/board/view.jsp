<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside${group}.jsp"/>
<script>
	$(function(){
		
		//댓글삭제
		$(document).on('click','.remove',function(e){
			e.preventDefault();
			//alert('클릭!')
			
			const no=$(this).data('no');
			const article=$(this).parent().parent();
			
			console.log('no : '+no);
			
			const jsonData={
					"kind" : "REMOVE",
					"no" : no
			}
			
			console.log('jsonData = ' + jsonData)
			$.ajax({
				url:'/Farmstory2/board/delete.do',
				type:'POST',
				data: jsonData,
				dataType : 'json',
				success : function(data){
			
					if(data.result > 0){
						alert('댓글삭제완료');
					
						article.remove();
					}
					
				}
			
			})
			
			
			
		})
		
		/*$(document).on('click', '.remove', function(e) {
			  e.preventDefault();
			  const no = $(this).data('no');
			  const article = $(this).closest('.article');
			  const jsonData = {
			    "kind": "REMOVE",
			    "no": no
			  };
			  $.ajax({
			    url: '/Farmstory2/board/delete.do',
			    type: 'POST',
			    data: jsonData,
			    dataType: 'json',
			    success: function(data) {
			      if (data.result > 0) {
			        alert('댓글삭제완료');
			        article.remove();
			      }
			    }
			  });
			});
		*/// 이렇게하면 실행자체는 되긴하는데 화면에 즉각적인 반응이 안옴 새로고침해야지 삭제되었는지 알수있음 
		
		//댓글수정//댓글을 하나수정중일 떄 다른 댓글 수정막는건 강사님코드 들고옴 와 js 진짜 하기싫다 
		//
		$('.mod').click(function(e){
			e.preventDefault();
			const article  = e.target.parentNode.closest('article');//이벤트 타겟의 부모 노드로 이동하여 가장 가까운 article 요소를 찾는 코드
			const txt = $(this).text();
			const modifying = document.getElementsByClassName('modifying')[0];
			if(txt == '수정'){
				$(this).parent().prev().addClass('modi');
				$(this).parent().prev().attr('readonly', false);
				$(this).parent().prev().focus();
				$(this).text('수정완료');
				$(this).prev().show();
				article.classList.add('modifying'); //이벤트 타겟의 부모 노드로 이동하여 가장 가까운 article 요소에 modifying 을 부여  modifiying에 값이 있으면 readonly 속성부여해서 수정불가하게 함 
				
				if(modifying != null){						 
					const modifyingTextarea = modifying.getElementsByTagName('textarea')[0];
					const modifyingRemove = modifying.getElementsByClassName('remove')[0];
					const modifyingCancel = modifying.getElementsByClassName('cancel')[0];
					const modifyingModify = modifying.getElementsByClassName('modify')[0];
					
					modifyingTextarea.style.border = 'none';
					modifyingTextarea.style.background = 'none';
					modifyingTextarea.readOnly = true;
					
					modifyingRemove.style.display = 'inline';
					modifyingCancel.style.display = 'none';
					modifyingModify.innerText = '수정';
					
					modifying.classList.remove('modifying');
				}
				
			}else{
				// 수정완료 클릭
				if(confirm('정말수정하시겠습니까')){
					$(this).click(function(){
						/*const parent=$('#formCommentList > input[name=parent]').val();
						const content=$('#formCommentList > textarea[name=comment]').val();
						const writer=$('#formCommentList > input[name=writer]').val();
						
						const jsonData ={
								"content" : content,
								"parent" : parent,
								"writer" : writer
						};*/

						const no=$(this).data('no');
						const comment =$('#formCommentList > textarea[name=comment]').val();
						const writer =$('#formCommentList > input[name=writer]').val();
						
						const jsonData ={
								"comment" : comment,
								"no" : no,
								"writer" : writer
						};
						
						console.log('jsonData : '+jsonData);
						
						$.ajax({
							url:'/Farmstory2/board/comment.do',
							type:'GET',
							data: jsonData,
							dataType: 'json',
							success : function(data){
								
								if(data.result > 0){
									alert('수정완료');
								}
							}
						})

					})
					
				}
				//수정데이터 전송
				
				// 수정모드 해제 
				$(this).parent().prev().removeClass('modi');
				$(this).parent().prev().attr('readonly', true);
				$(this).text('수정');
				$(this).prev().hide();
			}
		});
		
		
		
		//댓글입력
		$('#btnComment').click(function(e){
			e.preventDefault();
			
			const parent =$('#formComment > input[name=parent]').val();
			const content =$('#formComment > textarea[name=content]').val();
			const writer =$('#formComment > input[name=writer]').val();
			
			const jsonData ={
					"content" : content,
					"parent" : parent,
					"writer" : writer
			};
			
			console.log('jsonData : '+jsonData);
			
			$.ajax({
				url:'/Farmstory2/board/comment.do',
				type:'post',
				data: jsonData,
				dataType : 'json',
				success : function(data){
					console.log(data);
					
					if(data.result > 0){
						alert('댓글이 등록 되었습니다.');
						
						// 동적 화면 생성
						const dt = new Date();
						const year  = dt.getFullYear().toString().substr(2, 4);
						const month = dt.getMonth()+1;
						const date  = dt.getDate();
						const now   = year + "-" + month + "-" + date;
						
						const article = `<article>
											<span class='nick'>${sessUser.nick}</span>
											<span class='date'>`+now+`</span>
											<p class='content'>`+content+`</p>
											<div>
												<a href='#' class='remove'>삭제</a>
												<a href='#' class='mod modify' >수정</a>
											</div>						
										 </article>`;
						
					$('.commentList').append(article);	
					}else{
						alert('댓글등록에 실패했습니다')
					}
				}
			})
			
		});
})

</script>
			<section class="view">
			    <h3>글보기</h3>
			    <table>
			        <tr>
			            <td>제목</td>
			            <td><input type="text" name="title" value="${view.getTitle() }" /></td>
			        </tr>
			       <c:if test="${view.getFile() > 0 }">
			        <tr>
			        	
			            <td>첨부파일</td>
			            <td>
			                <a href="/Farmstory2/upload/${file.getNewName()}" download="${file.getOriName()}">${file.getOriName()}</a>
			                <span>${file.download }다운로드</span><!-- 다운로드 횟수 때문에 어짜피 도찐개찐일듯 -->
			            </td>
			            
			        </tr>
					</c:if>
			        <tr>
			            <td>내용</td>
			            <td>
			                <textarea name="content" readonly>${view.getContent() }</textarea>
			                <a href="#">추천</a>
			                <a href="#">비추천</a>
			            </td>
			        </tr>
			    </table>
			    <c:if test="${sessUser.getUid() ne null }">
			    <div>
			        <a href="/Farmstory2/board/delete.do?group=${group}&cate=${cate}&no=${view.getNo()}" class="btn btnDelete">삭제</a>
			        <a href="/Farmstory2/board/modify.do?group=${group}&cate=${cate}&no=${view.getNo()}" class="btn btnModify">수정</a>
			    </c:if>  
			        <a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}" class="btn btnList">목록</a>
			    </div>
			    <!-- 댓글리스트 -->
			    <section class="commentList">
			        <h3>댓글목록</h3>
			        <c:forEach var="comment" items="${comments}">
			        
			        <article class="comment">
			        <form id="formCommentList" action="#" method="get">
			        		<input type="hidden" name="writer" value="${sessUser.getUid()}"/>
                    		<input type="hidden" name="parent" value="${view.getNo()}"/>
			                <span class="nick">${comment.nick}</span>
			                <span class="date">${comment.rdate}</span>
			                <textarea class="comment" name="comment" readonly>${comment.content}</textarea>  
			             
			             	<c:if test="${sessUser.getUid() eq comment.getWriter() }">
							<div>
								<a href="#" class="del remove" data-no="${comment.no }">삭제</a>
								<a href="/Farmstory2/list.do?group=${group}&cate=${cate}" class="can">취소</a>
								<a href="#" class="mod modify" data-no="${comment.no }">수정</a>
							</div>
							</c:if>                    
			         </form>
			        </article>
			       
			        </c:forEach>
			        <c:if test="${empty comments }">
			        <p class="empty">등록된 댓글이 없습니다.</p>
			    	</c:if>
			    </section>
			
			    <!-- 댓글입력폼 -->
			    <section class="commentForm">
			        <h3>댓글쓰기</h3>
			        <form id="formComment" action="#" method="post">
			            <input type="hidden" name="writer" value="${sessUser.getUid()}"/>
                    	<input type="hidden" name="parent" value="${view.getNo()}"/>
			            <textarea name="content" placeholder="댓글내용 입력"></textarea>
			           	
			            <div>
			                <a href="#" class="btnCancel">취소</a>
			                <input type="submit" id="btnComment" class="btn btnWrite" value="작성완료"/>
			            </div>
			        </form>
			    </section>
			</section>
			<!-- 내용 끝 -->
        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>