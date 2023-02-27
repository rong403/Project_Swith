<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE  html>
<html>
<head>
<title>MyPage</title>
<meta charset="utf-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:light' rel='stylesheet' type='text/css'>
<!-- bootstrap  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/tooltip.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage.css">
<!-- ENDS CSS -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/myPage.js"></script>

<!-- fullcalendar -->
<script src='<%=request.getContextPath()%>/resources/fullcalendar-6.0.3/dist/index.global.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	      
	var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialDate: dateString,
      initialView: 'timeGridWeek',
      nowIndicator: true,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      selectable: true,
      selectMirror: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2023-02-01',
        },
        {
          title: 'Long Event',
          start: '2020-09-07',
          end: '2023-02-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-02-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-02-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2023-02-11',
          end: '2023-02-13'
        },
        {
          title: 'Meeting',
          start: '2023-02-12T10:30:00',
          end: '2023-02-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2023-02-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2023-02-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2023-02-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2023-02-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2023-02-13T07:00:00'
        }
      ]
    });

    calendar.render();
  });
</script>

<style>

#calendar {
    margin: 0 auto;
    width: 600px;
  }
.social >li > a > span{
	color: white;
}
.profile_update_btn{
}



</style>
<!-- ENDS poshytip -->
</head>
<body>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!-- SECTION -->
<jsp:include page="/WEB-INF/views/myPage/myPageInclude/mySchedule.jsp"/>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>