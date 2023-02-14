<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
 
    String name = "";
    if(principal != null) {
        name = auth.getName();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<span>로그인 성공</span>
<sec:authorize access="isAuthenticated()">
    <h5><%=name %>님, 반갑습니다.</h5>
    <form action="<%=request.getContextPath()%>/logout" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">LOGOUT</button>
    </form>
</sec:authorize>

<div id="search_user_account">
	<a href="<%=request.getContextPath()%>/admin">관리자 페이지</a>
	<sec:authorize access="hasRole('ADMIN')">
	    <a href="<%=request.getContextPath()%>/admin">관리자 페이지(숨김)</a>
	</sec:authorize>
	
    <span></span>
    <a href="<%=request.getContextPath()%>/user">유저 페이지</a>
    <sec:authorize access="hasRole('USER')">
    	<a href="<%=request.getContextPath()%>/user">유저 페이지(숨김)</a>
    </sec:authorize>
</div>
</body>
</html>