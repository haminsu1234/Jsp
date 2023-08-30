    	window.onload=function(){
    		
    		const chk1=document.getElementsByName('chk1')[0];
    		const chk2=document.getElementsByName('chk2')[0];
    		
    		const btnNext=document.querySelector('.btnNext');
    		btnNext.addEventListener('click',function(e){
    			e.preventDefault();
    			
    			if(chk1.checked==false){
    				alert('이용약관에 동의하셔야합니다')
    				return;
    			}else if(chk2.checked==false){
    				alert('개인정보 취급방침에 동의하셔야 합니다')
    				return;
    			}else{
    				location.href='/Jboard2/user/register.do'
    			}
    			
    			
    		})
    	}
    