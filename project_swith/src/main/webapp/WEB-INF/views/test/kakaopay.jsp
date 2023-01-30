<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaopay</title>
<script src="${path}/resources/js/jquery-3.6.1.js" type="text/javascript"></script>
<script src="${path}/resources/js/kakaopay.js" type="text/javascript"></script>
</head>
<body>
	<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>
</body>
</html>