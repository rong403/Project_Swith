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
    <!-- MyInfo Update -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">개인 정보 수정</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tr class="first-item">
						<td class="attr-name">아이디</td>
						<td class="update"><input type="text" name="id" value="abc123"></td>
					</tr>
					<tr>
						<td class="attr-name">이메일</td>
						<td class="update"><input type="text" name="email" value="aaa1111@gmail.com"></td>
					</tr>
					<tr>
						<td class="attr-name">전화번호</td>
						<td class="update"><input type="text" name="phone" value="010-1111-2222"></td>
					</tr>
					<tr>
						<td class="attr-name">우편번호</td>
						<td class="update"><input type="text" name="post" value="54321"></td>
					</tr>
					<tr>
						<td rowspan="2" class="attr-name">주소</td>
						<td class="update"><input type="text" name="address1" value="서울특별시 강남구 테헤란로 1길"></td>
					</tr>
					<tr>
						<td class="update"><input type="text" name="address2" value="101호"></td>
					</tr>
					<tr>
						<td class="attr-name">프로필 공개</td>
						<td>
							<label>
								동의<input type="radio" name="publicProfile" value="public" checked>
							</label>
							<label>
								비동의<input type="radio" name="publicProfile" value="private">
							</label>
						</td>
					</tr>
					<tr>
						<td class="attr-name">알림 설정</td>
						<td>
							<label>
								동의<input type="radio" name="agreeAlarm" value="agree" checked>
							</label>
							<label>
								비동의<input type="radio" name="agreeAlarm" value="disagree">
							</label>
						</td>
					</tr>
					<tr class="last-item">
						<td class="attr-name">개인정보 수집</td>
						<td>
							<label>
								동의<input type="radio" name="giveInfo" value="give" checked>
							</label>
							<label>
								비동의<input type="radio" name="giveInfo" value="notGive">
							</label>
						</td>
					</tr>
					<tr class="first-item">
						<td colspan="2">
							<div style="text-align: center">
							<button type="button">취소</button>
							<button type="button">변경</button>
							</div>
						</td>
					</tr>
				</table>
	   		</div>
	   </div>
    </div>
    <!-- Ends MyInfo Update -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->