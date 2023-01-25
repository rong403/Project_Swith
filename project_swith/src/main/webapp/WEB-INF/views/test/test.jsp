<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/insert" method="post">
	id:<input type="text" name="id">
	<br>
	pwd:<input type="password" name="pwd">
	<button>DB테스트</button>
</form>
<form action="<%=request.getContextPath()%>/login" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	id:<input type="text" name="id">
	<br>
	pwd:<input type="password" name="pwd">
	<button>로그인테스트</button>
</form>
</body>
</html>