$(function(){
	$('#btn-kakaopay').click(function(){
		$.ajax({
			url:'kakaopay.cls',
			dataType:'json',
			success:function(data){
				console.log(data);
				var box = data.next_redirect_pc_url;
//				var kakaowind = window.open(box); // 새창 열기
//				kakaowind.close();
				location.href = box;
				
			},
			error:function(error){
				alert(error);
			}
		});
	});
});