<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/join.css">
    <script src="<%=request.getContextPath()%>/resources/map/js/jquery-3.6.1.js"></script>
    <script src="<%=request.getContextPath()%>/resources/map/js/join.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>맵카</title>
</head>
<body>
    <section>
        <div id="join_section">
            <div class="join_body">
                <div class="join_title">
                    회원가입
                </div>
                <form action="#" method="post" id="joinForm" name="joinForm" onsubmit="return isValidation();">
                <div class="join_body_top"><span class="join_tip_mark">*</span>필수입력사항</div>
                <div class="join_body_mid">
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>아이디<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberId" name="ID" placeholder="아이디를 입력해주세요." type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button id="check_id_button" type="button" onclick="#">
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
                                <input id="memberPwd1" name="PWD" placeholder="비밀번호를 입력해주세요." type="password" class="join_body_mid_val_input" required>
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
                                <input id="memberPwd2" name="PWD2" placeholder="비밀번호를 한번 더 입력해주세요." type="password" class="join_body_mid_val_input" required>
                            </div>
                            <div class="hidden_msg_div">
                    			<p id="pwdMsg"></p>
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
                                <input id="memberName" name="NAME" placeholder="이름을 입력해주세요." type="text" class="join_body_mid_val_input" required>
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
                                <input id="memberEmail" name="EMAIL" placeholder="예: mapcar@mc.com" type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button id="check_email_button" type="button" onclick="#">
                                <span class="join_body_ovbtn_span">중복확인</span>
                            </button>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>헨드폰번호<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberHndNo" name="HND_NO" placeholder="01011112222" type="text" class="join_body_mid_val_input" required>
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
                                <input id="memberPostCode" name="POST_CODE" placeholder="우편번호" type="text" class="join_body_mid_val_input" readonly>
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
                            <label>주소<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberAddr1" name="ADDR1" placeholder="기본주소" type="text" class="join_body_mid_val_input" readonly>
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
                                <input id="memberAddr2" name="ADDR2" placeholder="상세주소" type="text" class="join_body_mid_val_input">
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
                                        <input type="checkbox" id="membera1" name="AGREE1" class="chk" value="Y">
                                        <span>이용약관동의</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera2" name="AGREE2" class="chk" value="Y">
                                        <span>개인정보수집이용 동의</span>
                                    </label>
                                    <span>(필수)</span>
                                </div>
                                <a href="#" class="search_license">약관보기</a>
                            </div>
                            <div class="agree_section_div_btnlist_content">
                                <div class="agree_section_div_btn_button">
                                    <label class="agree_section_div_btn_button_label">
                                        <input type="checkbox" id="membera3" name="AGREE3" class="chk" value="Y">
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
    </section>
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

</body>
</html>