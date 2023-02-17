$(function(){
	$('#btn-kakaopay').click(function(){
		var room_name = "임시 데이터 스터디룸A"; //$('#ajax_room_name').text();
		var cnt = 1;
		var total_price = $('#ajax_total_price').text();
		console.log(room_name);
		console.log(cnt);
		console.log(total_price);
		$.ajax({
			url:'kakaopay.cls',
			dataType:'json',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{
				room_name : room_name,
				cnt : cnt,
				total_price : total_price
			},
			success:function(data){
				console.log(data);
				var box = data.next_redirect_pc_url;
				location.href = box;
			},
			error:function(error){
				alert(error);
			}
		});
	});
});