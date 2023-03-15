<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="mySidebar">
    <!-- table -->
    <h6 class="mySidebar side-title"><span>Profile</span></h6>
    <table>
    <tbody>
    	<tr class="first-item">
	    	<td rowspan="2" style="text-align : center;"><img id="profile_image" src="${profileImgData.profile_img_route}" alt=""></td>
	    	<td colspan="2">${profileData.nick_name}</td>
    	</tr>
    	<tr class="">
	    	<td colspan="2">${profileData.intro}</td>
    	</tr>
    	<tr class="last-item">
	    	<td colspan="3" align="right"><button id="profile_update_btn" class="btn btn-sm btn-secondary profile_update_btn">프로필 수정</button></td>
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
                 <li class="mypage_mid_l_ul_li"><a href="<%=request.getContextPath()%>/myreserve" class="mypage_mid_l_ul_li_a">예약 내역 조회<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
                 <li class="mypage_mid_l_ul_li"><a onclick="checkPwdModalShowHandler('<%=request.getContextPath()%>/mypage/myinfo')" class="mypage_mid_l_ul_li_a">개인 정보 수정<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
                 <li class="mypage_mid_l_ul_li"><a onclick="checkPwdModalShowHandler('<%=request.getContextPath()%>/mypage/myuppwd')" class="mypage_mid_l_ul_li_a">비밀번호 변경<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
                 <li class="mypage_mid_l_ul_li"><a onclick="checkPwdModalShowHandler('<%=request.getContextPath()%>/mypage/mymout')" class="mypage_mid_l_ul_li_a">회원탈퇴<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
             </ul>
         </div>
    </div>
	<!-- ENDS My Category -->
</div>
<div class="modal profile">
   	<div class="modal_content_wrap profile">
   		<div class="modal_content profile">
	   		<form id="profile_form" action="<%=request.getContextPath()%>/mypage/myprofileajax" method="post" enctype="multipart/form-data">
		   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		   		<div class="h6_wrap">
	            	<h6>프로필 사진</h6>
	            </div>
	            <hr>
		   		<div class="mb-3">
		            <input type="file" class="form-control" name="file"  accept="image/*">
		            <span class="tip_mark admin">*최대 1개 이미지 파일 등록 가능</span>
		        </div>
	            <div class="h6_wrap">
	            	<h6>닉네임</h6>
	            </div>
	            <hr>
	            <div class="mb-3">
	            	<input type="text" id="nick_name" class="form-control" name="nick_name" value="${profileData.nick_name}" maxlength="15">
	            </div>
	            <div class="h6_wrap">
	            	<h6>프로필 문구</h6>
	            </div>
	            <hr>
	            <div class="mb-3">
	            	<input type="text" id="intro" class="form-control" name="intro" value="${profileData.intro}" maxlength="30">
			  	</div>
			  	<div class="btn_wrap">
	              	<button class="btn btn-sm btn-info" type="submit" id="profile_from_btn">적용</button>
	               	<button class="btn btn-sm btn-secondary" type="button" id="profile_modal_close">닫기</button>
	            </div>
	   		</form>
   		</div>
   	</div>
</div>
<div class="modal checkPwd">
   	<div class="modal_content_wrap checkPwd">
   		<div class="modal_content checkPwd">
   			<input type="hidden" name="mypageUrl" id="mypageUrl" value=""/>
            <div class="h6_wrap">
            	<h6>비밀번호 확인</h6>
            </div>
            <hr>
            <div class="mb-3">
            	<input type="password" id="member_pwd_chk" class="form-control" name="member_pwd">
            </div>
		  	<div class="btn_wrap">
              	<button class="btn btn-sm btn-info" type="button" id="checkPwd_from_btn">확인</button>
               	<button class="btn btn-sm btn-secondary" type="button" id="checkPwd_modal_close">닫기</button>
            </div>
   		</div>
   	</div>
</div>
<script>
var msg = "${msg}";
if(msg != "") {
    alert(msg);
}
var profile_update = false;
function profileModalShowHandler() {
	$(".modal.profile").show();
}
function profileModalHideHandler() {
	location.reload();
}
$(".profile_update_btn").on("click", profileModalShowHandler);
$("#profile_modal_close").on("click", profileModalHideHandler);

/* 비밀번호 체크 */
var header = $("meta[name='_csrf_header']").attr('content');
var token = $("meta[name='_csrf']").attr('content');
function checkPwdModalHideHandler() {
	location.reload();
}
$("#checkPwd_from_btn").on("click", checkPwdHandler);
$("#checkPwd_modal_close").on("click", checkPwdModalHideHandler);
function checkPwdModalShowHandler(data) {
	$(".modal.checkPwd").show();
	document.getElementById("mypageUrl").value = data;
}
function checkPwdHandler() {
	var pwdCheck = false;
	$.ajax({
		type: "POST",
		url: '<%= request.getContextPath() %>/pwdCheck',
		data: {member_pwd:$('#member_pwd_chk').val()
		},
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		success: function(data){
			console.log(data);
			if(data == 'fail'){
				alert("잘못된 비밀번호입니다.");
				pwdCheck = false;
			}else{
				var assingUrl = document.getElementById('mypageUrl').value;
				location.assign(assingUrl);
				pwdCheck = true;
			}
		}
	});
}
</script>