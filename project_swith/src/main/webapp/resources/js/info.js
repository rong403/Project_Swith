$(function(){
	$("#member_ad").click(function(){
		$(".member_div").css("display","block");
		$(".ask_div").css("display","none");
	});
	
	$("#ask_ad").click(function(){
		$(".member_div").css("display","none");
		$(".ask_div").css("display","block");
	});
});