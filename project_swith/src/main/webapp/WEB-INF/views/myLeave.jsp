<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- filter -->
    <ul class="tags">
      <li><span>Categories</span></li>
      <li><a href="#">All</a></li>
      <li class="active"><a href="#"> Photography</a></li>
      <li><a href="#">Logo</a></li>
      <li><a href="#">Webdesign</a></li>
      <li><a href="#">Marketing</a></li>
      <li><a href="#">Gaming</a></li>
      <li><a href="#">Coding</a></li>
    </ul>
    <!-- ENDS filter -->
    <!-- Sidebar -->
    <div class="mySidebar">
      <!-- table -->
      <h6 class="mySidebar side-title"><span>Profile</span></h6>
      <table>
	    <tbody>
	    	<tr class="first-item">
		    	<td rowspan="2"><img src="img/dummyProfile.png" alt=""></td>
		    	<td colspan="2">공부의신</td>
	    	</tr>
	    	<tr class="">
		    	<td colspan="2">교과서만 읽었어요!</td>
	    	</tr>
	    	<tr class="last-item">
		    	<td colspan="3" align="right"><button>update profile</button></td>
	    	</tr>
	    </tbody>
      </table>
      <!-- ENDS table -->
      <!-- My Category -->
      	<table class="button-list">
      		<tr class="first-item">
      			<td>
      				<button>스케줄 조회</button>
      			</td>
      			<td class="btn-img"><a href="myskz"><img src="img/arrow.png" alt="" ></a></td>
      		</tr>
      		<tr>
      			<td>
      				<button>가입 스터디 조회</button>
      			</td>
      			<td class="btn-img"><a href="mystd"><img src="img/arrow.png" alt="" ></a></td>
      		</tr>
      		<tr>
      			<td>
      				<button>신청 스터디 내역</button>
      			</td>
      			<td class="btn-img"><a href="mystden"><img src="img/arrow.png" alt="" ></a></td>
      		</tr>
      		<tr>
      			<td>
      				<button>개인 정보 수정</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      		<tr>
      			<td>
      				<button>비밀번호 변경</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      		<tr class="last-item">
      			<td>
      				<button>회원탈퇴</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      	</table>
      <!-- ENDS My Category -->
    </div>
    <!-- ENDS Sidebar -->
    <!-- MyInfo -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">회원 탈퇴 안내</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tbody>
					<tr class="first-item">
						<td class="attr-name">회원 탈퇴 안내</td>
						<td>
							<ul>
								<li>회원 탈퇴 시 저장된 개인 정보는 모두 파기됩니다.</li>
								<li>탈퇴 신청이 접수되면 해당 아이디로 더이상 접속할 수 없습니다.</li>
								<li><br>삭제되는 내용</li>
								<li>개인 일정, 가입한 스터디 목록, 작성한 스터디 게시글 등</li>
								<li>서비스 이용 시작부터 생성 및 저장된 정보 일체</li>
								<li>회원 탈퇴 후 삭제된 정보는 복구되지 않습니다.</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="attr-name">비밀번호 확인</td>
						<td><input type="password" name="chkPwd"></td>
					</tr>
					<tr class="first-item">
						<td colspan="2">
							<div style="text-align: center">
							<button type="button">취소</button>
							<button type="button">탈퇴</button>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
	   		</div>
	   </div>
    </div>
    <!-- End MyInfo -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->