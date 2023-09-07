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