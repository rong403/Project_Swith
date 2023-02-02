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
    			<h3 class="p-title">개인 정보 수정</h3><hr>
    		</div>
    		<div class="col-xl">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Basic Layout</h5> <small class="text-muted float-end">Default label</small>
      </div>
      <div class="card-body">
        <form>
          <div class="mb-3">
            <label class="form-label" for="basic-default-fullname">Full Name</label>
            <input type="text" class="form-control" id="basic-default-fullname" placeholder="John Doe">
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-company">Company</label>
            <input type="text" class="form-control" id="basic-default-company" placeholder="ACME Inc.">
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-email">Email</label>
            <div class="input-group input-group-merge">
              <input type="text" id="basic-default-email" class="form-control" placeholder="john.doe" aria-label="john.doe" aria-describedby="basic-default-email2">
              <span class="input-group-text" id="basic-default-email2">@example.com</span>
            </div>
            <div class="form-text"> You can use letters, numbers &amp; periods </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-phone">Phone No</label>
            <input type="text" id="basic-default-phone" class="form-control phone-mask" placeholder="658 799 8941">
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-message">Message</label>
            <textarea id="basic-default-message" class="form-control" placeholder="Hi, Do you have a moment to talk Joe?"></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Send</button>
        </form>
      </div>
    </div>
  </div>
    		<div>
				<table class="right-section">
					<tbody>
					<tr class="first-item">
						<td class="attr-name">아이디</td>
						<td>abc123</td>
					</tr>
					<tr>
						<td class="attr-name">이메일</td>
						<td>aaa1111@gmail.com</td>
					</tr>
					<tr>
						<td class="attr-name">전화번호</td>
						<td>010-1111-2222</td>
					</tr>
					<tr>
						<td class="attr-name">우편번호</td>
						<td>54321</td>
					</tr>
					<tr>
						<td rowspan="2" class="attr-name">주소</td>
						<td>서울특별시 강남구 테헤란로 1길</td>
					</tr>
					<tr>
						<td>101호</td>
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
							<button type="button">개인 정보 수정</button>
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