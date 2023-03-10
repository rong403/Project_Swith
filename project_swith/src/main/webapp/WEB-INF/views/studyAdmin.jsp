<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</script>