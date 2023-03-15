<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/map_home_section.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/jquery-ui.structure.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/jquery-ui.theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/datepicker_theme.css">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/map/js/jquery-3.6.1.js"></script>
    <script src="<%=request.getContextPath()%>/resources/map/js/jquery-ui.js"></script>
    <script src="<%=request.getContextPath()%>/resources/map/js/main.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22e814de5ddfa7ab67223da7c1c400b9&libraries=services,clusterer,drawing"></script>
	<script src="<%=request.getContextPath()%>/resources/map/js/kakao_map.js"></script>
    <title>swith-예약 확인</title>
</head>
<body>
<script>
	var msg = "${msgAlert}";
	if(msg){
		alert(msg);
	}
</script>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/mapheader.jsp"/>
<!-- SECTION -->
<jsp:include page="/WEB-INF/views/reservedSection.jsp"/>
<!-- hhjng kakaopay -->
<script src="<%=request.getContextPath()%>/resources/js/kakaopay.js"></script>
</body>
</html>