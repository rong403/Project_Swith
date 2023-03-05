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
                    <form action="<%=request.getContextPath()%>/login" method="post" onsubmit="return isValidation();">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="input_area">
                        	<span>아이디</span>
                            <input type="text" id="member_info1" name="member_name" placeholder="아이디를 입력해주세요">
                        	<span>이메일</span>
                            <input type="text" id="member_info2" name="email" placeholder="이메일을 입력해주세요">
                        </div>
                        <div id="submit_area">
                            <button type="button" id="login_btn" onclick="location.href='<%=request.getContextPath() %>/member/viewLogin';">
                                <span>돌아가기</span>
                            </button>
                            <button type="button" id="join_btn" onclick="location.href='<%=request.getContextPath() %>/member/join';">
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