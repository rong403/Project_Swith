$(function(){
	
	//스터디 페이지 메뉴 목록 클릭 시 하단 div 처리	
	$("a.tab_btn").click(function(){
		$(this).addClass("active");
		$("a.tab_btn").not($(this)).removeClass("active");
		var $clickId = $("a.tab_btn.active").attr("id");
		switch($clickId) {
			case "btnInfo" : 
				$("div.stdInfo_div").css("display", "none");
				$("div.stdInfo_div#info_div").css("display", "block");
				break;
			case "btnSchedule" :
				$("div.stdInfo_div").css("display", "none");
				$("div.stdInfo_div#schedule_div").css("display", "block");
				calendar.render();
				break;
			case "btnBoard" :
				$("div.stdInfo_div").css("display", "none");
				$("div.stdInfo_div#board_div").css("display", "block");
				break;
			default :
				$("div.stdInfo_div").css("display", "none");
				$("div.stdInfo_div#info_div").css("display", "block");
				break;
		}
	});
	
	//스터디 관리자 화면 진입
	$("#stdInfo_btn").click(function(){
		adminMemberAjax();
		$("div.stdInfo_div").css("display", "none");
		$("div.stdInfo_div#admin_div").css("display", "block");
	});
	//스터디 관리자 화면 닫기
	$("#close_ad_img").click(function(){
		$("div.stdInfo_div").css("display", "none");
		$("div.stdInfo_div#info_div").css("display", "block");
	});
	
	
	//스터디 관리자 페이지 목록 처리	
	$("#member_ad").click(function(){
		adminMemberAjax();
		$(".member_div").css("display","block");
		$(".ask_div").css("display","none");
	});
	
	$("#ask_ad").click(function(){
		adminAskAjax();
		$(".member_div").css("display","none");
		$(".ask_div").css("display","block");
	});
});