<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
	<!-- wrapper-main -->
	<div class="wrapper">
		<!-- Sidebar -->
		<div class="container-xl">
			<div class="navbar-vertical-content scrollbar">
				<ul class="navbar-nav flex-column mb-3" id="navbarVerticalNav">
					<li class="nav-item"> a</li>
				</ul>
				<div class="row mb-4">
					<div class="col-md-6 col-sm-4 mb-4">
						<div class="col-md-6 col-sm-4 mb-3">
							<div class="card h-100">
								<img class="card-img-top" src="assets/img/elements/2.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<p class="card-text">Some quick example text to build on
										the card title and make up the bulk of the card's content.</p>
									<a href="javascript:void(0)" class="btn btn-outline-primary">Go
										somewhere</a>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-4 mb-3">
							<div class="card h-100">
								<img class="card-img-top" src="assets/img/elements/2.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">Card title</h5>
									<p class="card-text">Some quick example text to build on
										the card title and make up the bulk of the card's content.</p>
									<a href="javascript:void(0)" class="btn btn-outline-primary">Go
										somewhere</a>
								</div>
							</div>
						</div>
					</div>
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
												<label class="col-sm-2 col-form-label"
													for="basic-default-name">아이디</label>
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
													<input type="text" class="form-control" value="54321"
														readonly>
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
																value="public" id="inlineRadio1" checked=""> 공개
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> <input
																name="showProfile" class="form-check-input" type="radio"
																value="private" id="inlineRadio1" disabled="">
																비공개
															</label>
														</div>
													</div>
												</div>
												<div class="row mb-3">
													<label class="col-sm-3 col-form-label">알림 설정</label>
													<div class="col-md">
														<div class="form-check form-check-inline">
															<label class="form-check-label"> <input
																name="Alarm" class="form-check-input" type="radio"
																value="yesAlarm" id="inlineRadio1" checked="">
																동의
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> <input
																name="Alarm" class="form-check-input" type="radio"
																value="noAlarm" id="inlineRadio1" disabled="">
																거부
															</label>
														</div>
													</div>
												</div>

												<div class="row mb-3">
													<label class="col-sm-3 col-form-label">개인정보 수집</label>
													<div class="col-md">
														<div class="form-check form-check-inline">
															<label class="form-check-label"> <input
																name="personalInfo" class="form-check-input"
																type="radio" value="yesInfo" id="id="
																inlineRadio1"" checked=""> 동의
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> <input
																name="personalInfo" class="form-check-input"
																type="radio" value="noInfo" id="id="
																inlineRadio1"" disabled=""> 거부
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
			</div>
		</div>
	</div>
</div>
<!-- ENDS MAIN -->