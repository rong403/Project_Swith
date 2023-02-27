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
    <!-- MySchedule -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">스터디 신청 내역</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tr>
						<td></td>
						<td>신청일</td>
						<td>승인일</td>
						<td>탈퇴일</td>
						<td>종료일</td>
					</tr>
					<tr>
						<td>파이썬 알고리즘/자료구조 코딩 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td>2022.03.21</td>
					</tr>
					<tr>
						<td>프론트엔드 개발자 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
					</tr>
					<tr>
						<td>강남 백엔드 스터디</td>
						<td>2022.03.21</td>
						<td>승인 거절</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>알고리즘 오프라인 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>자바 알고리즘 오프라인 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td></td>
					</tr>
				</table>
	   		</div>
	   </div>
    </div>
    <!-- End MySchedule -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->