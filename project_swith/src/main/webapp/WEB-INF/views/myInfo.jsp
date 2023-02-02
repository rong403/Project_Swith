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
			<h6 class="mySidebar side-title">
				<span>Profile</span>
			</h6>
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
					<td class="btn-img"><a href="myskz"><img
							src="img/arrow.png" alt=""></a></td>
				</tr>
				<tr>
					<td>
						<button>가입 스터디 조회</button>
					</td>
					<td class="btn-img"><a href="mystd"><img
							src="img/arrow.png" alt=""></a></td>
				</tr>
				<tr>
					<td>
						<button>신청 스터디 내역</button>
					</td>
					<td class="btn-img"><a href="mystden"><img
							src="img/arrow.png" alt=""></a></td>
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
					<h3 class="p-title">개인 정보 수정</h3>
					<hr>
				</div>
				<div class="col-xxl">
					<div class="card mb-4">
						<div
							class="card-header d-flex align-items-center justify-content-between">
							<h5 class="mb-0">나의 정보</h5>
						</div>
						<div class="card-body">
							<form>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label" for="basic-default-name">아이디</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											id="basic-default-name" value="abc123" readonly>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label"
										for="basic-default-email">이메일</label>
									<div class="col-sm-10">
										<div class="input-group input-group-merge">
											<input type="text" id="basic-default-email"
												class="form-control" value="aaa1111" readonly> <span
												class="input-group-text" id="basic-default-email2">@gmail.com</span>
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label"
										for="basic-default-phone">전화번호</label>
									<div class="col-sm-10">
										<input type="text" id="basic-default-phone"
											class="form-control phone-mask" value="010-1111-2222"
											readonly>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">우편번호</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" value="54321" readonly>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">주소</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											value="서울특별시 강남구 테헤란로 1길" readonly> <input
											type="text" class="form-control" value="101호" readonly>
									</div>
								</div>
								<div class="card-body">
									<div class="row mb-3">
										<label class="col-sm-3 col-form-label">프로필 공개</label>
										<div class="col-md">
											<div class="form-check form-check-inline">
												<label class="form-check-label"> <input
													name="showProfile" class="form-check-input" type="radio"
													value="public" id="id=" inlineRadio1"" checked="">
													공개
												</label>
											</div>
											<div class="form-check form-check-inline">
												<label class="form-check-label"> <input
													name="showProfile" class="form-check-input" type="radio"
													value="private" id="id=" inlineRadio1"" disabled="">
													비공개
												</label>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-3 col-form-label">알림 설정</label>
										<div class="col-md">
											<div class="form-check form-check-inline">
												<label class="form-check-label"> <input name="Alarm"
													class="form-check-input" type="radio" value="yesAlarm"
													id="id=" inlineRadio1"" checked=""> 동의
												</label>
											</div>
											<div class="form-check form-check-inline">
												<label class="form-check-label"> <input name="Alarm"
													class="form-check-input" type="radio" value="noAlarm"
													id="id=" inlineRadio1"" disabled=""> 거부
												</label>
											</div>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-sm-3 col-form-label">개인정보 수집</label>
										<div class="col-md">
											<div class="form-check form-check-inline">
												<label class="form-check-label"> <input
													name="personalInfo" class="form-check-input" type="radio"
													value="yesInfo" id="id=" inlineRadio1"" checked="">
													동의
												</label>
											</div>
											<div class="form-check form-check-inline">
												<label class="form-check-label"> <input
													name="personalInfo" class="form-check-input" type="radio"
													value="noInfo" id="id=" inlineRadio1"" disabled="">
													거부
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="row justify-content-end">
									<div class="col-sm-7">
										<button type="submit" class="btn btn-primary">Send</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- End MyInfo -->
			<div class="clear"></div>
		</div>
		<!-- ENDS wrapper-main -->
	</div>
	<!-- ENDS MAIN -->