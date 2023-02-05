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
        
        //스터디 정보/예약 칸이 열려 있을 경우 닫기 버튼 처리
        if($('.reserve_box').css("display") != "none") {
            $('.close_button.sub').toggle();
        }
    }); 
    
    //스터디 정보/예약 칸 닫기
    $('#reserve_close_btn').click(function() {
        $('.reserve_box').css("display", "none");
        $('.close_button.sub').css("display", "none");
    }); 
    
    //룸 선택 시 예약 정보 열기
    $('.reserve_list').click(function() {
    	$('.study_info').css("display", "none");
    	$('.study_reserve').css("display", "flex");
    });
    
    //예약 정보 닫기
    $('#reserve_header_img').click(function() {
    	$('.study_info').css("display", "flex");
    	$('.study_reserve').css("display", "none");
    });
    
    //룸 정보 펼쳐보기
    $('#detail_text_hidden').click(function() {
    	$('.detail_text.last').toggle();
    	
    	if($('.detail_text_hidden_img').css("transform") == "matrix(0, -1, 1, 0, 0, 0)") {
    		$('.detail_text_hidden_img').css("transform", "rotate(90deg)");
    	} else {
    		$('.detail_text_hidden_img').css("transform", "rotate(270deg)");
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