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
			<button id="viewPlaceBtn" onClick="location.href='<%=request.getContextPath()%>/place'" class="fc-button fc-button-primary">스터디 룸 예약</button>
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
					id="insertSchedule_form_btn">추가</button>
				<button class="btn btn-sm btn-secondary" type="button"
					id="insertSchedule_modal_close">닫기</button>
			</div>
		</div>
	</div>
</div>
<div class="modal updateSchedule">
	<div class="modal_content_wrap insertSchedule">
		<div class="modal_content insertSchedule">
			<div class="mb-3">
				<div class="label_wrap top">
					<input id="updateSchedule_no" type="hidden" name="schedule_no">
					<div>
						<label class="form-label" for="basic-default-fullname">일정
							메모</label>
					</div>
				</div>
				<input id="updateSchedule_content" type="text"
					name="schedule_content" class="form-control"
					placeholder="일정 메모를 입력해주세요.(최대 50자)" maxlength="50"> <span
					id="updateSchedule_text_cnt" class="tip_mark admin">0</span><span
					class="tip_mark admin">/50자</span>
			</div>
			<div class="mb-3 insertSchedule">
				<div>
					<div class="label_wrap">
						<label class="form-label" for="basic-default-fullname">시작시간</label>
					</div>
					<input class="form-control" name="start_date" type="datetime-local"
						value="" id="html5-datetime-local-input3">
				</div>

			</div>
			<div class="mb-3 insertSchedule">
				<div>
					<div class="label_wrap">
						<label class="form-label" for="basic-default-fullname">종료시간</label>
					</div>
					<input class="form-control" name="end_date" type="datetime-local"
						value="" id="html5-datetime-local-input4">
				</div>
			</div>
			<div class="mb-3 insertSchedule">
				<div></div>
				<button id="schedule_delete_btn" type="button" class="btn btn-dark">일정 삭제</button>
			</div>
			<div class="btn_wrap">
				<button class="btn btn-sm btn-info" type="button"
					id="updateSchedule_form_btn">수정</button>
				<button class="btn btn-sm btn-secondary" type="button"
					id="updateSchedule_modal_close">닫기</button>
			</div>
		</div>
	</div>
</div>
<script>
let calendar = '';
document.addEventListener('DOMContentLoaded', fullcalendarLoad);
const offset = 1000 * 60 * 60 * 9;
const koreaNow = new Date((new Date()).getTime() + offset);
function fullcalendarLoad() {
	
	var year = koreaNow.getFullYear();
	var month = ('0' + (koreaNow.getMonth() + 1)).slice(-2);
	var day = ('0' + koreaNow.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	const searchParams = new URLSearchParams(location.search);
	const urlParams = new URL(location.href).searchParams;
	const study_no = urlParams.get('study_no');
	$(function () {
      var request = $.ajax({
          url: "<%=request.getContextPath()%>/study/calendar",
          method: "GET",
          dataType: "json",
          data: {study_no:study_no}
      });

      request.done(function (data) {
      console.log(data); // log 로 데이터 찍어주기.
          
	var calendarEl = document.getElementById('calendar');

  calendar = new FullCalendar.Calendar(calendarEl, {
    initialDate: dateString,
    initialView: 'timeGridWeek',
    nowIndicator: true,
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    locale: 'ko',
    navLinks: true, // can click day/week names to navigate views
    editable: false,
    selectable: true,
    selectMirror: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: data,
    eventClick:function(data){
    	$(".modal.updateSchedule").show();
    	document.getElementById('updateSchedule_no').value = data.event.id;
    	document.getElementById('updateSchedule_content').value = data.event.title;
    	document.getElementById('html5-datetime-local-input3').value = data.event.startStr.slice(0, 16);
    	document.getElementById('html5-datetime-local-input4').value = data.event.endStr.slice(0, 16);
    }
  });
  
  calendar.render();
});

request.fail(function( jqXHR, textStatus ) {
  alert( "Request failed: " + textStatus );
});
  });

};

var header = $("meta[name='_csrf_header']").attr('content');
var token = $("meta[name='_csrf']").attr('content');

const searchParams = new URLSearchParams(location.search);
const urlParams = new URL(location.href).searchParams;
const study_no = urlParams.get('study_no');

/* 일정추가 */
$("#insertScheduleBtn").on("click", scheduleModalShowHandler);
$("#insertSchedule_form_btn").on("click", scheduleModalUpdateHandler);
$("#insertSchedule_modal_close").on("click", scheduleModalHideHandler);
function scheduleModalShowHandler() {
	$(".modal.insertSchedule").show();
	document.getElementById('html5-datetime-local-input1').value= koreaNow.toISOString().slice(0, 16);
	document.getElementById('html5-datetime-local-input2').value= koreaNow.toISOString().slice(0, 16);
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

/* 일정수정/삭제 */
$("#updateSchedule_form_btn").on("click", scheduleModalUpdateHandler2);
$("#schedule_delete_btn").on("click", scheduleModalDeleteHandler2);
$("#updateSchedule_modal_close").on("click", scheduleModalHideHandler2);
function scheduleModalHideHandler2() {
	$(".modal.updateSchedule").hide();
}
function scheduleModalUpdateHandler2() {
	$.ajax({
		type: "POST",
		url: '<%=request.getContextPath()%>/updateSchedule',
		data: {schedule_no:$('#updateSchedule_no').val()
			, schedule_content:$('#updateSchedule_content').val()
			, start_date:$('#html5-datetime-local-input3').val()
			, end_date:$('#html5-datetime-local-input4').val()
		},
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		success: function(data){
			if(data == 'fail'){
				alert("일정 수정을 실패했습니다.");
			}else{
				alert("일정이 수정되었습니다.");
				fullcalendarLoad();
			}
		}
	});
}
function scheduleModalDeleteHandler2() {
	$.ajax({
		type: "POST",
		url: '<%=request.getContextPath()%>/deleteSchedule',
		data: {schedule_no:$('#updateSchedule_no').val()
		},
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		success: function(data){
			if(data == 'fail'){
				alert("일정 삭제를 실패했습니다.");
			}else{
				alert("일정이 삭제되었습니다.");
				$(".modal.updateSchedule").hide();
				fullcalendarLoad();
			}
		}
	});
}
$('#updateSchedule_content').keyup(function(){
	var schedule_content = $('#updateSchedule_content');
	if (schedule_content.val().length == 0 || schedule_content.val() == '') {
		$('#updateSchedule_text_cnt').text('0');
	} else {
		$('#updateSchedule_text_cnt').text(schedule_content.val().length);
	}
});

</script>
<!-- schedule end -->
