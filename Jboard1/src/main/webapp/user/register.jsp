<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jboard::register</title>
    <link rel="stylesheet" href="../css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Jboard1/js/zipcode.js"></script>

<script>

	//폼데이터 검증결과 상태 변수
	
	let isUidOk =false;
	let isPassOk =false;
	let isNameOk =false;
	let isNickOk =false;
	let isEmailOk =false;
	let isHpOk =false;
	
	let reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
	let rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	let reName  = /^[가-힣]{2,10}$/ 
	let reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
	let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	let reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;


	//유효성검증(Valiation)
	$(function (){
		
	
		
		//비밀번호검사
		$('input[name=pass2]').focusout(function(){
			
			const pass1 =$('input[name=pass1]').val();
			const pass2 =$('input[name=pass2]').val();
			
			if(pass1 == pass2 ){
				
				if(pass1.match(rePass)){
					$('.resultPass').css('color','blue').text('사용할수 있는 비밀번호입니다');
					isPassOk=true;
				}else{
					$('.resultPass').css('color','red').text('비밀번호는 숫자,영문,특수문자 조합 5자리 이상이여야 합니다');
					isPassOk=false;
				}
				
				
			}else{
				$('.resultPass').css('color','red').text('비밀번호가 일치하지 않습니다');
				isPassOk =false;
			}
			
		})
		
		
		
		
		//이름검사
		$('input[name=name]').focusout(function(){
			const name =$('input[name=name]').val();
			
			if(!name.match(reName)){
				$('.resultName').css('color','red').text('유효하지않는 이름입니다');
				isNameOk=false;
			}else{
				$('.resultName').text('');
				isNameOk=true;
			}
		
		})
		
		
		//이메일검사
	
		//휴대폰검사
				
		//최종전송
		$('#formUser').submit(function(e){
			
			//alert('전송');
			
			if(!isUidOk){
				alert('이름을 확인하세요.');
				return false;
			} 
				
			if(!isPassOk){
				alert('비밀번호을 확인하세요.');
				return false;
			}
			
			if(!isNameOk){
				alert('이름을 확인하세요.');
				return false;	
			}
			
			if(!isNickOK){
				alert('별명을 확인하세요.');
				return false;
			}
			
			if(!isEmailOk){
				alert('이메일을 확인하세요.');
				return false;
			}
			
			if(!isHpOk){
				alert('전화번호을 확인하세요.');
				return false;
			}
	
			return true;
		});
		
	})//jquery end

</script>
<script src="/Jboard1/js/checkUser.js"></script>



</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main>
            <section class="register">
                <form action="/Jboard1/user/registerProc.jsp" method="post" id="formUser">
                    <table border="1">
                        <caption>사이트 이용정보 입력</caption>
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력"/>
                                <button type="button" id = "btnCheckUid"><img src="../images/chk_id.gif" alt=""></button>
                                <span class="resultId"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="pass1" placeholder="비밀번호 입력" id="pass"/>                            
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password" name="pass2" placeholder="비밀번호 확인 입력" id="passconfirm"/>
                                <span class="resultPass"></span>
                            </td>
                        </tr>
                    </table>
                    <table border="1">
                        <caption>개인정보 입력</caption>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력"/>
                                <span class="resultName"></span>                            
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                                <input type="text" name="nick" placeholder="별명 입력"/>
                                <span class="resultNick"></span>                            
                            </td>
                        </tr>
                        <tr>
                            <td>E-Mail</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력"/>
                            	 <span class="resultEmail"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td>
                                <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                            	 <span class="resultHp"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div>
                                    <input type="text" name="zip" placeholder="우편번호" readonly/>                                
                                    <button type="button" class="btnZip" onclick="zipcode()"><img src="../images/chk_post.gif" alt=""></button>
                                </div>                            
                                <div>
                                    <input type="text" name="addr1"  placeholder="주소를 검색하세요." readonly/>
                                </div>
                                <div>
                                    <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                                </div>
                            </td>
                        </tr>
                    </table>
    
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnSubmit" value="회원가입"/>
                    </div>    
                </form>
            </section>
        </main>
        <footer>
            <p>ⓒcopyright haminsu.com</p>
        </footer>
    </div>
</body>
</html>