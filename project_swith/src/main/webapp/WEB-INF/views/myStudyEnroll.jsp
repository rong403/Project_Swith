<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- ENDS filter -->
    <!-- Sidebar -->
    <div class="mySidebar">
      <!-- table -->
      <h6 class="mySidebar side-title"><span>Profile</span></h6>
      <table>
	    <tbody>
	    	<tr class="first-item">
		    	<td rowspan="2"><img src="<%=request.getContextPath()%>/resources/caja/img/dummyProfile.png" alt=""></td>
		    	<td colspan="2">공부의신</td>
	    	</tr>
	    	<tr class="">
		    	<td colspan="2">교과서만 읽었어요!</td>
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
    <!-- MySchedule -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">스터디 신청 내역</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tr>
						<td></td>
						<td>신청일</td>
						<td>승인일</td>
						<td>탈퇴일</td>
						<td>종료일</td>
					</tr>
					<tr>
						<td>파이썬 알고리즘/자료구조 코딩 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td>2022.03.21</td>
					</tr>
					<tr>
						<td>프론트엔드 개발자 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
					</tr>
					<tr>
						<td>강남 백엔드 스터디</td>
						<td>2022.03.21</td>
						<td>승인 거절</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>알고리즘 오프라인 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>자바 알고리즘 오프라인 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td></td>
					</tr>
				</table>
	   		</div>
	   </div>
    </div>
    <!-- End MySchedule -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->