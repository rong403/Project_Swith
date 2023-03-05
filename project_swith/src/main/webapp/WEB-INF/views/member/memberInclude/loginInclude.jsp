<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<div id="main">
	<!-- wrapper-main -->
	<div class="wrapper">
		<!-- ENDS filter -->
		<div id="login_section">
			<div class="login_area" id="login_txt">
				<span>StudyWith</span>
			</div>
			<div class="login_area" id="login_user_area">
				<form action="<%=request.getContextPath()%>/login" method="post" onsubmit="return isValidation();">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="input_area">
						<input type="text" id="member_id" name="member_id"value="${member_id}" placeholder="아이디를 입력해주세요">
						<input type="password" id="member_pwd" name="member_pwd" value="${member_pwd}" placeholder="비밀번호를 입력해주세요">
					</div>
					<div id="submit_area">
						<button type="submit" id="login_btn">
							<span>로그인</span>
						</button>
						<button type="button" id="join_btn" onclick="location.href='<%=request.getContextPath()%>/member/join';">
							<span>회원가입</span>
						</button>
					</div>
					<c:if test="${not empty ERRORMSG}">
						<font color="red">
							<p>${ERRORMSG }</p>
						</font>
					</c:if>
					<div id="search_user_account">
						<a href="<%=request.getContextPath()%>/member/viewSearchId">아이디 찾기</a> 
						<span></span> 
						<a href="<%=request.getContextPath()%>/member/viewSearchPwd">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
<script>
    function isValidation(){
		var userID = document.getElementById("input_ID").value;
		var userPWD = document.getElementById("input_PWD").value;
		
		if(userID == "" || userID.length == 0){
			alert("아이디를 입력해주세요.");
			return false;
		} else if(userPWD == "" || userPWD.length == 0){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		return true;
	}
</script>
<script>
    var msg = "${msg}";
    if(msg != "") {
        alert(msg);
    }
</script>