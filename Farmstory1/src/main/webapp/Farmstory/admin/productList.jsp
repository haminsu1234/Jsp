<%@page import="kr.farmstory1.dao.ProductDAO"%>
<%@page import="kr.farmstory1.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="./_header.jsp" %>
        <main>
<%@ include file ="./_aside.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String type = request.getParameter("type");
	String pg = request.getParameter("pg");
	
	if(type==null){
		type="1";
	}

	
	ProductDAO dao =new ProductDAO();
	
	//페이지 관련 변수
	int start=0;
	int currentPage =1;
	int total=0;
	int allproduct=0;
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

	//전체 게시물 조회
	allproduct=dao.selectCountProductAllTotal();
	
	
	//타입별 게시물 갯수조회
	total=dao.selectCountProductTotal(type);
	
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
	
	

	
	List<ProductDTO> products = dao.selectProducts(type,start);
	
	


%>
            <section id="productList">
                <nav>
                    <h3>상품목록</h3>
                </nav>

                <article>

                    <table border="0">
                        <tr>
                            <th><input type="checkbox" name="all"/></th>
                            <th>사진</th>
                            <th>상품번호</th>
                            <th>상품명</th>
                            <th>구분</th>
                            <th>가격</th>
                            <th>재고</th>
                            <th>등록일</th>
                        </tr>
                        <%for (ProductDTO product : products) {%>
                        <tr>
                            <td><input type="checkbox" name=""/></td>
                            <td><img src="/Farmstory1/Farmstory/thumb/<%= product.getThumb1() %>" class="thumb" alt="샘플1"></td>
                            <td><%= product.getPno() %></td>
                            <td><%= product.getpName() %></td>
                            <td>
                            	<% 
                            		switch(product.getType()){
                            		case 2 : out.print("과일"); break;
                            		case 3 : out.print("야채"); break;
                            		case 4 : out.print("곡물"); break;
                            		}
                            	%>
                            
                            </td>
                            <td><%= product.getPriceWithComma() %>원</td>
                            <td><%= product.getStock() %></td>
                            <td><%= product.getRdate() %></td>
                        </tr>
                        <%	} %>
                    </table>

                    <p>
                        <a href="#" class="productDelete">선택삭제</a>
                        <a href="./productRegister.jsp" class="productRegister">상품등록</a>
                    </p>
                    
                    <p class="paging">
                	<% if(pageGroupStart>1){ %>
                    <a href="./productList.jsp?type=<%= type %>&pg=1" class="prev">처음으로</a>
                    <a href="./productList.jsp?type=<%= type%>&pg=<%= pageGroupStart -1 %>" class="prev">이전</a>
         			<%} %>
         			<%for(int i=pageGroupStart; i<=pageGroupEnd;i++){ %>
         			
                    <a href="./productList.jsp?type=<%= type %>&pg=<%= i %>" class="num <%=(currentPage==i)?"current":"" %>"><%= i %></a>                
             		<% } %>
             		<%if(pageGroupEnd < lastPageNum){ %>
                    <a href="./productList.jsp?type=<%= type%>&pg=<%= pageGroupEnd +1 %>" class="next">다음</a>
                    <a href="./productList.jsp?type=<%= type%>&pg=<%= lastPageNum %>" class="next">마지막으로</a>
                	<%} %>
                    </p>

                </article>

                
            </section>
        </main>
<%@ include file="./_footer.jsp"%>