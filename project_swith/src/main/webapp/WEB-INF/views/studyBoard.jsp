<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="stdInfo_div" id="board_div">
	<div class="admin_nav_wrap">
		<div class="admin_nav">
			<a href="#">최신순</a> <a href="#">오래된순</a>
		</div>
			<a class="btn btn-sm btn-info" href="<%=request.getContextPath()%>/boardwrite?study_no=${study.study_no}">글작성</a>
	</div>
	<div class="board_list">
	
		<c:choose>
			<c:when test="${empty boardlist}">
				<h2>등록된 게시글이 없습니다.</h2>
			</c:when>
			<c:otherwise>
			<c:forEach items="${boardlist }" var="boardvo">
				<c:if test="${boardvo.board_status eq 1 }">
					<div class="list_content">
						<h5>${boardvo.board_title }</h5>
						<div>
							<p>${boardvo.member_id }</p>
							<p>${boardvo.board_write }</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
			</c:otherwise>
		</c:choose>
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
