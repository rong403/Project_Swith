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
                    <span>비밀번호 찾기</span>
                </div>
                <div class="login_area" id="login_user_area">
                    <form action="<%=request.getContextPath()%>/member/viewUpdateUserPwd" id="userEmailCheck" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" id="member_info1" name="member_id" value="${member_id}">
                        <input type="hidden" id="memberPwd1" name="member_pwd" value="fake">
                        <div class="input_area">
                        	<span>인증번호 입력</span>
                            <input id="mail_check" placeholder="인증번호 6자리를 입력해주세요!" type="text" required>
                        </div>
                        <div id="submit_area">
                            <button type="button" id="login_btn" onclick="location.href='<%=request.getContextPath() %>/member/viewSearchPwd';">
                                <span>돌아가기</span>
                            </button>
                            <button type="button" id="join_btn" onclick="checkNum()">
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
    
    var check_num = "${authNumber}";
    function checkNum(){
		var num = $('#mail_check');
		
		if(num.val() != check_num){
			alert('인증 실패');
		}else{
			alert("인증 성공!");
			$("#userEmailCheck").submit();
		}
	}
</script>