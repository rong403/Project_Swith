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
					<a href="<%=request.getContextPath() %>/study?study_no=${study.study_no}&page=info" class="tab_btn" id="btnInfo">Info</a>
				</h3>
				<h3>
					<a href="<%=request.getContextPath() %>/study?study_no=${study.study_no}&page=schedule" class="tab_btn" id="btnSchedule">Schedule</a>
				</h3>
				<h3>
					<a href="<%=request.getContextPath() %>/study?study_no=${study.study_no}&page=board" class="tab_btn active" id="btnBoard">Board</a>
				</h3>
			</div>
		</div>
		<hr>
<div class="stdInfo_div" id="board_div">
	<div class="admin_nav_wrap">
		<div class="admin_nav">
			<a href="#">최신순</a> <a href="#">오래된순</a>
		</div>
			<a class="btn btn-sm btn-info" href="<%=request.getContextPath()%>/boardwrite?study_no=${study.study_no}">글작성</a>
	</div>
	<div class="board_list">
			<c:forEach items="${boardlist }" var="boardvo">
					<div class="list_content">
						<h5>${boardvo.BOARD_TITLE }</h5>
						<div>
							<p>${boardvo.MEMBER_ID }</p>
							<p>${boardvo.BOARD_WRITE }</p>
						</div>
					</div>
			</c:forEach>
		<div class="list_content">
			<h5>해당 게시물의 제목</h5>
			<div>
				<p>영문을 모르는 사람</p>
				<p>2023.01.02</p>
			</div>
		</div>
		<div class="list_content">
			<h5>해당 게시물의 제목</h5>
			<div>
				<p>영문을 모르는 사람</p>
				<p>2023.01.02</p>
			</div>
		</div>
		<div class="list_content">
			<h5>해당 게시물의 제목</h5>
			<div>
				<p>영문을 모르는 사람</p>
				<p>2023.01.02</p>
			</div>
		</div>
		<div class="list_content">
			<h5>해당 게시물의 제목</h5>
			<div>
				<p>영문을 모르는 사람</p>
				<p>2023.01.02</p>
			</div>
		</div>
		<div class="list_content">
			<h5>해당 게시물의 제목</h5>
			<div>
				<p>영문을 모르는 사람</p>
				<p>2023.01.02</p>
			</div>
		</div>
		<div class="list_content">
			<h5>해당 게시물의 제목</h5>
			<div>
				<p>영문을 모르는 사람</p>
				<p>2023.01.02</p>
			</div>
		</div>
	</div>
	<div class="pagination">
		<a class="page_item pre"><img class="page_img"
			src="<%=request.getContextPath()%>/resources/images/my_arrow_180.png"></a>
		<a class="page_item">1</a> <a class="page_item">2</a> <a
			class="page_item">3</a> <a class="page_item">4</a> <a
			class="page_item">5</a> <a class="page_item next"><img
			class="page_img"
			src="<%=request.getContextPath()%>/resources/images/my_arrow.png"></a>
	</div>
</div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
