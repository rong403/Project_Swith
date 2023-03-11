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
							<div id="penalty_list_wrap">
							</div>
							<div class="h6_wrap">
								<h6>벌점 부과</h6>
								<p>*벌점 및 사유 선택 후 적용 시 부과</p>
							</div>
							<hr>
							<form id="penalty_form">
								<div class="box">
									<input type="checkbox" id="one" name="penalty_point" value="1">
									<span class="check"></span> <label for="one">과제 미이행(1점)</label>
								</div>
								<div class="box">
									<input type="checkbox" id="two" name="penalty_point" value="2">
									<span class="check"></span> <label for="two">모임 무단 불참(2점)</label>
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
				<div class="modal penaltyDelete">
					<div class="modal_content_wrap penaltyDelete">
						<div class="modal_content penaltyDelete">
							<h6>벌점을 정말 삭제하시겠습니까?</h6>
							<input type="hidden" id="admin_penaltyDelete_no">
							<div class="text_wrap">
								<input type="text" id="admin_penaltyDelete_reason" maxlength="50" placeholder="사유를 입력해주세요(최대 50자)">
								<div>
									<span id="penaltyDelete_textarea_cnt" class="tip_mark admin">0</span><span class="tip_mark admin">/50자</span>
								</div>
							</div>
							<div class="btn_wrap">
								<button class="btn btn-danger" type="button" id="amdin_penaltyDelete_btn">삭제</button>
								<button class="btn btn-secondary" type="button" id="amdin_penaltyDelete_modal_close">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
<script>
//멤버관리
//벌점 관리 - 모달창
var penaltyListNum = 0;
function penaltyModalShowHandler(num) {
	penaltyListNum = num;
	penaltyListAjax();
	$("#penalty_form input[type=checkbox][name=penalty_point]:checked").prop("checked", false);
	$(".modal.penalty").show();
}
function penaltyModalHideHandler() {
	$(".modal.penalty").hide();
}
$("#penalty_modal_close").on("click", penaltyModalHideHandler);
//벌점 관리 - 벌점 목록 조회
function penaltyListAjax() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $penaltyList = $("#penalty_list_wrap");
	
	$.ajax({
		url : "<%=request.getContextPath()%>/penalty/list.lo"
		, type : "post"
		, data : { agr_number : penaltyListNum }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			let addPenaltyList = "";
			if(result.length > 0) {
				for(var i = 0; i < result.length; i++)
				addPenaltyList += "<div class='penalty_list'>"+
										"<p>"+result[i].penalty_reason+"</p>"+
										"<p>"+result[i].penalty_time+"</p>"+
										"<button class='btn penalty_delete' onclick='penaltyDeleteModalShowHandler("+result[i].penalty_no+")'>"+
											"<img class='penalty_delete_img' src='<%=request.getContextPath()%>/resources/map/images/x_icon.png'>"+
										"</button>"+
									"</div>";
				
			} else {
				addPenaltyList += "<div class='list_null'>벌점이 없습니다.</div>";
			}
			$penaltyList.html(addPenaltyList);
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});	
}
//벌점 관리 - 삭제 확인 모달
function penaltyDeleteModalShowHandler(num) {
	$("#admin_penaltyDelete_no").val(num);
	$(".modal.penaltyDelete").show();
}
function penaltyDeleteModalHideHandler() {
	$(".modal.penaltyDelete").hide();
}
$("#amdin_penaltyDelete_modal_close").on("click", penaltyDeleteModalHideHandler);
//벌점 관리 - 벌점 삭제 사유 글자수 체크
function penaltyDeleteReasonCountHandler() {
	var penaltyDeleteReason = $("#admin_penaltyDelete_reason").val();
	
	// 글자수 세기
    if (penaltyDeleteReason.length == 0 || penaltyDeleteReason == '') {
    	$('#penaltyDelete_textarea_cnt').text('0');
    } else {
    	$('#penaltyDelete_textarea_cnt').text(penaltyDeleteReason.length);
    }
}
$("#admin_penaltyDelete_reason").on("propertychange change paste input",penaltyDeleteReasonCountHandler);
//벌점 관리 - 벌점 삭제
function penaltyDeleteAjax() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var penaltyNo = $("#admin_penaltyDelete_no").val();
	var penaltyReason =	$("#admin_penaltyDelete_reason").val();
	
	if(penaltyReason == null || penaltyReason == "") {
		alert("사유를 입력해주세요");
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/penalty/delete.lo"
		, type : "post"
		, data : { 
					penalty_no : penaltyNo, 
					penalty_reason : penaltyReason 
				 }
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			if(result > 0) {
				alert("벌점이 삭제되었습니다.");
			} else {
				alert("벌점 삭제를 시도하였지만 실패하였습니다.");
			}
			penaltyDeleteModalHideHandler();
			penaltyListAjax();
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});	
}
$("#amdin_penaltyDelete_btn").on("click", penaltyDeleteAjax);
//벌점 관리 - 벌점 부과
function penaltyWriteAjax() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	//선택된 값과 사유를 담을 배열
	let checkValArray = [];
	let checkTextArray = [];
	
	//선택된 값과 그 형제 요소 라밸의 사유 텍스트 담기
	var checkArray = $("#penalty_form input[type=checkbox][name=penalty_point]:checked");
	
	if(checkArray.length == 0) {
		alert("선택 된 벌점 및 사유가 없습니다.");
		return;
	}
	
    $(checkArray).each(function() {
    	checkValArray.push($(this).val());
    	checkTextArray.push($(this).siblings("label").text());
    });
    
	$.ajax({
		url : "<%=request.getContextPath()%>/penalty/write.lo"
		, type : "post"
		, data : { 
					checkVal : checkValArray, 
					checkText : checkTextArray,
					agr_number : penaltyListNum
				 }
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			if(result > 0 && result != 99) {
				alert("벌점이 부과되었습니다.");
			} else {
				alert("벌점 부과를 시도하였지만 실패하였습니다.");
			}
			penaltyModalHideHandler();
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});	 
}
$("#penalty_from_btn").on("click", penaltyWriteAjax);
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
		url : "<%=request.getContextPath()%>/studyManager/participantList.lo"
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
						                       	"<div class='flex-shrink-0'><img class='rounded-circle' src='"+result.voList[i].profile_img_route+"' alt='...' /></div>"+
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
		url : "<%=request.getContextPath()%>/studyManager/reserverList.lo",
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