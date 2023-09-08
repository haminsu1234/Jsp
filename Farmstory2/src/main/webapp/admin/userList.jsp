<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
        <main>
<%@ include file="./_aside.jsp" %>
            <section id="orderList">
                <nav>
                    <h3>회원목록</h3>
                </nav>

                <article>
					<form id="formUser" action="/Farmstory2/admin/modify.do" method="post">
                    <table border="0">
                        <tr>
                            <th><input type="checkbox" name="all"/></th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>별명</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <th>등급</th>
                            <th>가입일</th>
                            <th>확인</th>
                        </tr>
                        <c:forEach var="user" items="${requestScope.users }">
                       
                        <tr>
                            <td><input type="checkbox" name="chk"/></td>
                            <td class="uid">${user.uid }</td>
                            <td class="name">${user.name }</td>                            
                            <td class="nick">${user.nick }</td>
                            <td class= "email">${user.email }</td>
                            <td class= "hp">${user.hp }</td>
                            <td>
                            <!--  이부분에서 생각해봐야할것 
                            
                            	지금 현재 선택한 값이 상세정보 확인 (팝업창) 띄우는데서 들어가는게 아님
                            	팝업창은 현재 db에 저장되어 있는 값이 들어가는 거임
                            
                            
                             -->
                                <select  name="grade">
                                    <option ${ user.role eq 'admin' ? 'selected class="grade"':''}>admin</option>
                                    <option ${ user.role eq 'USER' ? 'selected class="grade"':''} >USER</option>
                                    <option ${ user.role eq 'seller' ? 'selected class="grade"':''}>seller</option>
                                    <option ${ user.role eq 'unkown' ? 'selected class="grade"':''}>unkown</option>
                                    <option ${ user.role eq 'unkown' ? 'selected class="grade"':''}>unkown2</option>
                                </select>
                            </td>
                            <td class="regDate">${user.regDate }</td>
                            <td class="hidden regip">${user.regip }</td>
                            <td class="hidden addr1">${user.addr1} </td>
                            <td class="hidden addr2">${user.addr2}</td>
                            <td><a href="#" class="showPopup">[상세확인]</a></td>
                        </tr>
                        </c:forEach>
                    </table>
					</form>
                    <p>
                        <a href="#" class="orderDelete">선택수정</a>                        
                    </p>
                    
                    <p class="paging">
	        			<c:if test="${pageGroupStart > 1 }">
	                    <a href="/Farmstory2/admin/orderList.do?pg=1" class="prev">처음으로</a>
	                    <a href="/Farmstory2/admin/orderList.do?pg=${pageGroupStart -1}" class="prev">이전</a>
						</c:if>
	               
						<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}" >               
	                    <a href="/Farmstory2/admin/orderList.do?pg=${i}" class="num ${currentPage==i ? 'current':''}">${i}</a>
	                    </c:forEach>
						
						<c:if test="${pageGroupEnd < lastPageNum }">
	                    <a href="/Farmstory2/admin/orderList.do?pg=${pageGroupEnd +1 }" class="next">다음</a>
	                    <a href="/Farmstory2/admin/orderList.do?pg=${lastPageNum}" class="next">마지막으로</a>
	              		</c:if>

                    </p>
                </article>
            </section>
        </main>


        <div id="userPopup">
            <section>
                <nav>
                    <h1>사용자 상세정보</h1>
                    <button class="btnClose">닫기</button>
                </nav>

                <article>  
                    <h3>기본정보</h3>
                    <table border="0">
                        <tr>
                            <td>아이디</td>
                            <td class="useruid">a101</td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td class="username">김유신</td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td class="usernick">유신101</td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td class="useremail">yusin101@naver.com</td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td class="userhp">010-1234-1001</td>
                        </tr>
                        <tr>
                            <td>등급</td>
                            <td class="usergrade">2등급(준회원)</td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <p class="useraddr1">
                                    부산광역시 부산진구 대연동 120
                                </p>
                                <p class="useraddr2">
                                    한빛빌딩 10층
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>아이피</td>
                            <td class="userregip">192.168.10.112</td>
                        </tr>
                        <tr>
                            <td>회원가입일</td>
                            <td class="userregDate">2023-01-01 13:06:14</td>
                        </tr>
                    </table>
                </article>
            </section>
        </div>
    </div>
<%@ include file="./_footer.jsp" %>