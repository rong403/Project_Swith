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
    <!-- search -->
    <div class="top-search">
      <form  method="get" id="searchform" action="#">
        <div>
          <input type="text" value="Search..." name="s" id="s" onFocus="defaultInput(this,'Search...')" onBlur="clearInput(this,'Search...')">
          <input type="submit" id="searchsubmit" value=" ">
        </div>
      </form>
    </div>
    <!-- ENDS search -->
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
    <!-- MySchedule -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">개인 정보 수정</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tr class="first-item">
						<td>아이디</td>
						<td>abc123</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>aaa1111@gmail.com</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>010-1111-2222</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td>54321</td>
					</tr>
					<tr>
						<td rowspan="2">주소</td>
						<td>서울특별시 강남구 테헤란로 1길</td>
					</tr>
					<tr>
						<td>101호</td>
					</tr>
					<tr>
						<td>프로필 공개</td>
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
						<td>알림 설정</td>
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
						<td>개인정보 수집</td>
						<td>
							<label>
								동의<input type="radio" name="giveInfo" value="give" checked>
							</label>
							<label>
								비동의<input type="radio" name="giveInfo" value="notGive">
							</label>
						</td>
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