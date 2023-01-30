$(function(){
	$('#btn-kakaopay').click(function(){
		$.ajax({
			url:'/swith/paytest/kakaopay.cls',
			dataType:'json',
			success:function(data){
				var box = data.next_redirect_pc_url;
				window.open(box); // 새창 열기
//				location.href = box;
			},
			error:function(error){
				alert(error);
			}
		});
	});
});