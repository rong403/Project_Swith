<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- MAIN -->
<div id="main">
	<!-- wrapper-main -->
	<div class="wrapper">
		<!-- ENDS filter -->
		<!-- Sidebar -->
		<div class="mySidebar">
			<!-- table -->
			<h6 class="mySidebar side-title">
				<span>Profile</span>
			</h6>
			<table>
				<tbody>
					<tr class="first-item">
				    	<td rowspan="2"><img src="<%=request.getContextPath()%>/resources/caja/img/dummyProfile.png" alt=""></td>
				    	<td colspan="2">${profileData.nick_name}</td>
			    	</tr>
			    	<tr class="">
				    	<td colspan="2">${profileData.intro}</td>
			    	</tr>
			    	<tr class="last-item">
				    	<td colspan="3" align="right"><button>update profile</button></td>
			    	</tr>
				</tbody>
			</table>
			<!-- ENDS table -->
			<!-- My Category -->
	   	<div class="mypage_mid_l">
	         <div class="mypage_mid_l_wrap">
	             <ul class="mypage_mid_l_ul">
	                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/mypage/myskd" class="mypage_mid_l_ul_li_a">스케줄 조회<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/mypage/mystd" class="mypage_mid_l_ul_li_a">가입 스터디 조회<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/mypage/mystden" class="mypage_mid_l_ul_li_a">신청 스터디 내역<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/myreserve" class="mypage_mid_l_ul_li_a">결제 내역 조회<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/mypage/myinfo" class="mypage_mid_l_ul_li_a">개인 정보 수정<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/mypage/myuppwd" class="mypage_mid_l_ul_li_a">비밀번호 변경<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/mypage/mymout" class="mypage_mid_l_ul_li_a">회원탈퇴<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	             </ul>
	         </div>
	     </div>
	   <!-- ENDS My Category -->
		</div>
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
								<p class='index'>${status.index}</p><br>
								<p class='reserve_no'>${rlist.RESERVE_NO}</p><br>
								<p class='room_no'>${rlist.ROOM_NO}</p><br>
								<p class='reserve_price'>${rlist.RESERVE_PRICE}</p><br>
								<p class='reserve_pay'>${rlist.RESERVE_PAY}</p><br>
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

		var reserve_no = $(this).closest("div").find('.reserve_no').text();
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