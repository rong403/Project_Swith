<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="mySidebar">
    <!-- table -->
    <h6 class="mySidebar side-title"><span>Profile</span></h6>
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
	    	<td colspan="3" align="right"><button id="profile_update_btn" class="profile_update_btn">프로필 수정</button></td>
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
<div class="modal profile">
   	<div class="modal_content_wrap profile">
   		<div class="modal_content profile">
   		<div>
   			<img class="profile_img_modal" src="<%=request.getContextPath()%>/resources/caja/img/dummyProfile.png" alt="">
                  <button class="profile_img_change_btn">프로필 사진 변경</button>
   		</div>
               <div class="h6_wrap">
               	<h6>닉네임</h6>
               </div>
               <hr>
               <div class="penalty_list_wrap">
               	<input type="text" id="nick_name" name="nick_name" value="${profileData.nick_name}">
               </div>
               <div class="h6_wrap">
               	<h6>프로필 문구</h6>
               </div>
               <hr>
               	<input type="text" id="intro" name="intro" value="${profileData.intro}">
		  	<div class="btn_wrap">
              		<button class="btn btn-sm btn-info" id="profile_from_btn">적용</button>
               	<button class="btn btn-sm btn-secondary" type="button" id="profile_modal_close">닫기</button>
             		</div>
   		</div>
   	</div>
</div>
<script>
var profile_update = false;
function profileModalShowHandler() {
	$(".modal.profile").show();
}
function profileModalHideHandler() {
	location.reload();
}
function profileAjax() {
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	var nick_name = $('#nick_name');
	var intro = $('#intro');
	$.ajax({
		type: "POST",
		url: '<%= request.getContextPath() %>/mypage/myprofileajax',
		data: {nick_name : nick_name.val(), 
			intro : intro.val(),
		},
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		success: function(data){
			console.log("성공")
			profile_update = true;
		}
	});
}
$(".profile_update_btn").on("click", profileModalShowHandler);
$("#profile_modal_close").on("click", profileModalHideHandler);
$("#profile_from_btn").on("click", profileAjax);
</script>