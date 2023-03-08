<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<div id="main">
	<!-- wrapper-main -->
	<div class="wrapper">
		<!-- ENDS filter -->
		<div id="join_section">
            <div class="join_body">
                <div class="join_title">
                    	회원가입
                </div>
                <form action="<%=request.getContextPath()%>/join" method="post" id="joinForm" name="joinForm" onsubmit="return isValidation();">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="join_body_top"><span class="join_tip_mark">*</span>필수입력사항</div>
                <div class="join_body_mid">
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>아이디<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberId" name="member_id" placeholder="아이디를 입력해주세요." type="text" class="join_body_mid_val_input" required>
                            </div>
                            <div class="hidden_msg_div hidden_div_01">
                    			<p id="pwdMsg1"></p>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button id="check_id_button" type="button" onclick="checkId()">
                                <span class="join_body_ovbtn_span">중복확인</span>
                            </button>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>비밀번호<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberPwd1" name="member_pwd" placeholder="비밀번호를 입력해주세요." type="password" class="join_body_mid_val_input" required>
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
                            <label>비밀번호확인<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberPwd2" name="member_pwd2" placeholder="비밀번호를 다시 입력해주세요." type="password" class="join_body_mid_val_input" required>
                            </div>
                            <div class="hidden_msg_div hidden_div_03">
                    			<p id="pwdMsg3"></p>
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
                                <input id="memberName" name="member_name" placeholder="이름을 입력해주세요." type="text" class="join_body_mid_val_input" required>
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
                                <input id="memberEmail" name="email" placeholder="예: swith@sw.com" type="text" class="join_body_mid_val_input" required>
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
                                <input id="mail_check" placeholder="인증번호 6자리를 입력해주세요!" type="text" class="join_body_mid_val_input" required>
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
                                <input id="memberHndNo" name="hnd_no" placeholder="01011112222" type="text" class="join_body_mid_val_input" required>
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
                                <input id="memberPostCode" name="post_no" placeholder="우편번호" type="text" class="join_body_mid_val_input" readonly>
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
                                <input id="memberAddr1" name="add1" placeholder="기본주소" type="text" class="join_body_mid_val_input" readonly>
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
                                <input id="memberAddr2" name="add2" placeholder="상세주소" type="text" class="join_body_mid_val_input">
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
                                        <input type="checkbox" id="chk_all">
                                        <span>전체약관 동의</span>
                                    </label>
                                </div>
                            </div>
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera1" name="agree1" class="chk" value="Y">
                                        <span>이용약관동의</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera2" name="agree2" class="chk" value="Y">
                                        <span>개인정보수집이용 동의</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera3" name="agree3" class="chk" value="Y">
                                        <span>만 14세 이상 확인</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="join_button">
                    <button class="join_button_submit" type="submit">
                        <span>가입하기</span>
                    </button>
                </div>
                </form>
            </div>
        </div>
		<div class="clear"></div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->