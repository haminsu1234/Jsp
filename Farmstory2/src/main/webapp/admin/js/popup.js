/**
 * 
 */
		$(function(){
	
	    $('.showPopup').click(function(e){
	        e.preventDefault();
	        
	        const tr=$(this).parent().parent()
	        const orderNo = tr.find('.orderno').text();
	        const pName = tr.find('.pName').text();
	        const receiver = tr.find('.receiver').text();
	        const address = tr.find('.address').text();
	        const price = tr.find('.price').text();
	        const count = tr.find('.count').text();
	        const delivery = tr.find('.delivery').text();
	        const total = tr.find('.total').text();
	        const orderer = tr.find('.orderer').text();
	        const orderProduct = tr.find('.orderProduct').text();
	        const thumb1 = tr.find('.thumb1').text();
	        const date = tr.find('.date').text();
	        
	        const popup =$('#orderPopup');
	        popup.find('.orderProduct').text(orderProduct);
	        popup.find('.pName').text(pName);
	        popup.find('.price').text(price);
	        popup.find('.count').text(count);
	        popup.find('.delivery').text(delivery);
	        popup.find('.total').text(total);
	        popup.find('.orderer').text(orderer);
	        popup.find('.date').text(date);
	        popup.find('.address').text(address);
	        popup.find('.receiver').text(receiver);
	        popup.find('.date').text(date);
	        popup.find('.thumb1 > img ').attr('src','/Farmstory2/upload/'+thumb1);
	        
	        
	        $('#orderPopup').show();
	    });
	
	    $('#orderPopup .btnClose').click(function(){
	        $('#orderPopup').hide();
	    });
	
	})


        $(function(){

            $('.showPopup').click(function(e){
                e.preventDefault();
                const tr=$(this).parent().parent();
      
                
                const uid=tr.find('.uid').text();
                const name=tr.find('.name').text();
                const nick=tr.find('.nick').text();
                const email=tr.find('.email').text();
                const hp=tr.find('.hp').text();
                const grade=tr.find('.grade').text();
                const regDate=tr.find('.regDate').text();
                const regip=tr.find('.regip').text();
                const addr1=tr.find('.addr1').text();
                const addr2=tr.find('.addr2').text();
                
                const poup =$('#userPopup'); //원래는 popup인데 아래 text추가부분에서 오타를내서 그냥 const를 poup로 고침...
                poup.find('.useruid').text(uid);
                poup.find('.username').text(name);
                poup.find('.usernick').text(nick);
                poup.find('.useremail').text(email);
                poup.find('.userhp').text(hp);
                poup.find('.usergrade').text(grade);
                poup.find('.userregDate').text(regDate);
                poup.find('.userregip').text(regip);
                poup.find('.useraddr1').text(addr1);
                poup.find('.useraddr2').text(addr2);
   
                $('#userPopup').show();
            });

            $('#userPopup .btnClose').click(function(){
                $('#userPopup').hide();
            });

        });
        
        $(function(){

            $('.showPopup').click(function(e){
                e.preventDefault();
                $('#orderPopup').show();
            });

            $('#orderPopup .btnClose').click(function(){
                $('#orderPopup').hide();
            });

        });
        
        $(function(){
		$('input[name=all]').change(function(){
			
			const isChecked =$(this).is(':checked');
			
			if(isChecked){
				$('input[name=chk]').prop('checked',true)
			}else {
				$('input[name=chk]').prop('checked',false)
			}
			
		});
		})