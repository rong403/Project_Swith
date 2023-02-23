<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE  html>
<html>
<head>
<title>Caja</title>
<meta charset="utf-8">

<!-- bootstrap  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/styles.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/social-icons.css" type="text/css" media="screen">
<link rel="stylesheet" href="" type="text/css" media="screen" id="css-skins">
<!--[if IE 8]><link rel="stylesheet" type="text/css" media="screen" href="css/ie8-hacks.css"><![endif]-->
<!-- ENDS CSS -->
<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:light' rel='stylesheet' type='text/css'>
<!-- JS -->
<script src="<%=request.getContextPath()%>/resources/map/js/jquery-3.6.1.js"></script>
<!-- <script src="js/jquery-1.5.1.min.js"></script> -->
<script src="js/jquery-ui-1.8.13.custom.min.js"></script>
<script src="js/easing.js"></script>
<script src="js/jquery.scrollTo-1.4.2-min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<script src="js/moveForm.js"></script>
<!-- <script src="js/custom.js"></script> -->
<!--[if IE]><script src="js/html5.js"></script><![endif]-->
<!--[if IE 6]><script src="js/DD_belatedPNG.js"></script><![endif]-->
<!-- ENDS JS -->
<!-- Swiper -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<!-- End Swiper -->
<!-- tabs -->
<link rel="stylesheet" href="css/tabs.css" type="text/css" media="screen">
<script src="js/tabs.js"></script>
<!-- ENDS tabs -->
<!-- prettyPhoto -->
<script src="js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
<link rel="stylesheet" href="js/prettyPhoto/css/prettyPhoto.css" type="text/css" media="screen">
<!-- ENDS prettyPhoto -->
<!-- superfish -->
<link rel="stylesheet" media="screen" href="css/superfish.css">
<script src="js/superfish-1.4.8/js/hoverIntent.js"></script>
<script src="js/superfish-1.4.8/js/superfish.js"></script>
<script src="js/superfish-1.4.8/js/supersubs.js"></script>
<!-- ENDS superfish -->
<!-- poshytip -->
<link rel="stylesheet" href="js/poshytip-1.0/src/tip-twitter/tip-twitter.css" type="text/css">
<link rel="stylesheet" href="js/poshytip-1.0/src/tip-yellowsimple/tip-yellowsimple.css" type="text/css">
<!-- <script src="js/poshytip-1.0/src/jquery.poshytip.min.js"></script> -->
<!-- ENDS poshytip -->

    <!-- Bootstrap core CSS -->
    <!-- <link href="css/bootstrap.min.jh.css" rel="stylesheet"> -->

    <!-- jquery -->
    <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- schedule -->
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
.schedule_wrap{
	height: 100%;
}
#calendar {
    width: 900px;
    margin: 0 auto;
    height: 600px;
  }
</style>
<!-- 스터디 관리자페이지용  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/info.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/checkBox.css">
<script src="<%=request.getContextPath()%>/resources/js/info.js"></script>

<style>

.movieChartBeScreen_btn_wrap .tabBtn_wrap {
  display: inline-flex;
}
.movieChartBeScreen_btn_wrap .tabBtn_wrap h3 {
  height: auto;
  margin: 0;
  line-height: 1em;
  background-image: none;
}
.movieChartBeScreen_btn_wrap .tabBtn_wrap h3 ~ h3 {
  position: relative;
  margin-left: 32px;
}
.movieChartBeScreen_btn_wrap .tabBtn_wrap h3 ~ h3:before {
  content: "";
  display: block;
  position: absolute;
  left: -16px;
  top: 50%;
  width: 1px;
  height: 14px;
  margin-top: -7px;
  background-color: #d8d8d8;
}
.movieChartBeScreen_btn_wrap .tabBtn_wrap h3 a {
  font-weight: 400;
  font-size: 26px;
  color: #666;
  line-height: 1.423em;
}
.movieChartBeScreen_btn_wrap .tabBtn_wrap h3 a.active {
  font-weight: 700;
  color: #222;
}

</style>

</head>
<body>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/loginheader.jsp"/>
<!-- SECTION -->
<jsp:include page="/WEB-INF/views/stdInfoSection.jsp"/>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>