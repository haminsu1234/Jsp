<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pg =request.getParameter("pg");
	
	//DAO객체생성
	ArticleDAO dao = new ArticleDAO();
	

	//페이지 관련 변수
	int start=0;
	int currentPage =1;
	int total=0;
	int lastPageNum=0;
	int pageGroupCurrent=1;
	int pageGroupStart=1;
	int pageGroupEnd=0;
	int pageStartNum=0;
	
	
	//현재페이지계산
	if(pg!=null){
		currentPage =Integer.parseInt(pg);
		
	}
	
	//LIMIT 시작값계산
	start =(currentPage -1)*10;

	
	
	//전체 게시물 갯수조회
	total =dao.selectCountTotal();
	
	if(total%10 == 0){
		lastPageNum =(total/10);
	}else{
		lastPageNum =(total/10)+1;
	}
	
	//페이지 그룹계산
	pageGroupCurrent=(int) Math.ceil(currentPage/10.0);
	pageGroupStart=(pageGroupCurrent-1)*10+1;
	pageGroupEnd=pageGroupCurrent*10;
	
	if(pageGroupEnd > lastPageNum){
		pageGroupEnd=lastPageNum;
	}
	
	//페이지 시작번호 계산
	pageStartNum =total-start;
	
	
	//현제 페이지 게시물 조회
	List<ArticleDTO> articles =dao.selectArticles(start); //dao 객체 받아오기

%>   
        <main>
            <section class="list">
                <h3>글목록</h3>
                <article>
                    <table border="0">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr>
                <% for(ArticleDTO article : articles){ %><!-- 글 리스트 찍는용도 -->
                <tr>
                    <td><%= pageStartNum-- %></td> 
                    <!--  
                    게시물 번호를 db에서 받아오는게 아니라 인위적으로 찍는건데 이렇게되면 해당게시글에 
                    문제가생겼을때(삭제가아닌 글내용수정 블라인드 처리등등 삭제를 제외한경우)일때 
                    db로 조회시 시간이 걸릴수도 있음  
                    
                    그래서 그냥 게시물번호 자체는 받아오는게 좋은것같음 
                    -->
                    <td><a href="/Jboard1/view.jsp?no=<%= article.getNo() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                    <td><%= article.getWriter() %></td> <!--그냥 아이디로 찍을까 nick로 찍을까 생각해봤지만 uid는 잘못해서 털리면 좀 그래서 nick으로 그리고 uid로 작성자를 구분짓기에는 번거로울듯  -->
                    <td><%= article.getRdate() %></td>	<!-- writer 같은경우에 nick으로 출력하다보니 sql구문을 테이블두개를 inner join해서 조회 -->
                    <td><%= article.getHit() %></td>
                </tr>
                <% } %> 
                    </table>
                </article>

                <!-- 페이지 네비게이션 -->
                <div class="paging">
                	<%if(pageGroupStart>1){ %>
                    <a href="/Jboard1/list.jsp?pg=1" class="prev">처음으로</a>
                    <a href="/Jboard1/list.jsp?pg=<%= pageGroupStart -1 %>" class="prev">이전</a>
         			<%} %>
         			<%for(int i=pageGroupStart; i<=pageGroupEnd;i++){ %>
         			
                    <a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%=(currentPage==i)?"current":"" %>"><%= i %></a>                
             		<% } %>
             		<%if(pageGroupEnd < lastPageNum){ %>
                    <a href="/Jboard1/list.jsp?pg=<%= pageGroupEnd +1 %>" class="next">다음</a>
                    <a href="/Jboard1/list.jsp?pg=<%= lastPageNum %>" class="next">마지막으로</a>
                	<%} %>
                </div>

                <!-- 글쓰기 버튼 -->
                <a href="/Jboard1/write.jsp" class="btnWrite">글쓰기</a>
            </section>
        </main>
<%@ include file ="./_footer.jsp" %>