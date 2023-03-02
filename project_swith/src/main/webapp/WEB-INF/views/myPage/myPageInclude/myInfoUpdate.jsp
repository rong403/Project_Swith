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
    <!-- MyInfo Update -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">개인 정보 수정</h3>
                <div class="join_body_top"><span class="join_tip_mark">*</span>필수입력사항</div>
    			<hr>
    		</div>
    		<div class="update_member_wrap">
                <input id="memberPwd1" name="member_pwd" value="fake" type="hidden">
                <div class="join_body_mid">
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>아이디<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberId" name="member_id" value="${userData.member_id}" type="text" class="join_body_mid_val_input" readonly>
                            </div>
                            <div class="hidden_msg_div hidden_div_01">
                    			<p id="pwdMsg1"></p>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>이름<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberName" name="member_name" value="${userData.member_name}" type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>이메일<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberEmail" name="email" value="${userData.email}" type="text" class="join_body_mid_val_input" required>
                            </div>
                            <div class="hidden_msg_div hidden_div_04">
                    			<p id="pwdMsg4"></p>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button id="check_email_button" type="button" onclick="checkEmail()">
                                <span class="join_body_ovbtn_span">본인인증</span>
                            </button>
                        </div>
                    </div>
                    <div class="join_body_mid_val email_check_num">
                        <div class="join_body_mid_val_1">
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="mail_check" placeholder="인증번호 6자리를 입력해주세요!" type="text" class="join_body_mid_val_input">
                            </div>
                            <div class="hidden_msg_div hidden_div_06">
                    			<p id="pwdMsg6"></p>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button id="check_number_button" type="button" onclick="checkNum()">
                                <span class="join_body_ovbtn_span">확인</span>
                            </button>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>휴대폰번호<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberHndNo" name="hnd_no" value="${userData.hnd_no}" type="text" class="join_body_mid_val_input" required>
                            </div>
                            <div class="hidden_msg_div hidden_div_05">
                    			<p id="pwdMsg5"></p>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                        	<label>주소<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberPostCode" name="post_no" value="${userData.post_no}" type="text" class="join_body_mid_val_input" readonly>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        	<div>
                                <button class="join_body_mid_val_button" type="button" onclick="searchPostCode();">
                                    <span>
                                    	<img src="<%=request.getContextPath()%>/resources/map/images/돋보기로고.jpg">
                                        	주소검색
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberAddr1" name="add1" value="${userData.add1}" type="text" class="join_body_mid_val_input" readonly>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberAddr2" name="add2" value="${userData.add2}" type="text" class="join_body_mid_val_input">
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                </div>
                <div class="agree_section">
                    <div class="agree_section_div">
                        <div class="join_body_mid_val_1">
                            <label>이용약관동의<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="agree_section_div_btnlist">
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera1" name="agree1" class="chk" value="Y" checked>
                                        <span>이용약관동의</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera2" name="agree2" class="chk" value="Y" checked>
                                        <span>개인정보수집이용 동의</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera3" name="agree3" class="chk" value="Y" checked>
                                        <span>만 14세 이상 확인</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                        </div>
                    </div>
                </div>
	   		</div>
			<div class="update_btn">
				<button type="button" onclick="isValidation()">변경</button>
			</div>
	   </div>
    </div>
    <!-- Ends MyInfo Update -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<script>
	function searchPostCode(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            var post_code = data.zonecode;
	            var addr1 = data.roadAddress;
	            
	            document.getElementById('memberPostCode').value = post_code;
                document.getElementById("memberAddr1").value = addr1;
	        }
	    }).open();
	}
