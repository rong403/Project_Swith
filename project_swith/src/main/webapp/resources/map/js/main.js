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
    
  //datepicker
  $.datepicker.setDefaults({
  	  	dateFormat: 'yy-mm-dd',
  	  	minDate : '0',
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

//룸 입실, 퇴실시간 선택 시 하단 결제 정보 면경
function roomTimeChangeAction() {
	var startTimeNum = parseInt($('#start_time > select').val());
	var endTimeNum = parseInt($('#end_time > select').val());
	var selectDate = $("#datepicker").val();
	var $reserve_data = $("#reserve_data");
	
	let addData = "";
	if(startTimeNum == 0 || endTimeNum == 0) {
		return;
	} else if(startTimeNum > endTimeNum) {
		console.log("startTimeNum : " + startTimeNum);
		console.log("endTimeNum : " + endTimeNum);
		$('#start_time > select').find("option:first").prop("selected",true);
		$('#end_time > select').find("option:first").prop("selected",true);
		alert("퇴실시간이 입실시간보다 빠릅니다. 다시 선택해주세요.");
		
		addData += "<p>날짜 및 입실/퇴실 시간을 선택해주세요.</p>";
	} else {
		var roomPrice = parseInt($("#room_price").val());
		
		var totalTime = endTimeNum-startTimeNum;
		var totalPrice = totalTime*roomPrice;
		
		addData += "<p>"+selectDate+" "+startTimeNum+"시 입실 "+endTimeNum+"시 퇴실</p>"+
			      "<div>"+
					   "<p>총 시간 : "+totalTime+"시간</p>"+
					   "<div><p id='ajax_total_price'>결제 예정 금액 : "+totalPrice+"원</p></div>"+
				   "</div>";
	}
	$reserve_data.html(addData);
}

//룸 정보 펼쳐보기
function detailTextHandler() {
	$('.detail_text.last').toggle();
	
	if($('.detail_text_hidden_img').css("transform") == "matrix(0, -1, 1, 0, 0, 0)") {
		$('.detail_text_hidden_img').css("transform", "rotate(90deg)");
	} else {
		$('.detail_text_hidden_img').css("transform", "rotate(270deg)");
	}
}

//예약 창 뒤로 가기
function reverseCloseHandler() {
	$('.study_info').css("display", "flex");
	$('.study_reserve').css("display", "none");
}

