<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- ENDS filter -->
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/myPage/myPageInclude/mySidebar.jsp"/>
    <!-- ENDS Sidebar -->
    <!-- MySchedule -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">스터디 신청 내역</h3><hr>
    		</div>
    		<c:choose>
			<c:when test="${!empty stdReserverData}">
				<table class="right-section mystdern">
					<thead>
						<tr>
							<td>스터디 명</td>
							<td>신청일</td>
							<td>승인여부</td>
						</tr>
					</thead>
					<tbody>
						 <c:forEach items="${stdReserverData}" var="myvo">
						 <c:if test="${myvo.req_condition == 1}">
				          	<tr>
								<td>${myvo.study_name}</td>
								<td>${myvo.req_date}</td>
								<td>대기 중</td>
							</tr>
						 </c:if>
						 <c:if test="${myvo.req_condition == 2}">
				          	<tr>
								<td>${myvo.study_name}</td>
								<td>${myvo.req_date}</td>
								<td>승인 완료</td>
							</tr>
						 </c:if>
						 <c:if test="${myvo.req_condition == 3}">
				          	<tr>
								<td>${myvo.study_name}</td>
								<td>${myvo.req_date}</td>
								<td>신청 거절</td>
							</tr>
						 </c:if>
						 </c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div class="empty_list_wrap">
					<h4>스터디 신청내역이 없습니다.</h4>
				</div>
			</c:otherwise>
			</c:choose>
	   </div>
    </div>
    <!-- End MySchedule -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->