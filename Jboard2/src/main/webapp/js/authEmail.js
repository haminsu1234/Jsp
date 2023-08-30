	//이메일인증코드전송
	$(function(){
		

		let preventDoubleClick=false;
		
		
		$('#btnEmailCode').click(function(){
			
			const name =$('input[name=name]').val();
			const email =$('input[name=email]').val();
			const type =$('input[name=type]').val();
			const uid =$('input[name=uid]').val();
			
			const jsonData={
				"name":name,
				"email":email,
				"type":type,
				"uid":uid
				
			};
			
			
			if(preventDoubleClick){
				return;
			};
			
			preventDoubleClick=true;
			$('.emailResult').text('인증코드 전송 중 입니다. 잠시만 기다리세요...');
			
			setTimeout(function(){
				$.ajax({
					url:'/Jboard2/user/authEmail.do',
					type: 'GET',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						
						if(data.result4 > 0){
							$('.emailResult').css('color','red').text('이미사용중인 이메일입니다.');
							isEmailOk=false;
								
							if(data.status >0){
								$('.resultEmailForId').css('color','green').text('이메일을 확인후 인증코드를 입력하세요');
								$('input[name=auth]').prop('disabled',false);
							}else {
								$('.resultEmailForId').css('color','red').text('해당하는 사용자 또는 이메일이 존재하지 않습니다.');
							}
								
						}else{
							if(data.status >0){
								$('.emailResult').css('color','green').text('이메일을 확인후 인증코드를 입력하세요');
								$('.auth').show();
								$('#email').attr("readonly",true);
							}else {
								$('.emailResult').css('color','red').text('인증코드 전송이 실패했습니다 잠시후 다시 시도하십시오');
								$('.resultEmailForId').css('color','red').text('해당하는 사용자 또는 이메일이 존재하지 않습니다.');
								isEmailOk=false;
							}
						
						}
						preventDoubleClick =false;						
					}
				})
			},1000);
		})
		//이메일 인증코드확인
		$('#btnEmailAuth').click(function(){
			
			const code =$('input[name=auth]').val();
			const jsonData={
				"code" : code
			};
			
			
			$.ajax({
				url:'/Jboard2/user/authEmail.do',
				type:'POST',
				data:jsonData,
				dataType:'json',
				success : function(data){
					
						if(data.result >0){
							$('.emailResult').css('color','green').text('이메일 인증이 완료되었습니다');
							$('.resultEmailForId').css('color','green').text('이메일 인증이 완료되었습니다');
							isEmailOk=true;
						}else {
							$('.emailResult').css('color','red').text('이메일 인증이 실패했습니다 잠시후 다시 시도하십시오');
							$('.resultEmailForId').css('color','red').text('이메일 인증이 실패했습니다 잠시후 다시 시도하십시오');
							isEmailOk=false;
						}
				}
			})
			
		});
	})