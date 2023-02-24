<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE  html>
<html>
<head>
<title>MyPage</title>
<meta charset="utf-8">
<!-- CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/css/social-icons.css" type="text/css" media="screen">
<link rel="stylesheet" href="" type="text/css" media="screen" id="css-skins">
<!--[if IE 8]><link rel="stylesheet" type="text/css" media="screen" href="css/ie8-hacks.css"><![endif]-->
<!-- ENDS CSS -->
<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:light' rel='stylesheet' type='text/css'>
<!-- JS -->
<script src="<%=request.getContextPath()%>/resources/caja/js/jquery-1.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/jquery-ui-1.8.13.custom.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/easing.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/jquery.scrollTo-1.4.2-min.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/slides.min.jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/moveForm.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/custom.js"></script>
<!--[if IE]><script src="js/html5.js"></script><![endif]-->
<!--[if IE 6]><script src="js/DD_belatedPNG.js"></script><![endif]-->
<!-- ENDS JS -->
<!-- Swiper -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<!-- End Swiper -->
<!-- tabs -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/css/tabs.css" type="text/css" media="screen">
<script src="<%=request.getContextPath()%>/resources/caja/js/tabs.js"></script>
<!-- ENDS tabs -->
<!-- prettyPhoto -->
<script src="<%=request.getContextPath()%>/resources/caja/js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/js/prettyPhoto/css/prettyPhoto.css" type="text/css" media="screen">
<!-- ENDS prettyPhoto -->
<!-- superfish -->
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/resources/caja/css/superfish.css">
<script src="<%=request.getContextPath()%>/resources/caja/js/superfish-1.4.8/js/hoverIntent.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/superfish-1.4.8/js/superfish.js"></script>
<script src="<%=request.getContextPath()%>/resources/caja/js/superfish-1.4.8/js/supersubs.js"></script>
<!-- ENDS superfish -->
<!-- poshytip -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/js/poshytip-1.0/src/tip-twitter/tip-twitter.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/js/poshytip-1.0/src/tip-yellowsimple/tip-yellowsimple.css" type="text/css">
<script src="<%=request.getContextPath()%>/resources/caja/js/poshytip-1.0/src/jquery.poshytip.min.js"></script>
<!-- ENDS poshytip -->
<!-- ENDS caja -->

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
</style>
<!-- ENDS poshytip -->
</head>
<body>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!-- SECTION -->
<jsp:include page="/WEB-INF/views/mySchedule.jsp"/>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>