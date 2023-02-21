$(function(){
	$('#btn-kakaopay').click(function(){
//		security 추가
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var start_time = $('#start_time>select').val();
		var end_time = $('#end_time>select').val();
		var room_name = $('#ajax_room_name').text();
		
		var cnt_str = $('#reserve_data>div').children('p').text();
		var cnt = cnt_str.substring(7, (cnt_str.length-2));
		var total_price_str = $('#ajax_total_price').text();
		var total_price = total_price_str.substring(11, (total_price_str.length-1));
		
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
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
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