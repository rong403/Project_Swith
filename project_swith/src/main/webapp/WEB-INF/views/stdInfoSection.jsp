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
	            <div>
				<br>
	            <h4>모임정보</h4>
	            <br>
	            <c:choose>
	            	<c:otherwise>
            			<div class="excerpt" name="study_detailInfo">${study.study_detailInfo }</div>
	            	</c:otherwise>
	            </c:choose>
	            <%-- <pre><c:out value="${group.info}"/></pre>
	            <p>
	            	스터디 소개 <br>
	            	영어를 공부하려고 원서를 샀는데 <br>
	            	얼마 읽지 못하고 책꽂이로 간 경험 있으신가요? :(
	            </p> --%>
	        </div>
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
	                        	<span>27 Aug 2019</span>
	                            <div class="fw-bold">
	                            	스터디를찾아서
	                            </div>
	                            <div>
	                            	한번에 몇시간정도 진행하나요?
	                            </div>
	                            <div>
		                            <a href="#" class="comment-btn">Like</a>
	                                <a href="#" class="comment-btn">Reply</a>
                                </div>
	                            <!-- Child comment 1-->
	                            <div class="d-flex mt-4">
	                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                                <div class="ms-3">
	                                	<span>27 Aug 2019</span>
	                                    <div class="fw-bold">
	                                    	공부의신
	                                    </div>
	                                    <div>
	                                    	약 1~2시간 정도 진행합니다.
	                                    </div>
	                                    <div>
				                            <a href="#" class="comment-btn">Like</a>
			                                <a href="#" class="comment-btn">Reply</a>
                               	 		</div>
	                                </div>
	                            </div>
	                            <!-- Child comment 2-->
	                            <div class="d-flex mt-4">
	                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                                <div class="ms-3">
	                                	<span>27 Aug 2019</span>
	                                    <div class="fw-bold">
	                                    	스터디를찾아서
	                                    </div>
	                                    <div>
	                                    	네 감사합니다
	                                    </div>
	                                    <div>
				                            <a href="#" class="comment-btn">Like</a>
			                                <a href="#" class="comment-btn">Reply</a>
                               	 		</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- Single comment-->
	                    <div class="d-flex mb-4">
	                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                        <div class="ms-3">
	                        	<span>27 Aug 2019</span>
	                            <div class="fw-bold">
	                            	영어배운사람
	                            </div>
	                            <div>
	                            	어디 스터디카페에서 진행하나요?
	                            </div>
	                            <div>
					                <a href="#" class="comment-btn">Like</a>
				                    <a href="#" class="comment-btn">Reply</a>
                               	</div>
	                        </div>
	                    </div>
						<!-- comment frame -->
						<div class="d-flex mb-4">
							<div class="d-flex mt-4">
								<div class="flex-shrink-0">
									<img class="rounded-circle"
										src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								</div>
								<div class="ms-3">
									<span>date</span>
									<div class="fw-bold">name</div>
									<div>comment</div>
									<div>
										<a href="#" class="comment-btn">Like</a>
										<a href="#" class="comment-btn">Reply</a>
									</div>
									<!-- Child comment 1-->
									<div class="d-flex mt-4">
										<div class="flex-shrink-0">
											<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
										</div>
										<div class="ms-3">
											<span>date</span>
											<div class="fw-bold">name</div>
											<div>comment</div>
											<div>
												<a href="#" class="comment-btn">Like</a>
												<a href="#" class="comment-btn">Reply</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end comment frame -->
					</div>
	            </div>
	        </section>
			<br>
		</div>
		<div class="stdInfo_div" id="schedule_div">
			<h5>일정관리</h5>
				<div class="right-section schedule_wrap">
					<div id='calendar'></div>
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
			<div class="admin_nav_wrap">
				<div class="admin_nav">
					<a href="#" >최신순</a>
					<a href="#" >오래된순</a>
				</div>
				<button class="btn btn-sm btn-info">글작성</button>
			</div>
	        <div class="board_list">
	        	<div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div>
	        	<div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div>
	        </div>
            <div class="pagination">
            	<a class="page_item pre"><img class="page_img" src="<%=request.getContextPath()%>/resources/images/my_arrow_180.png"></a>
            	<a class="page_item">1</a>
            	<a class="page_item">2</a>
            	<a class="page_item">3</a>
            	<a class="page_item">4</a>
            	<a class="page_item">5</a>
            	<a class="page_item next"><img class="page_img" src="<%=request.getContextPath()%>/resources/images/my_arrow.png"></a>
            </div>
		</div>
		<div class="stdInfo_div" id="admin_div">
			<div class="admin_nav_wrap">
				<div class="admin_nav">
					<a href="#" id="member_ad">멤버 관리</a>
					<a href="#" id="ask_ad">스터디 신청 관리</a>
					<input type="hidden" value="1" id="admin_study_no">
				</div>
				<img id="close_ad_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
			</div>
			<div class="member_div">
				<div class="member_cnt" id="admin_member_cnt">
				</div>
				<hr>
				<ul class="member_list" id="admin_member_list">
				</ul>
				<div class="modal penalty">
			    	<div class="modal_content_wrap penalty">
			    		<div class="modal_content penalty">
				    		<div class="d-flex">
		                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
		                        <div class="ms-3">
		                            <div class="fw-bold">영어배운사람</div>
		                            <p>영어를 더 잘하고 싶어요!</p>
		                            <div class="penalty_state"><p>누적 벌점 : 8점</p><p>벌점 횟수 : 4회</p></div>
		                        </div>
			                </div>
			                <div class="h6_wrap">
			                	<h6>벌점 내역</h6>
			                	<p>*우측 버튼으로 취소 시 사유 필수 입력</p>
			                </div>
			                <hr>
			                <div class="penalty_list_wrap">
			                	<div class="penalty_list">
			                		<p>과제 미이행(1점)</p>
			                		<p>2023-02-23 14:23</p>
			                		<button class="btn penalty_delete"><img class="penalty_delete_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
			                	</div>
			                	<div class="penalty_list">
			                		<p>과제 미이행(1점)</p>
			                		<p>2023-02-23 14:23</p>
			                		<button class="btn penalty_delete"><img class="penalty_delete_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
			                	</div>
			                	<div class="penalty_list">
			                		<p>과제 미이행(1점)</p>
			                		<p>2023-02-23 14:23</p>
			                		<button class="btn penalty_delete"><img class="penalty_delete_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
			                	</div>
			                	<div class="penalty_list">
			                		<p>모임 무단 불참(2점)</p>
			                		<p>2023-02-23 14:23</p>
			                		<button class="btn penalty_delete"><img class="penalty_delete_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
			                	</div>
			                	<div class="penalty_list">
			                		<p>게시물/채팅 규칙 위반(3점)</p>
			                		<p>2023-02-23 14:23</p>
			                		<button class="btn penalty_delete"><img class="penalty_delete_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
			                	</div>
			                	<div class="penalty_list">
			                		<p>게시물/채팅 규칙 위반(3점)</p>
			                		<p>2023-02-23 14:23</p>
			                		<button class="btn penalty_delete"><img class="penalty_delete_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
			                	</div>
			                </div>
			                <div class="h6_wrap">
			                	<h6>벌점 부과</h6>
			                	<p>*벌점 및 사유 선택 후 적용 시 부과</p>
			                </div>
			                <hr>
			                <form id="penalty_from">
				                <div class="box">
								    <input type="checkbox" id="one" name="penalty_point" value="1">
								    <span class="check"></span>
								    <label for="one">과제 미이행(1점)</label>
							  	</div>
							  	<div class="box">
								    <input type="checkbox" id="two" name="penalty_point" value="2">
								    <span class="check"></span>
								    <label for="two">모임 무단 불참(2점)</label>
							  	</div>
							  	<div class="box">
								    <input type="checkbox" id="three" name="penalty_point" value="3">
								    <span class="check"></span>
								    <label for="three">게시물/채팅 규칙 위반(3점)</label>
							  	</div>
			                </form>
						  	<div class="btn_wrap">
		                		<button class="btn btn-sm btn-info" id="penalty_from_btn">적용</button>
			                	<button class="btn btn-sm btn-secondary" type="button" id="penalty_modal_close">닫기</button>
	                		</div>
			    		</div>
			    	</div>
	        	</div>
			</div>
<script>
function penaltyModalShowHandler() {
	$(".modal.penalty").show();
}
function penaltyModalHideHandler() {
	$(".modal.penalty").hide();
}
$(".btn.btn-sm.btn-info.penalty").on("click", penaltyModalShowHandler);
$("#penalty_modal_close").on("click", penaltyModalHideHandler);
</script>
			<div class="ask_div">
				 <div class="member_cnt">
					<h6>스터디 신청 내역</h6>
					<div class="recruit_div">
					<form id="recruit_form">
						<input type="hidden" name="study_no" value="${_csrf.token}" />
						<select class="recruit_sel" name="recruit_condition">
							<option value="0">모집중</option>
							<option value="0">모집마감</option>
						</select>
						<button class="btn btn-sm btn-danger">변경</button>
					</form>
					</div>
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
	                        <div class="btn-group">
					          <button type="button" class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-dots-vertical-rounded"></i></button>
					          <ul class="dropdown-menu dropdown-menu-end" style="">
					            <li><a class="dropdown-item" href="javascript:void(0);">승인</a></li>
					            <li><hr class="dropdown-divider"></li>
					            <li><a class="dropdown-item" href="javascript:void(0);">거절</a></li>
					          </ul>
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
	                        <div class="btn-group">
					          <button type="button" class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-dots-vertical-rounded"></i></button>
					          <ul class="dropdown-menu dropdown-menu-end" style="">
					            <li><a class="dropdown-item" href="javascript:void(0);">승인</a></li>
					            <li><hr class="dropdown-divider"></li>
					            <li><a class="dropdown-item" href="javascript:void(0);">거절</a></li>
					          </ul>
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
	                        <div class="btn-group">
					          <button type="button" class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-dots-vertical-rounded"></i></button>
					          <ul class="dropdown-menu dropdown-menu-end" style="">
					            <li><a class="dropdown-item" href="javascript:void(0);">승인</a></li>
					            <li><hr class="dropdown-divider"></li>
					            <li><a class="dropdown-item" href="javascript:void(0);">거절</a></li>
					          </ul>
					        </div>
	                    </div>
					</li>
				</ul>
			</div>
		</div>
<script>
function adminMemberAjax() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var studyNo = $("#admin_study_no").val();
	var $adminMemberList = $("#admin_member_list");
	var $adminMemberCnt = $("#admin_member_cnt");
	$.ajax({
		url : "<%=request.getContextPath()%>/studyParticipant.lo"
		, type : "post"
		, data : { study_no : studyNo }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			if(result.cnt != 0 && result.voList != null) {
				let addMemberList = "";
				for(var i = 0; i < result.voList.length; i++) {
					addMemberList += "<li>"+
										"<div class='member_wrap'>"+
											"<div class='d-flex'>"+
						                       	"<div class='flex-shrink-0'><img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg' alt='...' /></div>"+
					                       		"<div class='ms-3'><div class='fw-bold'>"+result.voList[i].nick_name+"</div>"+result.voList[i].intro+"</div>"+
						                   	"</div>"+
						                    "<div class='btn-group'>"+
									          	"<button type='button' class='btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow' data-bs-toggle='dropdown' aria-expanded='false'><i class='bx bx-dots-vertical-rounded'></i></button>"+
									          	"<ul class='dropdown-menu dropdown-menu-end' style=''>"+
									            	"<li><a class='dropdown-item' href='javascript:penaltyModalShowHandler("+result.voList[i].agr_number+");'>벌점관리</a></li>"+
									            	"<li><hr class='dropdown-divider'></li>"+
									            	"<li><a class='dropdown-item' href='javascript:void(0);'>스터디장 양도</a></li>"+
									            	"<li><hr class='dropdown-divider'></li>"+
									            	"<li><a class='dropdown-item' href='javascript:void(0);'>멤버 신고</a></li>"+
									            	"<li><hr class='dropdown-divider'></li>"+
									            	"<li><a class='dropdown-item' href='javascript:void(0);'>멤버 강퇴</a></li>"+
									          	"</ul>"+
									        "</div>"+
						                "</div>"+
									 "</li>";
				}
				$adminMemberList.html(addMemberList);
			} else {
				addMemberList += "<li>"+
									"<div class='member_wrap'>"+
										"해당 스터디원이 아직 없습니다."+
					                "</div>"+
								 "</li>";
				$adminMemberList.html(addMemberList);
			}

			$adminMemberCnt.html("<h6>멤버 "+result.cnt+"/8</h6>");
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
}
function adminAskAjax() {
	
}
</script>
	</div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->