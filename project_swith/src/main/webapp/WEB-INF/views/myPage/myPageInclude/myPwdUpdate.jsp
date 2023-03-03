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
		<!-- Update Pwd -->
		<div class="right-wrapper">
			<div class="right-content">
				<div class="padding">
					<h3 class="p-title">비밀번호 변경</h3>
					<hr>
				</div>
				<div class="update_pwd_wrap">
					<div class="join_body_mid update_pwd_mid">
						<div class="join_body_mid_val">
		                    <div class="join_body_mid_val_1">
		                        <label>새 비밀번호<span class="join_tip_mark">*</span></label>
		                    </div>
		                    <div class="join_body_mid_val_2">
		                        <div>
		                            <input id="memberPwd1" name="member_pwd" placeholder="새로운 비밀번호를 입력해주세요." type="password" class="join_body_mid_val_input" required>
		                        </div>
		                    	<div class="hidden_msg_div hidden_div_02">
		                			<p id="pwdMsg2"></p>
		                        </div>
		                    </div>
		                    <div class="join_body_mid_val_3">
		                    </div>
		                </div>
		                <div class="join_body_mid_val">
		                    <div class="join_body_mid_val_1">
		                        <label>새 비밀번호 확인<span class="join_tip_mark">*</span></label>
		                    </div>
		                    <div class="join_body_mid_val_2">
		                        <div>
		                            <input id="memberPwd2" name="member_pwd2" placeholder="새로운 비밀번호를 다시 입력해주세요." type="password" class="join_body_mid_val_input" required>
		                        </div>
		                        <div class="hidden_msg_div hidden_div_03">
		                			<p id="pwdMsg3"></p>
		                        </div>
		                    </div>
		                    <div class="join_body_mid_val_3">
		                    </div>
		                </div>
		            </div>
				</div>
				<div class="update_btn">
					<button type="button" onclick="isValidation2()">변경</button>
				</div>
			</div>
		</div>
		<!-- End Update Pwd -->
		<div class="clear"></div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
<script>
var header = $("meta[name='_csrf_header']").attr('content');
var token = $("meta[name='_csrf']").attr('content');

var isPwChecked = false;// pw 유효성 확인을 했는지 확인
var isPwEquals = false;// pw 유효성 확인을 했는지 확인

$('#memberPwd1').keyup(function(){
	var joinPassword1 = $("#memberPwd1").val();
	var joinPassword2 = $("#memberPwd2").val();
		
	var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	$('.hidden_div_02').css("display", "block");
	if(joinPassword1.length > 16){
		$('#pwdMsg2').text('비밀번호는 최대 16자 까지 입력가능합니다.');
		isPwChecked = false;
	}else if(joinPassword1.search(/\s/) != -1) {
		$('#pwdMsg2').text('비밀번호는 공백을 사용하실 수 없습니다..');
		isPwChecked = false;
	}else if(/(\w)\1\1\1/.test(joinPassword1)){
		$('#pwdMsg2').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
		isPwChecked = false;
	}else if(false === reg.test(joinPassword1)){
		$('#pwdMsg2').text('8자 이상, 영문자/숫자/특수문자를 포함하여 입력해주세요.');
		isPwChecked = false;
	}else {
		$('.hidden_div_02').css("display", "none");
		isPwChecked = true;
	}
});
$('#memberPwd2').keyup(function(){
	var joinPassword1 = $("#memberPwd1").val();
	var joinPassword2 = $("#memberPwd2").val();
		
	var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	$('.hidden_div_03').css("display", "block");
	$('#pwdMsg3').css("color", "rgb(240, 63, 64)");
	if(joinPassword1.length == 0 || !isPwChecked){
		$('#pwdMsg3').text('비밀번호를 확인해 주세요');
		isPwChecked = false;
		
	}else{
		if(joinPassword1 != joinPassword2){
			$('#pwdMsg3').text('비밀번호가 동일하지 않습니다.');
			isPwChecked = true;
			isPwEquals = false;
		}else{
			$('.hidden_div_03').css("display", "none");
			isPwChecked = true;
			isPwEquals = true;
		}
	}
});
function isValidation2(){
	if(!isPwChecked) {
		alert("비밀번호가 유효하지 않습니다.")
	} else if(!isPwEquals) {
		alert("비밀번호가 동일하지 않습니다.")
	}else {
		$.ajax({
			type: "POST",
			url: '<%= request.getContextPath() %>/updatePwd',
			data: {member_pwd : $('#memberPwd1').val()
			},
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success: function(data){
				if(data == 'fail'){
					alert("개인 정보 수정 실패")
				}else{
					alert("개인 정보 수정 성공")
				}
			},
		    error: function(){
		    	alert("개인 정보 수정 실패")
			}
		});
	}
}
</script>