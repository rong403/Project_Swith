<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var msg = "${msgAlert}";
	if(msg){
		alert(msg);
	}
	location.href="${pageContext.request.contextPath}/place";
</script>