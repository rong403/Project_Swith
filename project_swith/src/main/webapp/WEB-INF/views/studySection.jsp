<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<div id="main">
	<input type="hidden" value="${study.study_no}" id="admin_study_no">
	<!-- wrapper-main -->
	<div class="wrapper">
		<div class="movieChartBeScreen_btn_wrap">
			<div class="tabBtn_wrap">
				<h3>
					<a href="#" class="tab_btn active" id="btnInfo">Info</a>
				</h3>
				<h3>
					<a href="#" class="tab_btn" id="btnSchedule">Schedule</a>
				</h3>
				<h3>
					<a href="#" class="tab_btn" id="btnBoard">Board</a>
				</h3>
			</div>
		</div>
		<hr>
		<jsp:include page="/WEB-INF/views/studyInfo.jsp"/>
		<jsp:include page="/WEB-INF/views/studySchedule.jsp"/>
		<jsp:include page="/WEB-INF/views/studyBoard.jsp"/>
		<jsp:include page="/WEB-INF/views/studyAdmin.jsp"/>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->