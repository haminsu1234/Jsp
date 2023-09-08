<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <main>
<%@ include file="./_aside.jsp" %>
<script>









</script>
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
                        <c:forEach var="product" items="${requestScope.products}">
                        <tr>
                            <td><input type="checkbox" name="chk"/></td>
                            <td><img src="/Farmstory2/upload/${product.getThumb1()}" class="thumb" alt="샘플1"></td>
                            <td>${product.getPno()}</td>
                            <td>${product.getpName()}</td>
                            <td>
                            <c:if test="${product.getType() eq 2}"> 
                            	과일
                            </c:if>
                            <c:if test="${product.getType() eq 3}"> 
                            	야채
                            </c:if>
                            <c:if test="${product.getType() eq 4}"> 
                            	곡물
                            </c:if>
                            </td>
                            <td>${product.getPriceWithComma()}</td>
                            <td>${product.getStock()}</td>
                            <td>${product.getRdate()}</td>                            
                        </tr>
                        </c:forEach>
                    </table>

                    <p>
                        <a href="#" class="productDelete">선택삭제</a>
                        <a href="/Farmstory2/admin/productRegister.do" class="productRegister">상품등록</a>
                    </p>
                    
                    <p class="paging">
	        			<c:if test="${pageGroupStart > 1 }">
	                    <a href="/Farmstory2/admin/productList.do?type=1&pg=1" class="prev">처음으로</a>
	                    <a href="/Farmstory2/admin/productList.do?type=1&pg=${pageGroupStart -1}" class="prev">이전</a>
						</c:if>
	               
						<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}" >               
	                    <a href="/Farmstory2/admin/productList.do?type=1&pg=${i}" class="num ${currentPage==i ? 'current':''}">${i}</a>
	                    </c:forEach>
						
						<c:if test="${pageGroupEnd < lastPageNum }">
	                    <a href="/Farmstory2/admin/productList.do?type=1&pg=${pageGroupEnd +1 }" class="next">다음</a>
	                    <a href="/Farmstory2/admin/productList.do?type=1&pg=${lastPageNum}" class="next">마지막으로</a>
	              		</c:if>

                    </p>

                </article>

                
            </section>
        </main>
<%@ include file="./_footer.jsp" %>