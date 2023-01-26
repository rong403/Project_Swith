<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



<script src='<%=request.getContextPath()%>/resources/fullcalendar-6.0.3/dist/index.global.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    /* 현재 날짜 구하기 */
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);
    var dateString = year + '-' + month  + '-' + day;
    
    
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialDate: dateString,
      timeZone: 'UTC',
      initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
      nowIndicator: true,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title,addEventButton',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      selectable: true,
      selectMirror: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
    	  {
              title:'일정',
              start:'2021-05-26 00:00:00',
              end:'2021-05-27 24:00:00' 
              // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
          }


      ], customButtons: {
          addEventButton: { // 추가한 버튼 설정
              text : "일정 추가",  // 버튼 내용
              click : function(){ // 버튼 클릭 시 이벤트 추가
                  $("#calendarModal").modal("show"); // modal 나타내기

                  $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                      var content = $("#calendar_content").val();
                      var start_date = $("#calendar_start_date").val();
                      var end_date = $("#calendar_end_date").val();
                      
                      //내용 입력 여부 확인
                      if(content == null || content == ""){
                          alert("내용을 입력하세요.");
                      }else if(start_date == "" || end_date ==""){
                          alert("날짜를 입력하세요.");
                      }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                          alert("종료일이 시작일보다 먼저입니다.");
                      }else{ // 정상적인 입력 시
                          var obj = {
                              "title" : content,
                              "start" : start_date,
                              "end" : end_date
                          }//전송할 객체 생성

                          console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                      }
                  });
              }
          }
      }


    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

	 <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>

	
</body>
</html>
