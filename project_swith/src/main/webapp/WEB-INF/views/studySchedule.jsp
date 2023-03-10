<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- schedule start -->
<div class="stdInfo_div fc" id="schedule_div">
	<div id="schedule_div_title" class="fc-button-group">
		<h5>일정관리</h5>
		<div>
			<button id="insertScheduleBtn" class="fc-button fc-button-primary">일정
				추가</button>
			<button id="updateScheduleBtn" class="fc-button fc-button-primary">일정
				수정</button>
		</div>
	</div>
	<div class="right-section schedule_wrap">
		<div id='calendar'></div>
	</div>
	<br> <br>
	<div id="groupAttend">
		<h5>모임멤버</h5>
		<a href="stdinfo"></a><img alt="" src="img/chat.png"></a>
		<hr>
		<br>
		<ul class="attend">
			<li data-sn="12">
				<div>
					<div class="header">
						<img src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
							alt="Avatar" class="avatar"> <span>이름</span> <span>모임장</span>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<br>
</div>
<div class="modal insertSchedule">
	<div class="modal_content_wrap insertSchedule">
		<div class="modal_content insertSchedule">
			<div class="mb-3">
				<div class="label_wrap top">
					<div>
						<label class="form-label" for="basic-default-fullname">일정
							메모</label>
					</div>
				</div>
				<input id="insertSchedule_content" type="text"
					name="schedule_content" class="form-control"
					placeholder="일정 메모를 입력해주세요.(최대 50자)" maxlength="50"> <span
					id="insertSchedule_text_cnt" class="tip_mark admin">0</span><span
					class="tip_mark admin">/50자</span>
			</div>
			<div class="mb-3 insertSchedule">
				<div>
					<div class="label_wrap">
						<label class="form-label" for="basic-default-fullname">시작시간</label>
					</div>
					<input class="form-control" name="start_date" type="datetime-local"
						value="" id="html5-datetime-local-input1">
				</div>

			</div>
			<div class="mb-3 insertSchedule">
				<div>
					<div class="label_wrap">
						<label class="form-label" for="basic-default-fullname">종료시간</label>
					</div>
					<input class="form-control" name="end_date" type="datetime-local"
						value="" id="html5-datetime-local-input2">
				</div>
			</div>
			<div class="btn_wrap">
				<button class="btn btn-sm btn-info" type="button"
					id="insertSchedule_form_btn">수정</button>
				<button class="btn btn-sm btn-secondary" type="button"
					id="insertSchedule_modal_close">닫기</button>
			</div>
		</div>
	</div>
</div>
<script>
var header = $("meta[name='_csrf_header']").attr('content');
var token = $("meta[name='_csrf']").attr('content');

const offset = 1000 * 60 * 60 * 9
const koreaNow = new Date((new Date()).getTime() + offset)

const searchParams = new URLSearchParams(location.search);
const urlParams = new URL(location.href).searchParams;
const study_no = urlParams.get('study_no');
document.getElementById('html5-datetime-local-input1').value= koreaNow.toISOString().slice(0, 16);
document.getElementById('html5-datetime-local-input2').value= koreaNow.toISOString().slice(0, 16);
$("#insertScheduleBtn").on("click", scheduleModalShowHandler);
$("#insertSchedule_form_btn").on("click", scheduleModalUpdateHandler);
$("#insertSchedule_modal_close").on("click", scheduleModalHideHandler);
function scheduleModalShowHandler() {
	$(".modal.insertSchedule").show();
}
function scheduleModalHideHandler() {
	$(".modal.insertSchedule").hide();
}
function scheduleModalUpdateHandler() {
	$.ajax({
		type: "POST",
		url: '<%=request.getContextPath()%>/insertSchedule',
		data: {schedule_content:$('#insertSchedule_content').val()
			, start_date:$('#html5-datetime-local-input1').val()
			, end_date:$('#html5-datetime-local-input2').val()
			, study_no:study_no
		},
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		success: function(data){
			if(data == 'fail'){
				alert("일정 추가를 실패했습니다.");
			}else{
				alert("일정이 추가되었습니다.");
				fullcalendarLoad();
			}
		}
	});
}
$('#insertSchedule_content').keyup(function(){
	var schedule_content = $('#insertSchedule_content');
	if (schedule_content.val().length == 0 || schedule_content.val() == '') {
		$('#insertSchedule_text_cnt').text('0');
	} else {
		$('#insertSchedule_text_cnt').text(schedule_content.val().length);
	}
});

// 채팅 추가
$("#menu_chat").click(function() {
    $("#s_content_box").load("<%=request.getContextPath()%>
	/echo/select");
	});
</script>
<!-- schedule end -->
