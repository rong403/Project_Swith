<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<div id="main">
	<input type="hidden" value="1" id="admin_study_no">
	<!-- wrapper-main -->
	<div class="wrapper">
		<div class="movieChartBeScreen_btn_wrap">
			<div class="tabBtn_wrap">
				<h3>
					<a href="#" class="tab_btn active" id="btnInfo">Info</a>
				</h3>
				<h3>
					<a href="#" class="tab_btn" id="btnSchedule">Schedule</a>
				</h3>
				<h3>
					<a href="#" class="tab_btn" id="btnBoard">Board</a>
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
						<c:when test="${empty study }">
							등록된 스터디가 없습니다!
						</c:when>
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
			<br> <br>
			<div>
				<h3>멤버 2/8 &nbsp;&nbsp;&nbsp; *공부의신</h3>
			</div>
			<hr>

			<section class="mb-5">
				<div class="card bg-light">
					<div class="card-body">
						<!-- Comment form-->
						<form class="mb-4">
							<textarea class="form-control" rows="3"
								placeholder="댓글을 작성해 주세요."></textarea>
							<button type="button" id="ajax_comment">등록</button>
						</form>
						<div id="printCommentList">
						<div class="d-flex mb-4">
						<div class="d-flex mb-4">
						<!-- STUDY_COMMENT TEST APPLY -->
						<c:forEach items="${comment }" var="comment" varStatus="status">
							<c:if test="${comment.STUDY_COMMENT_LEVEL eq 0}">
								</div>
								</div>
								<div class="d-flex mb-4">
									<div class="flex-shrink-0">
										<img class="rounded-circle"
											src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
											alt="..." />
									</div>
									<div class="ms-3">
										<span>${comment.STUDY_COMMENT_DATE }</span>
										<div class="fw-bold">${comment.MEMBER_ID }</div>
										<div class="commentArea">
											<div>${comment.STUDY_COMMENT }</div>
											<input type="hidden" class="comment_origin"
												value="${comment.STUDY_COMMENT_ORIGIN }"> <input
												type="hidden" class="comment_level"
												value="${comment.STUDY_COMMENT_LEVEL }"> <input
												type="hidden" class="comment_seq"
												value="${comment.STUDY_COMMENT_SEQ }">
										</div>
										<button type="button" class="reply_choice">reply</button>
										<div class="replyCommentArea">
											<textarea class="form-control" rows="3"></textarea>
											<button type="button" class="reply_comment">등록</button>
										</div>
							</c:if>
							<c:if test="${comment.STUDY_COMMENT_LEVEL eq 1}">
								<div class="d-flex mt-4">
									<div class="flex-shrink-0">
										<img class="rounded-circle"
											src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
											alt="..." />
									</div>
									<div class="ms-3">
										<span>${comment.STUDY_COMMENT_DATE }</span>
										<div class="fw-bold">${comment.MEMBER_ID }</div>
										<div class="commentArea">
											<div>${comment.STUDY_COMMENT }</div>
											<input type="hidden" class="comment_origin"
												value="${comment.STUDY_COMMENT_ORIGIN }"> <input
												type="hidden" class="comment_level"
												value="${comment.STUDY_COMMENT_LEVEL }"> <input
												type="hidden" class="comment_seq"
												value="${comment.STUDY_COMMENT_SEQ }">
										</div>
										<button type="button" class="reply_choice">reply</button>
										<div class="replyCommentArea">
											<textarea class="form-control" rows="3"></textarea>
											<button type="submit" class="reply_comment">등록</button>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${comment.STUDY_COMMENT_LEVEL ge 2}">
								<div class="d-flex mt-4">
									<div class="flex-shrink-0">
										<img class="rounded-circle"
											src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
											alt="..." />
									</div>
									<div class="ms-3">
										<span>${comment.STUDY_COMMENT_DATE }</span>
										<div class="fw-bold">${comment.MEMBER_ID }</div>
										<div class="commentArea">
											<div>${comment.STUDY_COMMENT }</div>
											<input type="hidden" class="comment_origin"
												value="${comment.STUDY_COMMENT_ORIGIN }"> <input
												type="hidden" class="comment_level"
												value="${comment.STUDY_COMMENT_LEVEL }"> <input
												type="hidden" class="comment_seq"
												value="${comment.STUDY_COMMENT_SEQ }">
										</div>
										<button type="button" class="reply_choice">reply</button>
										<div class="replyCommentArea">
											<textarea class="form-control" rows="3"></textarea>
											<button type="submit" class="reply_comment">등록</button>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${status.last}">
								</div>
								</div>
							</c:if>
						</c:forEach>
						</div>
						<!-- END STUDY_COMMENT TEST APPLY -->



						<!-- Comment with nested comments-->
						<div class="d-flex mb-4">
							<!-- Parent comment-->
							<div class="flex-shrink-0">
								<img class="rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							<div class="ms-3">
								<span>27 Aug 2019</span>
								<div class="fw-bold">스터디를찾아서</div>
								<div>한번에 몇시간정도 진행하나요?</div>
								<div>
									<a href="#" class="comment-btn">Like</a> <a href="#"
										class="comment-btn">Reply</a>
								</div>
								<!-- Child comment 1-->
								<div class="d-flex mt-4">
									<div class="flex-shrink-0">
										<img class="rounded-circle"
											src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
											alt="..." />
									</div>
									<div class="ms-3">
										<span>27 Aug 2019</span>
										<div class="fw-bold">공부의신</div>
										<div>약 1~2시간 정도 진행합니다.</div>
										<div>
											<a href="#" class="comment-btn">Like</a> <a href="#"
												class="comment-btn">Reply</a>
										</div>
									</div>
								</div>
								<!-- Child comment 2-->
								<div class="d-flex mt-4">
									<div class="flex-shrink-0">
										<img class="rounded-circle"
											src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
											alt="..." />
									</div>
									<div class="ms-3">
										<span>27 Aug 2019</span>
										<div class="fw-bold">스터디를찾아서</div>
										<div>네 감사합니다</div>
										<div>
											<a href="#" class="comment-btn">Like</a> <a href="#"
												class="comment-btn">Reply</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Single comment-->
						<div class="d-flex mb-4">
							<div class="flex-shrink-0">
								<img class="rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							<div class="ms-3">
								<span>27 Aug 2019</span>
								<div class="fw-bold">영어배운사람</div>
								<div>어디 스터디카페에서 진행하나요?</div>
								<div>
									<a href="#" class="comment-btn">Like</a> <a href="#"
										class="comment-btn">Reply</a>
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
										<a href="#" class="comment-btn">Like</a> <a href="#"
											class="comment-btn">Reply</a>
									</div>
									<!-- Child comment 1-->
									<div class="d-flex mt-4">
										<div class="flex-shrink-0">
											<img class="rounded-circle"
												src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
												alt="..." />
										</div>
										<div class="ms-3">
											<span>date</span>
											<div class="fw-bold">name</div>
											<div>comment</div>
											<div>
												<a href="#" class="comment-btn">Like</a> <a href="#"
													class="comment-btn">Reply</a>
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
			<br> <br>
			<div id="groupAttend">
				<h5>모임멤버</h5>
				<a href="stdinfo"></a><img alt="" src="img/chat.png"></a>
				<hr>
				<br>
				<ul class="attend">
					<li data-sn="12">
						<div>
							<div class="header">
								<img src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
									alt="Avatar" class="avatar"> <span>이름</span> <span>모임장</span>
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
					<a href="#">최신순</a> <a href="#">오래된순</a>
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
				</div>
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
				</div>
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
				</div>
			</div>
			<div class="pagination">
				<a class="page_item pre"><img class="page_img"
					src="<%=request.getContextPath()%>/resources/images/my_arrow_180.png"></a>
				<a class="page_item">1</a> <a class="page_item">2</a> <a
					class="page_item">3</a> <a class="page_item">4</a> <a
					class="page_item">5</a> <a class="page_item next"><img
					class="page_img"
					src="<%=request.getContextPath()%>/resources/images/my_arrow.png"></a>
			</div>
		</div>
		<div class="stdInfo_div" id="admin_div">
			<div class="admin_nav_wrap">
				<div class="admin_nav">
					<a href="#" id="member_ad">멤버 관리</a> <a href="#" id="ask_ad">스터디
						신청 관리</a>
				</div>
				<img id="close_ad_img"
					src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
			</div>
			<div class="member_div">
				<div class="member_cnt" id="admin_member_cnt"></div>
				<hr>
				<ul class="member_list" id="admin_member_list">
				</ul>
				<div class="modal penalty">
					<div class="modal_content_wrap penalty">
						<div class="modal_content penalty">
							<div class="d-flex">
								<div class="flex-shrink-0">
									<img class="rounded-circle"
										src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								</div>
								<div class="ms-3">
									<div class="fw-bold">영어배운사람</div>
									<p>영어를 더 잘하고 싶어요!</p>
									<div class="penalty_state">
										<p>누적 벌점 : 8점</p>
										<p>벌점 횟수 : 4회</p>
									</div>
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
									<button class="btn penalty_delete">
										<img class="penalty_delete_img"
											src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
									</button>
								</div>
								<div class="penalty_list">
									<p>과제 미이행(1점)</p>
									<p>2023-02-23 14:23</p>
									<button class="btn penalty_delete">
										<img class="penalty_delete_img"
											src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
									</button>
								</div>
								<div class="penalty_list">
									<p>과제 미이행(1점)</p>
									<p>2023-02-23 14:23</p>
									<button class="btn penalty_delete">
										<img class="penalty_delete_img"
											src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
									</button>
								</div>
								<div class="penalty_list">
									<p>모임 무단 불참(2점)</p>
									<p>2023-02-23 14:23</p>
									<button class="btn penalty_delete">
										<img class="penalty_delete_img"
											src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
									</button>
								</div>
								<div class="penalty_list">
									<p>게시물/채팅 규칙 위반(3점)</p>
									<p>2023-02-23 14:23</p>
									<button class="btn penalty_delete">
										<img class="penalty_delete_img"
											src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
									</button>
								</div>
								<div class="penalty_list">
									<p>게시물/채팅 규칙 위반(3점)</p>
									<p>2023-02-23 14:23</p>
									<button class="btn penalty_delete">
										<img class="penalty_delete_img"
											src="<%=request.getContextPath()%>/resources/map/images/x_icon.png">
									</button>
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
									<span class="check"></span> <label for="one">과제 미이행(1점)</label>
								</div>
								<div class="box">
									<input type="checkbox" id="two" name="penalty_point" value="2">
									<span class="check"></span> <label for="two">모임 무단
										불참(2점)</label>
								</div>
								<div class="box">
									<input type="checkbox" id="three" name="penalty_point"
										value="3"> <span class="check"></span> <label
										for="three">게시물/채팅 규칙 위반(3점)</label>
								</div>
							</form>
							<div class="btn_wrap">
								<button class="btn btn-sm btn-info" id="penalty_from_btn">적용</button>
								<button class="btn btn-sm btn-secondary" type="button"
									id="penalty_modal_close">닫기</button>
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
							<input type="hidden" name="study_no" value="${_csrf.token}" /> <select
								class="recruit_sel" name="recruit_condition">
								<option value="0">모집중</option>
								<option value="0">모집마감</option>
							</select>
							<button class="btn btn-sm btn-danger">변경</button>
						</form>
					</div>
				</div>
				<hr>
				<ul class="member_list" id="admin_reserver_list">
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
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var studyNo = $("#admin_study_no").val();
	var $adminReserverList = $("#admin_reserver_list");
	$.ajax({
		url : "<%=request.getContextPath()%>/studyReserver.lo",
							type : "post",
							data : {
								study_no : studyNo
							},
							dataType : "json",
							beforeSend : function(xhr) {
								xhr.setRequestHeader(header, token);
							},
							success : function(result) {
								if (result != null) {
									let addReserverList = "";
									for (var i = 0; i < result.length; i++) {
										if (result[i].profile_img_route === undefined) {
											console.log("profile_img_route : "
															+ result[i].profile_img_route);
											addReserverList += "<li>"
													+ "<div class='member_wrap'>"
													+ "<div class='d-flex'>"
													+ "<div class='flex-shrink-0'><img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg' alt='...' /></div>"
													+ "<div class='ms-3'><div class='fw-bold reserver_data'>"
													+ result[i].nick_name
													+ "<p>"
													+ result[i].req_date
													+ "</p></div>"
													+ result[i].req_comment
													+ "</div>"
													+ "</div>"
													+ "<div class='btn-group'>"
													+ "<button type='button' class='btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow' data-bs-toggle='dropdown' aria-expanded='false'><i class='bx bx-dots-vertical-rounded'></i></button>"
													+ "<ul class='dropdown-menu dropdown-menu-end' style=''>"
													+ "<li><a class='dropdown-item' href='javascript:void(0);'>승인</a></li>"
													+ "<li><hr class='dropdown-divider'></li>"
													+ "<li><a class='dropdown-item' href='javascript:void(0);'>거절</a></li>"
													+ "</ul>" + "</div>"
													+ "</div>" + "</li>";
										} else {
											addReserverList += "<li>"
													+ "<div class='member_wrap'>"
													+ "<div class='d-flex'>"
													+ "<div class='flex-shrink-0'><img class='rounded-circle' src='"+result[i].profile_img_route+"' alt='...' /></div>"
													+ "<div class='ms-3'><div class='fw-bold reserver_data'>"
													+ result[i].nick_name
													+ "<p>"
													+ result[i].req_date
													+ "</p></div>"
													+ result[i].req_comment
													+ "</div>"
													+ "</div>"
													+ "<div class='btn-group'>"
													+ "<button type='button' class='btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow' data-bs-toggle='dropdown' aria-expanded='false'><i class='bx bx-dots-vertical-rounded'></i></button>"
													+ "<ul class='dropdown-menu dropdown-menu-end' style=''>"
													+ "<li><a class='dropdown-item' href='javascript:void(0);'>승인</a></li>"
													+ "<li><hr class='dropdown-divider'></li>"
													+ "<li><a class='dropdown-item' href='javascript:void(0);'>거절</a></li>"
													+ "</ul>" + "</div>"
													+ "</div>" + "</li>";
										}
									}
									$adminReserverList.html(addReserverList);
								} else {
									addReserverList += "<li>"
											+ "<div class='member_wrap'>"
											+ "신청이 아직 없습니다." + "</div>"
											+ "</li>";
									$adminReserverList.html(addReserverList);
								}
							},
							error : function(request, status, errordata) {
								alert("error code:" + request.status + "/n"
										+ "message :" + request.responseText
										+ "\n" + "error :" + errordata + "\n");
							}
						});
			}
			
		//study_comment script
		$(document).on('click', '.reply_choice',showReplyCommentAreaHandler);
		$('#ajax_comment').on('click', ajaxCommentClickHandler);
		$(document).on('click', '.reply_comment', ajaxReplyCommentClickHandler);
		
		function showReplyCommentAreaHandler(){
			var $thisCommentReply = $(this).next('.replyCommentArea');
			console.log($thisCommentReply);
			$thisCommentReply.css('display','block');
		}
		
		function ajaxCommentClickHandler() {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			var $printCommentList = $('#printCommentList');
			
			const searchParams = new URLSearchParams(location.search);
			const urlParams = new URL(location.href).searchParams;
			const study_no = urlParams.get('study_no');
			
			var study_comment = $('.form-control').val();
			$.ajax({
				url : 'writeStdCmt',
				type : 'POST',
				data : {
					study_no : study_no,
					study_comment : study_comment
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				dataType : 'json',
				success : function(result) {
					console.log(result);
					alert("댓글 등록에 성공했습니다.");
					if (result != null) {
						let refreshCommentList = "<div class='d-flex mb-4'><div class='d-flex mb-4'>";
						for (var i = 0; i < result.length; i++) {
										if(result[i].STUDY_COMMENT_LEVEL == 0){
											refreshCommentList += "</div>"
												+"</div>"
												+"<div class='d-flex mb-4'>"
												+"<div class='flex-shrink-0'>"
												+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
												+"</div>"
												+"<div class='ms-3'>"
												+"<span>"
												+result[i].STUDY_COMMENT_DATE
												+"</span>"
												+"<div class='fw-bold'>"
												+result[i].NICK_NAME
												+"</div>"
												+"<div class='commentArea'>"
												+"<div>"
												+result[i].STUDY_COMMENT
												+"</div>"
												+"<input type='hidden' class='comment_origin'"
												+"value=\'"
												+result[i].STUDY_COMMENT_ORIGIN
												+"\'>" + "<input "
												+"type='hidden' class='comment_level'"
												+"value=\'"
												+result[i].STUDY_COMMENT_LEVEL
												+"\'>" + "<input "
												+"type='hidden' class='comment_seq'"
												+"value=\'"
												+result[i].STUDY_COMMENT_SEQ
												+"\'>"
												+"</div>"
												+"<button type='button' class='reply_choice'>reply</button>"
												+"<div class='replyCommentArea'>"
												+"<textarea class='form-control' rows='3'></textarea>"
												+"<button type='submit' class='reply_comment'>등록</button>"
												+"</div>";
										}else if(result[i].STUDY_COMMENT_LEVEL == 1){
											refreshCommentList +="<div class='d-flex mt-4'>"
												+"<div class='flex-shrink-0'>"
												+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
												+"</div>"
												+"<div class='ms-3'>"
												+"<span>"
												+result[i].STUDY_COMMENT_DATE
												+"</span>"
												+"<div class='fw-bold'>"
												+result[i].NICK_NAME
												+"</div>"
												+"<div class='commentArea'>"
												+"<div>"
												+result[i].STUDY_COMMENT
												+"</div>"
												+"<input type='hidden' class='comment_origin'"
												+"value=\'"
												+result[i].STUDY_COMMENT_ORIGIN
												+"\'>" + "<input "
												+"type='hidden' class='comment_level'"
												+"value=\'"
												+result[i].STUDY_COMMENT_LEVEL
												+"\'>" + "<input "
												+"type='hidden' class='comment_seq'"
												+"value=\'"
												+result[i].STUDY_COMMENT_SEQ
												+"\'>"
												+"</div>"
												+"<button type='button' class='reply_choice'>reply</button>"
												+"<div class='replyCommentArea'>"
												+"<textarea class='form-control' rows='3'></textarea>"
												+"<button type='submit' class='reply_comment'>등록</button>"
												+"</div>"
												+"</div>"
												+"</div>";
										}else{
											refreshCommentList +="<div class='d-flex mt-4'>"
												+"<div class='flex-shrink-0'>"
												+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
												+"</div>"
												+"<div class='ms-3'>"
												+"<span>"
												+result[i].STUDY_COMMENT_DATE
												+"</span>"
												+"<div class='fw-bold'>"
												+result[i].NICK_NAME
												+"</div>"
												+"<div class='commentArea'>"
												+"<div>"
												+result[i].STUDY_COMMENT
												+"</div>"
												+"<input type='hidden' class='comment_origin'"
												+"value=\'"
												+result[i].STUDY_COMMENT_ORIGIN
												+"\'>" + "<input "
												+"type='hidden' class='comment_level'"
												+"value=\'"
												+result[i].STUDY_COMMENT_LEVEL
												+"\'>" + "<input "
												+"type='hidden' class='comment_seq'"
												+"value=\'"
												+result[i].STUDY_COMMENT_SEQ
												+"\'>"
												+"</div>"
												+"<button type='button' class='reply_choice'>reply</button>"
												+"<div class='replyCommentArea'>"
												+"<textarea class='form-control' rows='3'></textarea>"
												+"<button type='submit' class='reply_comment'>등록</button>"
												+"</div>"
												+"</div>"
												+"</div>";
										}
						}
						$printCommentList.html(refreshCommentList);
					}
				},
				error : function(request, error) {
					alert("댓글 등록에 실패했습니다.");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error" + error);
				}
			});
		}
		function ajaxReplyCommentClickHandler() {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			var $printCommentList = $('#printCommentList');
			
			const searchParams = new URLSearchParams(location.search);
			const urlParams = new URL(location.href).searchParams;
			const study_no = urlParams.get('study_no');
			
			var study_comment = $(this).prev('.form-control').val();
			var study_comment_origin = $(this).parents('.replyCommentArea').siblings('.commentArea').children('.comment_origin').val();
			var study_comment_level = $(this).parents('.replyCommentArea').siblings('.commentArea').children('.comment_level').val();
			var study_comment_seq = $(this).parents('.replyCommentArea').siblings('.commentArea').children('.comment_seq').val();
			$.ajax({
				url : 'answerStdCmt',
				type : 'POST',
				data : {
					study_no : study_no,
					study_comment : study_comment,
					study_comment_origin : study_comment_origin,
					study_comment_level : study_comment_level,
					study_comment_seq : study_comment_seq
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				dataType : 'json',
				success : function(result) {
					console.log(result);
					alert("댓글 등록에 성공했습니다.");
					if (result != null) {
						let refreshCommentList = "<div class='d-flex mb-4'><div class='d-flex mb-4'>";
						for (var i = 0; i < result.length; i++) {
										if(result[i].STUDY_COMMENT_LEVEL == 0){
											refreshCommentList += "</div>"
												+"</div>"
												+"<div class='d-flex mb-4'>"
												+"<div class='flex-shrink-0'>"
												+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
												+"</div>"
												+"<div class='ms-3'>"
												+"<span>"
												+result[i].STUDY_COMMENT_DATE
												+"</span>"
												+"<div class='fw-bold'>"
												+result[i].NICK_NAME
												+"</div>"
												+"<div class='commentArea'>"
												+"<div>"
												+result[i].STUDY_COMMENT
												+"</div>"
												+"<input type='hidden' class='comment_origin'"
												+"value=\'"
												+result[i].STUDY_COMMENT_ORIGIN
												+"\'>" + "<input "
												+"type='hidden' class='comment_level'"
												+"value=\'"
												+result[i].STUDY_COMMENT_LEVEL
												+"\'>" + "<input "
												+"type='hidden' class='comment_seq'"
												+"value=\'"
												+result[i].STUDY_COMMENT_SEQ
												+"\'>"
												+"</div>"
												+"<button type='button' class='reply_choice'>reply</button>"
												+"<div class='replyCommentArea'>"
												+"<textarea class='form-control' rows='3'></textarea>"
												+"<button type='submit' class='reply_comment'>등록</button>"
												+"</div>";
										}else if(result[i].STUDY_COMMENT_LEVEL == 1){
											refreshCommentList +="<div class='d-flex mt-4'>"
												+"<div class='flex-shrink-0'>"
												+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
												+"</div>"
												+"<div class='ms-3'>"
												+"<span>"
												+result[i].STUDY_COMMENT_DATE
												+"</span>"
												+"<div class='fw-bold'>"
												+result[i].NICK_NAME
												+"</div>"
												+"<div class='commentArea'>"
												+"<div>"
												+result[i].STUDY_COMMENT
												+"</div>"
												+"<input type='hidden' class='comment_origin'"
												+"value=\'"
												+result[i].STUDY_COMMENT_ORIGIN
												+"\'>" + "<input "
												+"type='hidden' class='comment_level'"
												+"value=\'"
												+result[i].STUDY_COMMENT_LEVEL
												+"\'>" + "<input "
												+"type='hidden' class='comment_seq'"
												+"value=\'"
												+result[i].STUDY_COMMENT_SEQ
												+"\'>"
												+"</div>"
												+"<button type='button' class='reply_choice'>reply</button>"
												+"<div class='replyCommentArea'>"
												+"<textarea class='form-control' rows='3'></textarea>"
												+"<button type='submit' class='reply_comment'>등록</button>"
												+"</div>"
												+"</div>"
												+"</div>";
										}else{
											refreshCommentList +="<div class='d-flex mt-4'>"
												+"<div class='flex-shrink-0'>"
												+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
												+"</div>"
												+"<div class='ms-3'>"
												+"<span>"
												+result[i].STUDY_COMMENT_DATE
												+"</span>"
												+"<div class='fw-bold'>"
												+result[i].NICK_NAME
												+"</div>"
												+"<div class='commentArea'>"
												+"<div>"
												+result[i].STUDY_COMMENT
												+"</div>"
												+"<input type='hidden' class='comment_origin'"
												+"value=\'"
												+result[i].STUDY_COMMENT_ORIGIN
												+"\'>" + "<input "
												+"type='hidden' class='comment_level'"
												+"value=\'"
												+result[i].STUDY_COMMENT_LEVEL
												+"\'>" + "<input "
												+"type='hidden' class='comment_seq'"
												+"value=\'"
												+result[i].STUDY_COMMENT_SEQ
												+"\'>"
												+"</div>"
												+"<button type='button' class='reply_choice'>reply</button>"
												+"<div class='replyCommentArea'>"
												+"<textarea class='form-control' rows='3'></textarea>"
												+"<button type='submit' class='reply_comment'>등록</button>"
												+"</div>"
												+"</div>"
												+"</div>";
										}
						}
						$printCommentList.html(refreshCommentList);
					}
				},
				error : function(request, error) {
					alert("댓글 등록에 실패했습니다.");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error" + error);
				}
			});
		}
		</script>
	</div>
	<!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->