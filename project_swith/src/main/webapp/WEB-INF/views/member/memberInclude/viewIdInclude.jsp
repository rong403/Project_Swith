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
                    <span>아이디 확인</span>
                </div>
                <div class="login_area" id="login_user_area">
                    <form action="<%=request.getContextPath()%>/member/SearchFullId" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" id="member_info1" name="member_name" value="${member_name}">
                        <input type="hidden" id="member_info2" name="email" value="${email}">
                        <div class="input_area">
	                    	<br>
	                    	<span>고객님의 swith 계정을 찾았습니다.</span>
	                    	<span>아이디 확인 후 로그인해 주세요.</span>
	                    	<br>
	                    	<span>${idData}</span>
	                    	<br>
	                    	<br>
	                    	<br>
	                    </div>
	                    <div id="submit_area">
	                        <button type="button" id="login_btn" onclick="location.href='<%=request.getContextPath() %>/member/viewLogin';">
	                            <span>로그인</span>
	                        </button>
	                        <button type="submit" id="join_btn">
	                            <span>전체 아이디 확인하기</span>
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