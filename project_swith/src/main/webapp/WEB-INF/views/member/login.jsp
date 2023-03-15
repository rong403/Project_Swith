<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:light' rel='stylesheet' type='text/css'>
<!-- bootstrap  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/tooltip.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/login.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.js"></script>
<title>swith-로그인</title>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberInclude/loginInclude.jsp"/>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>