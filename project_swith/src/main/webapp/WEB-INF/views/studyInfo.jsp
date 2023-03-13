<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="stdInfo_div" id="info_div">
	<div>
		<br>
		<h4>모임정보</h4>
		<br>
		<div>
			<c:choose>
				<c:when test="${empty study }">
							등록된 스터디가 없습니다!
						</c:when>
				<c:otherwise>
					<div class="excerpt" name="study_detailInfo">${study.study_detailInfo }</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
<script>
function checkAajx() {
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
</script>
	<br> <br>
	<div class="std_info_title_wrap">
		<h3>
			멤버 ${stdPNum} / ${study.study_people } &nbsp;&nbsp;&nbsp; 
		</h3>
		<c:choose>
			<c:when test="${stAdmin == 1}">
				<button id="stdInfo_btn" type="button" class="btn btn-secondary">관리자 페이지</button>
			</c:when>
			<c:when test="${stdAuth == 1}">
				<div></div>
			</c:when>
			<c:otherwise>
				<c:if test="${study.study_recruitment_condition == 1}">
				<c:choose>
					<c:when test="${stdReserverCondition == 1}">
						<button type="button" class="btn btn-outline-secondary">신청완료</button>
					</c:when>
					<c:otherwise>
						<button id="std_join_btn" type="button" class="btn btn-secondary">가입신청</button>
					</c:otherwise>
				</c:choose>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
<!-- 가입신청 모달 -->
<div class="modal insertReserver">
	<div class="modal_content_wrap insertReserver">
		<div class="modal_content insertReserver">
			<div class="mb-3 insertReserver_title">
				<h6>${study.study_name }</h6>
			</div>
			<div class="mb-3 insertReserver">
				<div class="label_wrap top">
					<div>
						<label class="form-label" for="basic-default-fullname">신청 포부</label>
					</div>
				</div>
				<input id="insertReserver_content" type="text"
					name="req_comment" class="form-control"
					placeholder="신청 포부를 간단하게 입력해 주세요.(최대 65자)" maxlength="65"> 
					<span id="insertReserver_text_cnt" class="tip_mark admin">0</span>
					<span class="tip_mark admin">/65자</span>
			</div>
			<div class="btn_wrap">
				<button class="btn btn-sm btn-info" type="button"
					id="insertReserver_form_btn">신청</button>
				<button class="btn btn-sm btn-secondary" type="button"
					id="insertReserver_modal_close">닫기</button>
			</div>
		</div>
	</div>
</div>
<script>
var header = $("meta[name='_csrf_header']").attr('content');
var token = $("meta[name='_csrf']").attr('content');
const searchParams = new URLSearchParams(location.search);
const urlParams = new URL(location.href).searchParams;
const study_no = urlParams.get('study_no');
$("#std_join_btn").on("click", insertReserverModalShowHandler);
$("#insertReserver_form_btn").on("click", insertReserverModalUpdateHandler);
$("#insertReserver_modal_close").on("click", insertReserverModalHideHandler);
function insertReserverModalShowHandler() {
	$(".modal.insertReserver").show();
}
function insertReserverModalHideHandler() {
	$(".modal.insertReserver").hide();
}
function insertReserverModalUpdateHandler() {
	$.ajax({
		type: "POST",
		url: '<%=request.getContextPath()%>/insertStudyReserver',
		data: {req_comment:$('#insertReserver_content').val()
			, study_no:study_no
		},
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		success: function(data){
			if(data == 'success'){
				alert("스터디 신청에 성공했습니다.");
			}else{
				alert("스터디 신청에 실패했습니다.");
			}
			location.reload();
		}
	});
}
$('#insertReserver_content').keyup(function(){
	var req_comment = $('#insertReserver_content');
	if (req_comment.val().length == 0 || req_comment.val() == '') {
		$('#insertReserver_text_cnt').text('0');
	} else {
		$('#insertReserver_text_cnt').text(req_comment.val().length);
	}
});
</script>
	<hr>

	<section class="mb-5">
		<div class="card bg-light">
			<div class="card-body">
				<!-- Comment form-->
				<form class="mb-4">
					<textarea class="form-control" id="inputCommentText" rows="3"
						placeholder="댓글을 작성해 주세요."></textarea>
					<button type="button" id="ajax_comment">등록</button>
				</form>
				<div id="printCommentList">
					<div class="d-flex mb-4">
						<div class="d-flex mb-4">
							<!-- STUDY_COMMENT APPLY -->
							<c:forEach items="${comment }" var="comment" varStatus="status">
								<c:if test="${comment.STUDY_COMMENT_LEVEL eq 0}">
						</div>
					</div>
					<div class="d-flex mb-4">
						<div class="flex-shrink-0">
							<img class="rounded-circle"
								src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						</div>
						<div class="ms-3">
							<span>${comment.STUDY_COMMENT_DATE }</span>
							<div class="fw-bold">${comment.NICK_NAME }</div>
							<input type="hidden" class="comment_member_id"
								value="${comment.MEMBER_ID }">
							<div class="commentArea">
								<div>${comment.STUDY_COMMENT }</div>
								<input type="hidden" class="comment_no"
									value="${comment.STUDY_COMMENT_NO }"> <input
									type="hidden" class="comment_origin"
									value="${comment.STUDY_COMMENT_ORIGIN }"> <input
									type="hidden" class="comment_level"
									value="${comment.STUDY_COMMENT_LEVEL }"> <input
									type="hidden" class="comment_seq"
									value="${comment.STUDY_COMMENT_SEQ }">
							</div>
							<c:if test="${comment.MEMBER_ID eq loginMember }">
								<button type="button" class="comment_update">수정</button>
								<div class="updateCommentArea">
									<textarea class="form-control updateCommentText" rows="3">${comment.STUDY_COMMENT }</textarea>
									<button type="button" class="update_comment">등록</button>
								</div>
							</c:if>
							<c:if
								test="${admin eq 0 and (comment.MEMBER_ID ne loginMember) }">
								<button type="button" class="comment_report">신고</button>
							</c:if>
							<c:if test="${(admin ge 1) or (stAdmin ge 1)}">
								<button type="button" class="comment_delete">삭제</button>
							</c:if>
							<button type="button" class="reply_choice">답글</button>
							<div class="replyCommentArea">
								<textarea class="form-control replyCommentText" rows="3"
									placeholder="답글을 작성해 주세요."></textarea>
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
										<div class="fw-bold">${comment.NICK_NAME }</div>
										<input type="hidden" class="comment_member_id"
											value="${comment.MEMBER_ID }">
										<div class="commentArea">
											<div>${comment.STUDY_COMMENT }</div>
											<input type="hidden" class="comment_no"
												value="${comment.STUDY_COMMENT_NO }"> <input
												type="hidden" class="comment_origin"
												value="${comment.STUDY_COMMENT_ORIGIN }"> <input
												type="hidden" class="comment_level"
												value="${comment.STUDY_COMMENT_LEVEL }"> <input
												type="hidden" class="comment_seq"
												value="${comment.STUDY_COMMENT_SEQ }">
										</div>
										<c:if test="${comment.MEMBER_ID eq loginMember }">
											<button type="button" class="comment_update">수정</button>
											<div class="updateCommentArea">
												<textarea class="form-control updateCommentText" rows="3">${comment.STUDY_COMMENT }</textarea>
												<button type="button" class="update_comment">등록</button>
											</div>
										</c:if>
										<c:if
											test="${admin eq 0 and (comment.MEMBER_ID ne loginMember) }">
											<button type="button" class="comment_report">신고</button>
										</c:if>
										<c:if test="${(admin ge 1) or (stAdmin ge 1)}">
											<button type="button" class="comment_delete">삭제</button>
										</c:if>
										<button type="button" class="reply_choice">답글</button>
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
										<div class="fw-bold">${comment.NICK_NAME }</div>
										<input type="hidden" class="comment_member_id"
											value="${comment.MEMBER_ID }">
										<div class="commentArea">
											<div>${comment.STUDY_COMMENT }</div>
											<input type="hidden" class="comment_no"
												value="${comment.STUDY_COMMENT_NO }"> <input
												type="hidden" class="comment_origin"
												value="${comment.STUDY_COMMENT_ORIGIN }"> <input
												type="hidden" class="comment_level"
												value="${comment.STUDY_COMMENT_LEVEL }"> <input
												type="hidden" class="comment_seq"
												value="${comment.STUDY_COMMENT_SEQ }">
										</div>
										<c:if test="${comment.MEMBER_ID eq loginMember }">
											<button type="button" class="comment_update">수정</button>
											<div class="updateCommentArea">
												<textarea class="form-control updateCommentText" rows="3">${comment.STUDY_COMMENT }</textarea>
												<button type="button" class="update_comment">등록</button>
											</div>
										</c:if>
										<c:if
											test="${admin eq 0 and (comment.MEMBER_ID ne loginMember) }">
											<button type="button" class="comment_report">신고</button>
										</c:if>
										<c:if test="${(admin ge 1) or (stAdmin ge 1)}">
											<button type="button" class="comment_delete">삭제</button>
										</c:if>
										<button type="button" class="reply_choice">답글</button>
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
				<!-- END STUDY_COMMENT APPLY -->
			</div>
		</div>
	</section>
	<br>
</div>
<script>
		//study_comment script
		$(document).on('click', '.reply_choice', showReplyCommentAreaHandler);
		$(document).on('click', '.comment_update', showUpdateCommentAreaHandler);
		$('#ajax_comment').on('click', ajaxCommentClickHandler);
		$(document).on('click', '.reply_comment', ajaxReplyCommentClickHandler);
		$(document).on('click', '.comment_delete', ajaxDeleteCommentClickHandler);
		$(document).on('click', '.update_comment', ajaxUpdateCommentClickHandler);
		
		ajaxCommentLength('inputCommentText', 100);
		ajaxReplyCommentLength('replyCommentText', 100);
		
		function showReplyCommentAreaHandler(){
			var $thisCommentReply = $(this).next('.replyCommentArea');
			console.log($thisCommentReply);
			if($thisCommentReply.css("display") == "none"){
				$thisCommentReply.css('display','block');
			}else{
				$thisCommentReply.css('display','none');
			}
		}
		
		function showUpdateCommentAreaHandler(){
			var $thisCommentUpdate = $(this).next('.updateCommentArea');
			if($thisCommentUpdate.css("display") == "none"){
				$thisCommentUpdate.css('display','block');
			}else{
				$thisCommentUpdate.css('display','none');
			}
		}
		
		function ajaxCommentLength(id, max){
			$('#'+id).keyup(function(e){
				var content = $(this).val();
	
			    if (content.length > max){
			        alert("최대 "+max+"자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, max));
			    }
			});
		}
		function ajaxReplyCommentLength(className, max){
			$('.'+className).keyup(function(e){
				var content = $(this).val();
	
			    if (content.length > max){
			        alert("최대 "+max+"자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, max));
			    }
			});
		}
		
		function refreshCommentList(result){
			let htmlVal = '';
			if (result != null) {
				htmlVal += "<div class='d-flex mb-4'><div class='d-flex mb-4'>";
				for (var i = 0; i < result.commentList.length; i++) {
								if(result.commentList[i].STUDY_COMMENT_LEVEL == 0){
									htmlVal += "</div>"
										+"</div>"
										+"<div class='d-flex mb-4'>"
										+"<div class='flex-shrink-0'>"
										+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
										+"</div>"
										+"<div class='ms-3'>"
										+"<span>"
										+result.commentList[i].STUDY_COMMENT_DATE
										+"</span>"
										+"<div class='fw-bold'>"
										+result.commentList[i].NICK_NAME
										+"</div>"
										+"<input type='hidden' class='comment_member_id' value=\'"
										+result.commentList[i].MEMBER_ID
										+"\'>"
										+"<div class='commentArea'>"
										+"<div>"
										+result.commentList[i].STUDY_COMMENT
										+"</div>"
										+"<input type='hidden' class='comment_no' value=\'"
										+result.commentList[i].STUDY_COMMENT_NO
										+ "\'>"
										+"<input type='hidden' class='comment_origin'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_ORIGIN
										+"\'>" + "<input "
										+"type='hidden' class='comment_level'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_LEVEL
										+"\'>" + "<input "
										+"type='hidden' class='comment_seq'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_SEQ
										+"\'>"
										+"</div>";
										
										if(result.commentList[i].MEMBER_ID == result.loginMember){
											htmlVal += "<button type='button' class='comment_update'>수정</button> "
												+"<div class='updateCommentArea'>"
												+"<textarea class='form-control updateCommentText' rows='3'>"
												+result.commentList[i].STUDY_COMMENT
												+"</textarea>"
												+"<button type='button' class='update_comment'>등록</button>"
												+"</div>";
										}
										
										if((result.admin == 0) && (result.commentList[i].MEMBER_ID!= result.loginMember)){
											htmlVal += "<button type='button' class='comment_report'>신고</button> ";
										}
										
										if((result.admin >= 1) || (result.stAdmin >= 1)){
											htmlVal += "<button type='button' class='comment_delete'>삭제</button> ";
										}
										
									htmlVal += "<button type='button' class='reply_choice'>답글</button>"
										+"<div class='replyCommentArea'>"
										+"<textarea class='form-control replyCommentText' rows='3' placeholder='답글을 작성해 주세요.'></textarea>"
										+"<button type='submit' class='reply_comment'>등록</button>"
										+"</div>";
								}else if(result.commentList[i].STUDY_COMMENT_LEVEL == 1){
									htmlVal +="<div class='d-flex mt-4'>"
										+"<div class='flex-shrink-0'>"
										+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
										+"</div>"
										+"<div class='ms-3'>"
										+"<span>"
										+result.commentList[i].STUDY_COMMENT_DATE
										+"</span>"
										+"<div class='fw-bold'>"
										+result.commentList[i].NICK_NAME
										+"</div>"
										+"<input type='hidden' class='comment_member_id' value=\'"
										+result.commentList[i].MEMBER_ID
										+"\'>"
										+"<div class='commentArea'>"
										+"<div>"
										+result.commentList[i].STUDY_COMMENT
										+"</div>"
										+"<input type='hidden' class='comment_no' value=\'"
										+result.commentList[i].STUDY_COMMENT_NO
										+ "\'>"
										+"<input type='hidden' class='comment_origin'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_ORIGIN
										+"\'>" + "<input "
										+"type='hidden' class='comment_level'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_LEVEL
										+"\'>" + "<input "
										+"type='hidden' class='comment_seq'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_SEQ
										+"\'>"
										+"</div>"
										if(result.commentList[i].MEMBER_ID == result.loginMember){
											htmlVal += "<button type='button' class='comment_update'>수정</button> "
												+"<div class='updateCommentArea'>"
												+"<textarea class='form-control updateCommentText' rows='3'>"
												+result.commentList[i].STUDY_COMMENT
												+"</textarea>"
												+"<button type='button' class='update_comment'>등록</button>"
												+"</div>";
										}
										
										if((result.admin == 0) && (result.commentList[i].MEMBER_ID!= result.loginMember)){
											htmlVal += "<button type='button' class='comment_report'>신고</button> ";
										}
										
										if((result.admin >= 1) || (result.stAdmin >= 1)){
											htmlVal += "<button type='button' class='comment_delete'>삭제</button> ";
										}
									htmlVal += "<button type='button' class='reply_choice'>답글</button>"
										+"<div class='replyCommentArea'>"
										+"<textarea class='form-control replyCommentText' rows='3' placeholder='답글을 작성해 주세요.'></textarea>"
										+"<button type='submit' class='reply_comment'>등록</button>"
										+"</div>"
										+"</div>"
										+"</div>";
								}else{
									htmlVal +="<div class='d-flex mt-4'>"
										+"<div class='flex-shrink-0'>"
										+"<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg'alt='...' />"
										+"</div>"
										+"<div class='ms-3'>"
										+"<span>"
										+result.commentList[i].STUDY_COMMENT_DATE
										+"</span>"
										+"<div class='fw-bold'>"
										+result.commentList[i].NICK_NAME
										+"</div>"
										+"<input type='hidden' class='comment_member_id' value=\'"
										+result.commentList[i].MEMBER_ID
										+"\'>"
										+"<div class='commentArea'>"
										+"<div>"
										+result.commentList[i].STUDY_COMMENT
										+"</div>"
										+"<input type='hidden' class='comment_no' value=\'"
										+result.commentList[i].STUDY_COMMENT_NO
										+ "\'>"
										+"<input type='hidden' class='comment_origin'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_ORIGIN
										+"\'>" + "<input "
										+"type='hidden' class='comment_level'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_LEVEL
										+"\'>" + "<input "
										+"type='hidden' class='comment_seq'"
										+"value=\'"
										+result.commentList[i].STUDY_COMMENT_SEQ
										+"\'>"
										+"</div>"
										if(result.commentList[i].MEMBER_ID == result.loginMember){
											htmlVal += "<button type='button' class='comment_update'>수정</button> "
												+"<div class='updateCommentArea'>"
												+"<textarea class='form-control updateCommentText' rows='3'>"
												+result.commentList[i].STUDY_COMMENT
												+"</textarea>"
												+"<button type='button' class='update_comment'>등록</button>"
												+"</div>";
										}
										
										if((result.admin == 0) && (result.commentList[i].MEMBER_ID!= result.loginMember)){
											htmlVal += "<button type='button' class='comment_report'>신고</button> ";
										}
										
										if((result.admin >= 1) || (result.stAdmin >= 1)){
											htmlVal += "<button type='button' class='comment_delete'>삭제</button> ";
										}
									htmlVal += "<button type='button' class='reply_choice'>답글</button>"
										+"<div class='replyCommentArea'>"
										+"<textarea class='form-control replyCommentText' rows='3' placeholder='답글을 작성해 주세요.'></textarea>"
										+"<button type='submit' class='reply_comment'>등록</button>"
										+"</div>"
										+"</div>"
										+"</div>";
								}
					}
			}
			return htmlVal;
		}
		
		function ajaxCommentClickHandler() {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");

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
					var commentList = refreshCommentList(result);
					$('#printCommentList').html(commentList);
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
					var commentList = refreshCommentList(result);
					$('#printCommentList').html(commentList);
				},
				error : function(request, error) {
					alert("댓글 등록에 실패했습니다.");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error" + error);
				}
			});
		}
		
		function ajaxDeleteCommentClickHandler(){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			var comment_id = $(this).siblings('.comment_member_id').val();
			var study_comment_no = $(this).siblings('.commentArea').children('.comment_no').val();
			
			const searchParams = new URLSearchParams(location.search);
			const urlParams = new URL(location.href).searchParams;
			const study_no = urlParams.get('study_no');
			
			$.ajax({
				url : 'deleteComment',
				type : 'POST',
				data : {
					comment_id : comment_id,
					study_no : study_no,
					study_comment_no : study_comment_no
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				dataType : 'json',
				success : function(result) {
					console.log(result);
					alert("댓글을 삭제했습니다.");
					var commentList = refreshCommentList(result);
					$('#printCommentList').html(commentList);
				},
				error : function(request, error) {
					alert("댓글 삭제에 실패했습니다.");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error" + error);
				}
			});
		}
		
		function ajaxUpdateCommentClickHandler(){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			var comment_id = $(this).parent('.updateCommentArea').siblings('.comment_member_id').val();
			var comment = $(this).siblings('.updateCommentText').val();
			var study_comment_no = $(this).parent('.updateCommentArea').siblings('.commentArea').children('.comment_no').val();
			
			const searchParams = new URLSearchParams(location.search);
			const urlParams = new URL(location.href).searchParams;
			const study_no = urlParams.get('study_no');
			
			$.ajax({
				url : 'updateComment',
				type : 'POST',
				data : {
					comment_id : comment_id,
					comment : comment,
					study_no : study_no,
					study_comment_no : study_comment_no
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				dataType : 'json',
				success : function(result) {
					console.log(result);
					alert("댓글을 수정했습니다.");
					var commentList = refreshCommentList(result);
					$('#printCommentList').html(commentList);
				},
				error : function(request, error) {
					alert("댓글 수정에 실패했습니다.");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error" + error);
				}
			});
		}
</script>