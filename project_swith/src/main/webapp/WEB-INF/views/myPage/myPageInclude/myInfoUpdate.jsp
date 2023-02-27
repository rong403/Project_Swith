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
    			<h3 class="p-title">개인 정보 수정</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tr class="first-item">
						<td class="attr-name">아이디</td>
						<td class="update"><input type="text" name="id" value="abc123"></td>
					</tr>
					<tr>
						<td class="attr-name">이메일</td>
						<td class="update"><input type="text" name="email" value="aaa1111@gmail.com"></td>
					</tr>
					<tr>
						<td class="attr-name">전화번호</td>
						<td class="update"><input type="text" name="phone" value="010-1111-2222"></td>
					</tr>
					<tr>
						<td class="attr-name">우편번호</td>
						<td class="update"><input type="text" name="post" value="54321"></td>
					</tr>
					<tr>
						<td rowspan="2" class="attr-name">주소</td>
						<td class="update"><input type="text" name="address1" value="서울특별시 강남구 테헤란로 1길"></td>
					</tr>
					<tr>
						<td class="update"><input type="text" name="address2" value="101호"></td>
					</tr>
					<tr>
						<td class="attr-name">프로필 공개</td>
						<td>
							<label>
								동의<input type="radio" name="publicProfile" value="public" checked>
							</label>
							<label>
								비동의<input type="radio" name="publicProfile" value="private">
							</label>
						</td>
					</tr>
					<tr>
						<td class="attr-name">알림 설정</td>
						<td>
							<label>
								동의<input type="radio" name="agreeAlarm" value="agree" checked>
							</label>
							<label>
								비동의<input type="radio" name="agreeAlarm" value="disagree">
							</label>
						</td>
					</tr>
					<tr class="last-item">
						<td class="attr-name">개인정보 수집</td>
						<td>
							<label>
								동의<input type="radio" name="giveInfo" value="give" checked>
							</label>
							<label>
								비동의<input type="radio" name="giveInfo" value="notGive">
							</label>
						</td>
					</tr>
					<tr class="first-item">
						<td colspan="2">
							<div style="text-align: center">
							<button type="button">취소</button>
							<button type="button">변경</button>
							</div>
						</td>
					</tr>
				</table>
	   		</div>
	   </div>
    </div>
    <!-- Ends MyInfo Update -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->