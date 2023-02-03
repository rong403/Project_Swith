$(function() {
    var cnt1 = 0;
    $('#all_hidden_button').click(function() {
        cnt1 += 1;
        if(cnt1 == 2){
            $('.map_home_box').css("transform", "translateX(0%)");
            $('.all_hidden_button_img').css("transform", "rotate(0deg)");
            cnt1 = 0;
        } else{
            $('.map_home_box').css("transform", "translateX(-100%)");
            $('.all_hidden_button_img').css("transform", "rotate(180deg)");
        }
    }); 
    var cnt2 = 0;
    $('#reserve_hidden_btn').click(function() {
    	cnt2 += 1;
        if(cnt2 == 2){
            $('.reserve_box').css("display", "block");
            $('.reserve_hidden_btn_img').css("transform", "rotate(0deg)");
            cnt2 = 0;
        } else{
            $('.reserve_box').css("display", "none");
            $('.reserve_hidden_btn_img').css("transform", "rotate(180deg)");
        }
    }); 
    

  //datepicker
  $.datepicker.setDefaults({
  	  	dateFormat: 'yy-mm-dd',
  	  	prevText: '이전 달',
  	  	nextText: '다음 달',
  	 	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  	  	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  	  	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
  	  	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
  	  	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
  	  	showMonthAfterYear: true,
  	  	yearSuffix: '년'
  	});
  
  $(function() {
   		$( "#datepicker" ).datepicker();
    
    	$("#datepicker").on("change",function(){
        	var selected = $(this).val();
        	alert(selected);
    	});
  });
})