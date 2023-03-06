<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<div id="main">
	<!-- wrapper-main -->
	<div class="wrapper">
		<!-- ENDS filter -->
		<div id="login_section">
            <div>
                <div class="login_area" id="login_txt">
                    <span>비밀번호 재설정</span>
                </div>
                <div class="login_area" id="login_user_area">
                    <form action="<%=request.getContextPath()%>/member/updateUserPwd" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" id="member_id" name="member_id" value="${member_id}">
                        <div class="input_area">
                        	<span>새 비밀번호 등록</span>
                            <input type="password" id="member_info1" class="member_pwd" name="member_pwd" placeholder="새 비밀번호를 입력해주세요">
                    		<p id="pwdMsg2"></p>
                        	<span>새 비밀번호 확인</span>
                            <input type="password" id="member_info2" class="member_pwd" name="member_pwd2" placeholder="새 비밀번호를 한번 더 입력해주세요">
                    		<p id="pwdMsg3"></p>
                        </div>
                        <div id="submit_area">
                            <button type="button" id="login_btn" onclick="location.href='<%=request.getContextPath() %>/member/viewLogin';">
                                <span>돌아가기</span>
                            </button>
                            <button type="submit" id="join_btn" onsubmit="return isValidation();">
                                <span>확인</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
		<div class="clear"></div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
<script>
    var msg = "${msg}";
    if(msg != "") {
        alert(msg);
    }
    
    var isPwChecked = false;// pw 유효성 확인을 했는지 확인
	var isPwEquals = false;// pw 유효성 확인을 했는지 확인
	
    $('#member_info1').keyup(function(){
		var joinPassword1 = $("#member_info1").val();
		var joinPassword2 = $("#member_info2").val();
			
		var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
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
			$('#pwdMsg2').text('');
			isPwChecked = true;
		}
	});
	$('#member_info2').keyup(function(){
		var joinPassword1 = $("#member_info1").val();
		var joinPassword2 = $("#member_info2").val();
			
		var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		if(joinPassword1.length == 0 || !isPwChecked){
			$('#pwdMsg3').text('비밀번호를 확인해 주세요');
			isPwChecked = false;
			
		}else{
			if(joinPassword1 != joinPassword2){
				$('#pwdMsg3').text('비밀번호가 동일하지 않습니다.');
				isPwChecked = true;
				isPwEquals = false;
			}else{
				$('#pwdMsg3').text('');
				isPwChecked = true;
				isPwEquals = true;
			}
		}
	});
	function isValidation(){
		if(!isPwChecked) {
			alert("비밀번호가 유효하지 않습니다.")
			return false;
		} else if(!isPwEquals) {
			alert("비밀번호가 동일하지 않습니다.")
			return false;
		}
		return true;
	}
</script>