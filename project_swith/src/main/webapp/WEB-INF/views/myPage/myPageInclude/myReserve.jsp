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
		<!--   -->
		<!-- MyReserveList -->
		<div class="right-wrapper">
			<div class="right-content">
				<div class="padding">
					<h3 class="p-title">예약 내역 조회</h3>
					<hr>
				</div>
				<div>
					<div>
						<c:forEach items="${rlist }" var="rlist" varStatus="status">
							<div>
								<p class='index'>예약 ${status.count}. </p>
								<input type="hidden" class='reserve_no' value="${rlist.RESERVE_NO}"><br>
								<p class='room_no'>스터디룸 번호 : ${rlist.ROOM_NO}</p><br>
								<p class='reserve_price'>결제 금액 : ${rlist.RESERVE_PRICE}</p><br>
								<p class='reserve_pay'>결제일 : ${rlist.RESERVE_PAY}</p><br>
								<button class="btn-cancelReserve">예약 취소</button>
							</div>
						</c:forEach>
					</div>
					<!-- pager -->
					<ul class='pager'>
						<li class='first-page'><a href="#">&laquo;</a></li>
						<li><a href="#">&lsaquo;</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li class='active'><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">&rsaquo;</a></li>
						<li class='last-page'><a href="#">&raquo;</a></li>
					</ul>
					<div class="clear"></div>
					<!-- ENDS pager -->
				</div>
			</div>
		</div>
		<!-- End MyReserveList -->
		<div class="clear"></div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
<script>
	$('.btn-cancelReserve').on("click", cancelReserveClickHandler);

	function cancelReserveClickHandler() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		var reserve_no = $(this).closest("div").find('.reserve_no').val();
		var dummy = 'data';
		$.ajax({
			url:"rezcancel",
			type:"post",
			data:{
				reserve_no : reserve_no
			},
			beforeSend:function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function(){
				alert("예약 취소되었습니다.");
			},
			error: function(){
				alert("예약 취소에 실패했습니다.");
			}
		});
	}

</script>