<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE  html>
<html>
<head>
<title>Caja</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<!-- bootstrap  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/styles.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/social-icons.css" type="text/css" media="screen">
<link rel="stylesheet" href="" type="text/css" media="screen" id="css-skins">
<link rel="stylesheet" href="resources/css/tooltip.css" type="text/css">
<!--[if IE 8]><link rel="stylesheet" type="text/css" media="screen" href="css/ie8-hacks.css"><![endif]-->
<!-- ENDS CSS -->
<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:light' rel='stylesheet' type='text/css'>
<!-- JS -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.js"></script>
<!-- <script src="js/jquery-1.5.1.min.js"></script> -->
<!--<script src="js/jquery-ui-1.8.13.custom.min.js"></script> -->
<!--<script src="js/easing.js"></script> -->
<!--<script src="js/jquery.scrollTo-1.4.2-min.js"></script> -->
<!--<script src="js/slides.min.jquery.js"></script> -->
<!--<script src="js/moveForm.js"></script> -->
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
<!--<script src="js/prettyPhoto/js/jquery.prettyPhoto.js"></script>-->
<!--<link rel="stylesheet" href="js/prettyPhoto/css/prettyPhoto.css" type="text/css" media="screen">-->
<!-- ENDS prettyPhoto -->
<!-- superfish -->
<!--<link rel="stylesheet" media="screen" href="css/superfish.css">-->
<!--<script src="js/superfish-1.4.8/js/hoverIntent.js"></script>-->
<!--<script src="js/superfish-1.4.8/js/superfish.js"></script>-->
<!--<script src="js/superfish-1.4.8/js/supersubs.js"></script>-->
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
  let calendar = '';
  document.addEventListener('DOMContentLoaded', fullcalendarLoad);
  function fullcalendarLoad() {
    
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
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
      editable: true,
      selectable: true,
      selectMirror: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: data
    });
    
    calendar.render();
});

request.fail(function( jqXHR, textStatus ) {
    alert( "Request failed: " + textStatus );
});
    });

};

</script>
<style>
#schedule_div_title{
	display: flex;
	justify-content: space-between;
}
#schedule_div_title div{
	margin-right: 20px
}
#schedule_div_title button{
	background-color: var(--fc-button-bg-color);
    border-color: var(--fc-button-border-color);
    color: var(--fc-button-text-color);
}
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
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!-- SECTION -->
<jsp:include page="/WEB-INF/views/stdInfoSection.jsp"/>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>