</script>
<script>
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');

	var isEmailChecked = true;// email 중복 확인을 했는지 확인
	var isHndChecked = true;// Hnd 유효성 확인을 했는지 확인
	var isPwChecked = true;// pw 유효성 확인을 했는지 확인
	var isPwEquals = true;// pw 유효성 확인을 했는지 확인
	
	var emailFirst = $('#memberEmail').val();
	
	$('#memberEmail').keyup(function(){
		if($('#memberEmail').val() == emailFirst){
			$('#check_email_button').css("border", "1px solid rgb(260, 260, 260)");
			$('#check_email_button').css("color", "rgb(221, 221, 221)");
			$('.hidden_div_06').css("display", "none");
			$('.email_check_num').css("display", "none");
			isEmailChecked = true;
			check_email_button.disabled = true;
		} else {
			$('#check_email_button').css("border", "1px solid black");
			$('#check_email_button').css("color", "rgb(51, 51, 51)");
			check_email_button.disabled = false;
			isEmailChecked = false;
			var email = $('#memberEmail');
			var reg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
			$('.hidden_div_04').css("display", "block");
			if(email.val().length > 20){
				$('#pwdMsg4').text('이메일은 20자 이하로 입력해 주세요.');
			}else if(email.val() == "" || email.val().length == 0){
				$('#pwdMsg4').text('이메일을 입력해주세요.');
			}else if(!reg.test(email.val())){
				$('#pwdMsg4').text('이메일 형식으로 입력해 주세요.');
			}else if(email.val().length > 20){
				$('#pwdMsg4').text('이메일은 20자 이하로 입력해 주세요.');
			}else{
				$('.hidden_div_04').css("display", "none");
			}
		}
	});
	$('#memberHndNo').keyup(function(){
		isHndChecked = false;
		var hndNo = $('#memberHndNo').val();
		$('.hidden_div_05').css("display", "block");
		if(hndNo.length != 11 || hndNo.substring(0, 3) != '010'){
			$('#pwdMsg5').text('휴대폰번호가 유효하지 않습니다.');
		}else{
			$('.hidden_div_05').css("display", "none");
			isHndChecked = true;
		}
	});
	var check_num = null;
	function checkEmail(){
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		var email = $('#memberEmail');
		
		var reg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
		
		if(email.val().length > 20){
			alert("이메일은 20자 이하로 입력해 주세요.");
		}else if(email.val() == "" || email.val().length == 0){
			alert("이메일을 입력해주세요.");
		}else if(!reg.test(email.val())){
			alert("이메일 형식으로 입력해 주세요.");
		}else{
			$.ajax({
				type: "POST",
				url: '<%= request.getContextPath() %>/checkEmail',
				data: {email:email.val()},
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success: function(data){
					if(data == 'fail'){
						alert("이미 사용중인 이메일입니다.");
						
					}else{
						alert("사용가능한 이메일 입니다.");
						$('#check_email_button').css("border", "1px solid rgb(260, 260, 260)");
						$('#check_email_button').css("color", "rgb(221, 221, 221)");
						
						check_num = data;
						$('.email_check_num').css("display", "inline-flex");
					}
				}
			});
		}
	}
	
	function checkNum(){
		var num = $('#mail_check');
		
		$('.hidden_div_06').css("display", "block");
		if(num.val() != check_num){
			$('#pwdMsg6').text('인증 실패');
			isEmailChecked = false;
		}else{
			alert("인증 성공!");
			$('.hidden_div_06').css("display", "none");
			$('.email_check_num').css("display", "none");
			isEmailChecked = true;
		}
	}
	function isValidation(){
		var userName = document.getElementById("memberName").value;
		var postCode = document.getElementById("memberPostCode").value;
		var userHndNo = document.getElementById("memberHndNo").value;
		var add1 = document.getElementById("memberAddr1").value;
		if(userName == "" || userName.length == 0){
			alert("이름을 입력해주세요.");
		} else if(!isHndChecked){
			alert("핸드폰 번호를 입력해주세요.");
		} else if(userHndNo.length < 11 || userHndNo.substring(0, 3) != '010'){
			alert("핸드폰 번호가 유효하지않습니다.");
		} else if(!isEmailChecked){
			alert("이메일 본인인증이 필요합니다.");
		} else if(postCode == "" || postCode.length == 0 || add1 == "" || add1.length == 0){
			alert("주소를 입력해주세요.");
		} else if($('#membera1').is(":checked") == false){
			alert("필수약관동의를 체크해주세요.");
		} else if($('#membera2').is(":checked") == false){
			alert("필수약관동의를 체크해주세요.");
		} else if($('#membera3').is(":checked") == false){
			alert("필수약관동의를 체크해주세요.");
		} else {
			$.ajax({
				type: "POST",
				url: '<%= request.getContextPath() %>/updateMember',
				data: {member_id : $('#memberId').val(), 
					member_pwd : $('#memberPwd1').val(),
					member_name : $('#memberName').val(),
					email : $('#memberEmail').val(),
					hnd_no : $('#memberHndNo').val(),
					post_no : $('#memberPostCode').val(),
					add1 : $('#memberAddr1').val(),
					add2 : $('#memberAddr2').val(),
					agree1 : $('#membera1').val(),
					agree2 : $('#membera2').val(),
					agree3 : $('#membera3').val(),
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
<!-- ENDS MAIN -->