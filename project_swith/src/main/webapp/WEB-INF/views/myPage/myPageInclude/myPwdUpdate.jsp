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
		<!-- Update Pwd -->
		<div class="right-wrapper">
			<div class="right-content">
				<div class="padding">
					<h3 class="p-title">비밀번호 변경</h3>
					<hr>
				</div>
				<table class="right-section">
					<tbody>
						<tr class="first-item">
							<td>새 비밀번호</td>
							<td><input type="password" name="newPwd"></td>
						</tr>
						<tr class="last-item">
							<td>새 비밀번호 확인</td>
							<td><input type="password" name="chkNewPwd"></td>
						</tr>
						<tr>
							<td colspan="2">
								<div style="text-align: center">
									<button type="button">취소</button>
									<button type="button">변경</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- End Update Pwd -->
		<div class="clear"></div>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->