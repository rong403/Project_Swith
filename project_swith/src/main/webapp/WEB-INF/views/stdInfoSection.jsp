<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
 	<div class="wrapper">
		<div class="movieChartBeScreen_btn_wrap">
			<div class="tabBtn_wrap">
				<h3>
					<a href="#" class="tab_btn active" id="btnInfo">Info</a>
				</h3>
				<h3>
					<a href="#" class ="tab_btn" id="btnSchedule">Schedule</a>
				</h3>
				<h3>
					<a href="#" class ="tab_btn" id="btnBoard">Board</a>
				</h3>
			</div>
		</div>
		<hr>
		<div class="stdInfo_div" id="info_div">
			<div>
				<br>
	            <h4>모임정보</h4>
	            <br>
	            <pre><c:out value="${group.info}"/></pre>
	            <p>
	            	스터디 소개 <br>
	            	영어를 공부하려고 원서를 샀는데 <br>
	            	얼마 읽지 못하고 책꽂이로 간 경험 있으신가요? :(
	            </p>
	        </div>
			<div>
				<button id="stdInfo_btn">가입신청</button>
			</div>
			<br>
			<br>
			<div>
				<h3>멤버	2/8	&nbsp;&nbsp;&nbsp; *공부의신</h3>
			</div>
			<hr>
			
			<section class="mb-5">
	            <div class="card bg-light">
	                <div class="card-body">
	                    <!-- Comment form-->
	                    <form class="mb-4">
	                    	<textarea class="form-control" rows="3" placeholder="댓글을 작성해 주세요."></textarea>
	                    	<input type="button" value="등록">
	                    </form>
	                    <!-- Comment with nested comments-->
	                    <div class="d-flex mb-4">
	                        <!-- Parent comment-->
	                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                        <div class="ms-3">
	                            <div class="fw-bold">스터디를찾아서</div>
	                            	한번에 몇시간정도 진행하나요?
	                            <!-- Child comment 1-->
	                            <div class="d-flex mt-4">
	                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                                <div class="ms-3">
	                                    <div class="fw-bold">공부의신</div>
	                                    	약 1~2시간 정도 진행합니다.
	                                </div>
	                            </div>
	                            <!-- Child comment 2-->
	                            <div class="d-flex mt-4">
	                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                                <div class="ms-3">
	                                    <div class="fw-bold">스터디를찾아서</div>
	                                    	네 감사합니다
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- Single comment-->
	                    <div class="d-flex">
	                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                        <div class="ms-3">
	                            <div class="fw-bold">영어배운사람</div>
	                            	어디 스터디카페에서 진행하나요?
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
			<br>
		</div>
		<div class="stdInfo_div" id="schedule_div">
			<h5>일정관리</h5>
				<div class="right-section">
					calendar 영역
		   		</div>		
			<br>
			<br>
	        <div id="groupAttend">
	          <h5>모임멤버</h5>
	          <a href="stdinfo"></a><img alt="" src="img/chat.png"></a>
	          <hr>
	          <br>
	            <ul class="attend">
	                <li data-sn="12">
	                    <div>
	                        <div class="header">
	                            <img src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="Avatar" class="avatar">
	                            <span>이름</span>
	                            <span>모임장</span>
	                        </div>
	                    </div>
	                </li>
	            </ul>
	        </div>
			<br>
		</div>
		<div class="stdInfo_div" id="board_div">
		</div>
		<div class="stdInfo_div" id="admin_div">
			<div class="admin_nav_wrap">
				<div class="admin_nav">
					<a href="#" id="member_ad">멤버 관리</a>
					<a href="#" id="ask_ad">스터디 신청 관리</a>
				</div>
				<img id="close_ad_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
			</div>
			<div class="member_div">
				<div class="member_cnt">
					<h6>멤버	3/8</h6>
				</div>
				<hr>
				<ul class="member_list">
					<li>
						<div class="member_wrap">
							<div class="d-flex">
		                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
		                        <div class="ms-3">
		                            <div class="fw-bold">영어배운사람</div>
		                            	영어를 더 잘하고 싶어요!
		                        </div>
		                    </div>
	                        <div class="list_btn_wrap">
	                        	<button class="btn btn-sm btn-info">벌점 관리</button>
	                        	<button class="btn btn-sm btn-secondary">멤버 관리</button>
	                        </div>
	                    </div>
					</li>
					<li>
						<div class="member_wrap">
							<div class="d-flex">
		                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
		                        <div class="ms-3">
		                            <div class="fw-bold">영어배운사람</div>
		                            	영어를 더 잘하고 싶어요!
		                        </div>
		                    </div>
	                        <div class="list_btn_wrap">
	                        	<button class="btn btn-sm btn-info">벌점 관리</button>
	                        	<button class="btn btn-sm btn-secondary">멤버 관리</button>
	                        </div>
	                    </div>
					</li>
					<li>
						<div class="member_wrap">
							<div class="d-flex">
		                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
		                        <div class="ms-3">
		                            <div class="fw-bold">영어배운사람</div>
		                            	영어를 더 잘하고 싶어요!
		                        </div>
		                    </div>
	                        <div class="list_btn_wrap">
	                        	<button class="btn btn-sm btn-info">벌점 관리</button>
	                        	<button class="btn btn-sm btn-secondary">멤버 관리</button>
	                        </div>
	                    </div>
					</li>
				</ul>
			</div>
			<div class="ask_div">
				 <div class="member_cnt">
					<h6>스터디 신청 내역</h6>
				</div>
				<hr>
				<ul class="member_list">
					<li>
						<div class="member_wrap">
							<div class="d-flex">
		                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
		                        <div class="ms-3">
		                            <div class="fw-bold">영어배운사람</div>
		                            	영어를 더 잘하고 싶어요!
		                        </div>
		                    </div>
	                        <div class="list_btn_wrap">
	                        	<button class="btn btn-sm btn-info">승인</button>
	                        	<button class="btn btn-sm btn-secondary">거절</button>
	                        </div>
	                    </div>
					</li>
					<li>
						<div class="member_wrap">
							<div class="d-flex">
		                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
		                        <div class="ms-3">
		                            <div class="fw-bold">영어배운사람</div>
		                            	영어를 더 잘하고 싶어요!
		                        </div>
		                    </div>
	                        <div class="list_btn_wrap">
	                        	<button class="btn btn-sm btn-info">승인</button>
	                        	<button class="btn btn-sm btn-secondary">거절</button>
	                        </div>
	                    </div>
					</li>
					<li>
						<div class="member_wrap">
							<div class="d-flex">
		                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
		                        <div class="ms-3">
		                            <div class="fw-bold">영어배운사람</div>
		                            	영어를 더 잘하고 싶어요!
		                        </div>
		                    </div>
	                        <div class="list_btn_wrap">
	                        	<button class="btn btn-sm btn-info">승인</button>
	                        	<button class="btn btn-sm btn-secondary">거절</button>
	                        </div>
	                    </div>
					</li>
				</ul>
			</div>
		</div>
	</div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->