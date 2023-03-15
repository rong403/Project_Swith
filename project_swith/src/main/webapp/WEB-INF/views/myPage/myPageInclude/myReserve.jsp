<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new java.util.Date()%>" />
<!-- 현재날짜 -->
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
<fmt:parseDate value="${date}" var="date2" pattern="yyyy-MM-dd"/>
<fmt:parseNumber value="${date2.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
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
				<c:choose>
			<c:when test="${!empty rlist}">
				<table class="right-section reserve">
					<thead>
						<tr>
							<td>&nbsp;</td>
							<td>스터디룸</td>
							<td>예약일</td>
							<td>예약시간</td>
							<td>결제일</td>
							<td>결제금액</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						 <c:forEach items="${rlist }" var="rlist" varStatus="status">
				          	<tr>
				          		<td>${status.count}</td>
								<td>${rlist.ROOM_NO}<input type="hidden" class='reserve_no' value="${rlist.RESERVE_NO}"></td>
								<td>${fn:substring(rlist.RESERVE_DATE,0,10)}</td>
								<td>${rlist.RESERVE_START_TIME} 시</td>
								<td>${fn:substring(rlist.RESERVE_PAY,0,10)}</td>
								<td>${rlist.RESERVE_PRICE}</td>
								<td>
								<fmt:parseDate value="${fn:substring(rlist.RESERVE_DATE,0,10)}" var="strPlanDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
								<c:if test="${endDate - strDate > 1}">
								<button id="btn-cancelReserve" class="btn btn-secondary btn-cancelReserve">예약 취소</button>
								</c:if>
								</td>
							</tr>
						 </c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div class="empty_list_wrap">
					<h4>결제 내역이 없습니다.</h4>
				</div>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
		<!-- End MyReserveList -->
		<div class="clear"></div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
<div class="modal delMember">
   	<div class="modal_content_wrap delMember">
   		<div class="modal_content delMember">
            <div class="mb-3 h6_wrap">
            	<h6>예약을 취소하시겠습니까?</h6>
            </div>
		  	<div class="btn_wrap">
	   			<input type="hidden" id="reserve_no_modal" class='reserve_no_modal' value="">
              	<button class="btn btn-danger" type="button" id="btn-cancelReserve-do">취소</button>
               	<button class="btn btn-secondary" type="button" id="delMember_modal_close">닫기</button>
            </div>
   		</div>
   	</div>
</div>
<script>
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	$("#delMember_modal_close").on("click", delMemberModalHideHandler);
	$(".btn-cancelReserve").on("click", delMemberModalShowHandler);
	function delMemberModalHideHandler() {
		location.reload();
	}
	function delMemberModalShowHandler(){
		$(".modal.delMember").show();
		var reserve_no = $(this).closest("tr").find('.reserve_no').val();
		document.getElementById('reserve_no_modal').value = reserve_no;
	}
	$('#btn-cancelReserve-do').on("click", cancelReserveClickHandler);

	function cancelReserveClickHandler() {

		var reserve_no = $(this).closest("div").find('.reserve_no_modal').val();
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
				location.reload();
			},
			error: function(){
				alert("예약 취소에 실패했습니다.");
				location.reload();
			}
		});
	}

</script>