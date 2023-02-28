<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<title>tempStdInfo</title>
<script src="resources/js/jquery-3.6.1.js"></script>
</head>
<body>
	<!-- Comment form-->
	<form class="mb-4">
		<textarea class="form-control" rows="3" placeholder="댓글을 작성해 주세요."></textarea>
		<button type="submit" id="ajax_comment">등록</button>
	</form>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end comment frame -->
	<div>
		<c:forEach items="${comment }" var="comment">
			<form class="mb-4">
				<div class="commentArea">
					<p class='index'>${comment }</p>
					<input type="hidden" class="comment_origin" value="${comment.STUDY_COMMENT_ORIGIN }">
				</div>
				<textarea class="form-control" rows="3"></textarea>
				<button type="submit" class="reply_comment">reply</button>
			</form>
		</c:forEach>
	</div>
	<script>
		$('#ajax_comment').on('click', ajaxCommentClickHandler);
		$('.reply_comment').on('click', ajaxReplyCommentClickHandler);

		function ajaxCommentClickHandler() {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");

			var member_id = 'user22';
			var study_no = '1';
			var study_comment = $('.form-control').val();
			//var study_comment_origin = $('.comment_origin').val();
			$.ajax({
				url : 'writeStdCmt',
				type : 'POST',
				dataType : 'text',
				data : {
					member_id : member_id,
					study_no : study_no,
					study_comment : study_comment
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function() {
					alert("댓글 등록에 성공했습니다.");
				},
				error : function(request, error) {
					alert("댓글 등록에 실패했습니다.");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error" + error);
				}
			});
			$('.form-control').text('댓글을 작성해 주세요.');
		}
		function ajaxReplyCommentClickHandler() {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");

			var member_id = 'user22';
			var study_no = '1';
			var study_comment = $(this).prev('.form-control').val();
			var study_comment_origin = $(this).siblings('.commentArea').children('.comment_origin').val();
			$.ajax({
				url : 'writeStdCmt',
				type : 'POST',
				dataType : 'text',
				data : {
					member_id : member_id,
					study_no : study_no,
					study_comment : study_comment
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function() {
					alert("댓글 등록에 성공했습니다.");
				},
				error : function(request, error) {
					alert("댓글 등록에 실패했습니다.");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error" + error);
				}
			});
			$('.form-control').text('댓글을 작성해 주세요.');
		}
	</script>
</body>
</html>