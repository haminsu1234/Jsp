<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
	
	const price =${product.price}
	const delivery=${product.delivery}
	
	$(function(){
		$('input[name=count]').change(function(){
			//console.log('change!!');
			var count= document.getElementsByName("count")[0].value;
			let total=price*count
			let finalPrice=total+delivery;
			
			$('input[name=count]').val(count);
			$('input[name=total]').val(total);
			$('input[name=final]').val(finalPrice);
			$('.total').text(total.toLocaleString()+'원')
			console.log(total);
			})
		
	
	
		//주문하기 생각을 잘못함 이거 어짜피 ajax 로 해야함 
		//라고 생각했으나 ajax로 보낼라하니 스크립트가 다뻗어버리네...
		$('.btnOrder').click(function(e){
			e.preventDefault();
			
			$('#formOrder').submit();
		
		
		
		
		
		})
	
	
	
	
	
	
	})

	/*
	$('.btnOrder').click(function(e){
			e.preventDefault();
			
			  const pName =${product.getpName() }
			  const pno = ${product.getPno()} 
			  const  thumb2= ${product.getThumb2() }

			
			const jsonData={
					"pName" : pName,
					"pno" : pno,
					"thumb2" :thumb2,
					"delivery":delivery,
					"price" : price,
					"count" : count,
					"total" : total,
					"finalPrice":finalPrice,
			}
			
			console.log(jsonDa)
			
			$.ajax({
			    url: '/Farmstory2/market/order.do',
			    type: 'POST',
			    data: jsonData,
			    dataType: 'json',
			    error: function(xhr, status, error) {
			    	console.log("요청 실패: " + xhr.status + " " + xhr.statusText);
			    }
			  });
		
		
		
		
		})
	
	*/

	//var price= document.getElementsByName("price")[0].value;
	//var delivery= document.getElementsByName("delivery")[0].value;
	// 엄.... 이거 아닌듯?
	
	//function countvalue(){
	//	var count= document.getElementsByName("count")[0].value();
	//	var total=(price*count)+delivery
	//} 엄.... 이것도 접근이 틀렸음

</script>
        <div id="sub">
            <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
            <section class="market">
                <aside>
                    <img src="../images/sub_aside_cate2_tit.png" alt="장보기"/>

                    <ul class="lnb">
                        <li class="on"><a href="./market/list.do?type=1">장보기</a></li>
                    </ul>
                </aside>
                <article class="view">
                    <nav>
                        <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                        <p>
                            HOME > 장보기 > <em>장보기</em>
                        </p>
                    </nav>

                    <!-- 내용 시작 -->
                    <h3>기본정보</h3>
                    <div class="basic">
                        <img src="/Farmstory2/upload/${product.getThumb2() }" alt="딸기 500g">

                        <table border="0">                            
                            <tr>
                                <td>상품명</td>
                                <td>${product.getpName() }</td>
                            </tr>
                            <tr>
                                <td>상품코드</td>
                                <td>${product.getPno() }</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>
                                    <span>${product.getDeliveryWithComma() }</span>원
                                    <em>3만원 이상 무료배송</em>
                                </td>
                            </tr>
                            <tr>
                                <td>판매가격</td>
                                <td>${product.getPriceWithComma() }</td>
                            </tr>
                            <tr>
                                <td>구매수량</td>
                                <td>
                                    <input type="number" name="count" min="1" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>합계</td>
                                <td class="total">${product.getPriceWithComma() }</td>
                            </tr>
						<form id="formOrder" action="/Farmstory2/market/order.do" method="POST">
						    <input type="hidden" name="thumb2" value="${product.getThumb2() }" >
                        	<input type="hidden" name="pName" value="${product.getpName() }" >
                        	<input type="hidden" name="pNo" value="${product.getPno() }" >
                        	<input type="hidden" name="delivery" value="${product.getDelivery() }" >
                        	<input type="hidden" name="price" value="${product.getPrice() }" >
                        	<input type="hidden" name="count" value="1">
                        	<input type="hidden" name="total" value="${product.getPrice() }">
                        	<input type="hidden" name="final" value="${product.getPrice()+product.getDelivery() }">
						</form>
                            <a href="#" class="btnOrder">
                                <img src="../images/market_btn_order.gif" alt="바로 구매하기"/>
                            </a>
						
                        </table>
                    </div>
                    <h3>상품설명</h3>
                    <div class="detail">
                        <img src="/Farmstory2/upload/${product.getThumb3() }" alt="">

                    </div>

                    <h3>배송정보</h3>
                    <div class="delivery">
                        <p>
                            입금하신 이후 택배송장번호는 SMS(문자서비스)를 통해 고객님께 안내해드립니다.
                        </p>
                    </div>

                    <h3>교환/반품</h3>                  
                    <div class="exchange">
                        <table border="0">
                            <tr>
                                <td>교환 반품이 가능한 경우</td>
                                <td>
                                    <ul>
                                        <li>팜스토리 상품에 하자가 있거나 불량인 경우</li>
                                        <li>채소, 과일, 양곡등의 식품은 만1일 이내</li>
                                        <li>기타 상품은 수령일로부터 영업일 기준 일주일 이내</li>
                                        <li>받으신 상품이 표시사항과 다른 경우에는 받으신 날로부터 일주일 이내</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>교환 반품이 불가능한 경우</td>
                                <td>
                                    <ul>
                                        <li>신선 식품의 경우 단순히 마음에 들지 않는 경우</li>
                                        <li>단순 변심으로 상품이 가치가 훼손돼서 판매가 어려운 경우</li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- 내용 끝 -->
                </article>
            </section>

        </div>
 <%@ include file="../_footer.jsp" %>     
        
