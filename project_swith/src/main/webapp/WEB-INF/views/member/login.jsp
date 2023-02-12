<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/login.css">
    <script src="<%=request.getContextPath()%>/resources/map/js/jquery-3.6.1.js"></script>
    <title>로그인</title>
    <style>
        html{
            scroll-behavior: smooth;
        }
    </style>
<body>
    <section>
        <div id="login_section">
            <div>
                <div class="login_area" id="login_txt">
                    <span>StudyWith</span>
                </div>
                <div class="login_area" id="login_user_area">
                    <form action="<%=request.getContextPath()%>/resources/map/doLogin.do" method="post" onsubmit="return isValidation();">
                        <div class="input_area">
                            <input type="text" id="member_id" name="member_id" value="${member_id}" placeholder="아이디를 입력해주세요">
                            <input type="password" id="member_pwd" name="member_pwd" value="${uemail}" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <div id="submit_area">
                            <button type="submit" id="login_btn">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <span>로그인</span>
                            </button>
                            <button type="button" id="join_btn" onclick="<%=request.getContextPath()%>/member/join">
                                <span>회원가입</span>
                            </button>
                        </div>
                        <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						    <font color="red">
						        <p>Your login attempt was not successful due to <br/>
						            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
						    </font>
						</c:if>
                        <c:if test="${not empty ERRORMSG}">
					        <font color="red">
					        <p>Your login attempt was not successful due to <br/>
					        ${ERRORMSG }</p>
					        </font>
					    </c:if>
                        <div id="search_user_account">
                            <a href="#">아이디 찾기</a>
                            <span></span>
                            <a href="#">비밀번호 찾기</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
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
</body>
</html>