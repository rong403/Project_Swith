<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE  html>
<html>
<head>
<title>swith-마이페이지</title>
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
</head>
<body>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!-- SECTION -->
<jsp:include page="/WEB-INF/views/myPage/myPageInclude/myReserve.jsp"/>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>