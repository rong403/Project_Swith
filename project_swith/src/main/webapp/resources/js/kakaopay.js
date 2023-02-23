$(function(){
	$('#btn-kakaopay').click(function(){
//		security 추가
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		//스터디룸 정보
		var area = $('#area_code option:selected').text();
		var pl_name = $('.reserve_header>h2').text();
		var room_name = $('#ajax_room_name').text();
		
		//예약 날짜
		var ryear = $('.ui-datepicker-year').text();
		var rmonth_str = $('.ui-datepicker-month').text();
		var rmonth = rmonth_str.substring(0, (rmonth_str.length-1));
		var rday = $('.ui-state-default.ui-state-active').text();
		var reserve_date = ryear + '/' + rmonth + '/' + rday;
		
		//예약 시간
		var ajax_start_time = $('#start_time>select').val();
		var ajax_end_time = $('#end_time>select').val();
		
		//개수, 총 금액
		var cnt_str = $('#reserve_data>div').children('p').text();
		var cnt = cnt_str.substring(7, (cnt_str.length-2));
		var total_price_str = $('#ajax_total_price').text();
		var total_price = total_price_str.substring(11, (total_price_str.length-1));

		$.ajax({
			url:'kakaopay.cls',
			dataType:'json',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:{
				room_name : room_name,
				cnt : cnt,
				total_price : total_price,
				reserve_date : reserve_date,
				ajax_start_time : ajax_start_time,
				ajax_end_time : ajax_end_time,
				area : area,
				pl_name : pl_name
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