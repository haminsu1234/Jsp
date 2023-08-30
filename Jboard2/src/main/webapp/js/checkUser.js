	$(function(){

		
		//아이디중복체크
		const inputUid = document.getElementsByName('uid')[0];
		const uidResult = document.getElementsByClassName('uidResult')[0];
		const btnCheckUid = document.getElementById('btnCheckUid');
		
		if(btnCheckUid != null){
		btnCheckUid.onclick = function(){
			
			
			
			if(!(inputUid.value).match(reUid)){
				uidResult.innerText='유효한 아이디가 아닙니다.';
				uidResult.style.color='red';
				isUidOk = false;
				return; // 종료
			}
			const xhr = new XMLHttpRequest();
			xhr.open('GET', '/Jboard2/user/checkUid.do?uid='+inputUid.value);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				
				if(xhr.readyState == XMLHttpRequest.DONE){
					
					if(xhr.status == 200){
						
						const data = JSON.parse(xhr.response);
						
						if(data.result > 0){
							uidResult.innerText = '이미 사용중인 아이디 입니다.';
							uidResult.style.color = 'red';
							isUidOk=false;							
						}else{
							uidResult.innerText = '사용 가능한 아이디 입니다.';
							uidResult.style.color = 'green';
							isUidOk=true;
						}
					}
				}// readyState end
			}// onreadystatechange end
		}// btnCheckUid onclick end
		}
		
		//닉네임중복체크
		$('#btnCheckNick').click(function(){
			
			const nick = $('input[name=nick]').val();
			if(!nick.match(reNick)){
				$('.nickResult').css('color', 'red').text('유효한 닉네임이 아닙니다.');
				isNickOk = false;
				return;
			}
		
			
			$.ajax({
				url:'/Jboard2/user/checkNick.do?nick='+nick,
				type:'get',
				dataType:'json',
				success: function(data){
					
					if(data.result2 > 0){
						$('.nickResult').css('color', 'red').text('이미 사용중인 별명입니다.');
						isNickOk = false;
					}else{
						$('.nickResult').css('color', 'green').text('사용 가능한 별명입니다.');
						isNickOk = true;
					}
					
				}
			});
			
		});// btnCheckNick end
		//전화번호중복체크
		$('input[name=hp]').focusout(function(){
			
			
			
			const hp = $(this).val();
			const resultHp = document.getElementById('hpResult');
			const url = '/Jboard2/user/checkHp.do?hp='+hp;
			
			if(!hp.match(reHp)){
				$('.hpResult').css('color', 'red').text('유효한휴대폰번호가 아닙니다.');
		
				isHpOk = false;
				return;
			}
			
			$.get(url, function(result3){
				const data=JSON.parse(result3);
				if(data.result3 > 0){
					$('.hpResult').css('color', 'red').text('이미 사용중인 휴대폰입니다.');
					isHpOk=false;
				}else{
					$('.hpResult').css('color', 'green').text('사용 가능한 휴대폰입니다.');
					isHpOk=true;
				}
				
			});
		});
		

		
	})// onload end
	
