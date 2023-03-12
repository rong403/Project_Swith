<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- ENDS filter -->
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/myPage/myPageInclude/mySidebar.jsp"/>
    <!-- ENDS Sidebar -->
    <!-- MyInfo -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">회원 탈퇴 안내</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tbody>
					<tr class="first-item">
						<td class="attr-name">회원 탈퇴 안내</td>
						<td>
							<ul>
								<li>회원 탈퇴 시 저장된 개인 정보는 모두 파기됩니다.</li>
								<li>탈퇴 신청이 접수되면 해당 아이디로 더이상 접속할 수 없습니다.</li>
								<li><br>삭제되는 내용</li>
								<li>개인 일정, 가입한 스터디 목록, 작성한 스터디 게시글 등</li>
								<li>서비스 이용 시작부터 생성 및 저장된 정보 일체</li>
								<li>회원 탈퇴 후 삭제된 정보는 복구되지 않습니다.</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="attr-name">유의사항 확인</td>
						<td><input id="agreeBtn" type="checkbox"><span>확인하였습니다.</span></td>
					</tr>
					<tr class="first-item">
						<td colspan="2">
							<div style="text-align: center">
								<button type="button" onclick="isValidation()">탈퇴</button>
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
<div class="modal delMember">
   	<div class="modal_content_wrap delMember">
   		<div class="modal_content delMember">
   		<form action="<%=request.getContextPath()%>/deletemember" method="post">
   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="mb-3 h6_wrap">
            	<h6>Swith 사이트를 정말로 탈퇴하시겠습니까?</h6>
            </div>
		  	<div class="btn_wrap">
              	<button class="btn btn-danger" type="submit" id="delMember_from_btn">탈퇴</button>
               	<button class="btn btn-secondary" type="button" id="delMember_modal_close">닫기</button>
            </div>
   		</form>
   		</div>
   	</div>
</div>
<script>
var header = $("meta[name='_csrf_header']").attr('content');
var token = $("meta[name='_csrf']").attr('content');
$("#delMember_modal_close").on("click", delMemberModalHideHandler);
function delMemberModalHideHandler() {
	location.reload();
}
function isValidation(){
	if($('#agreeBtn').is(":checked") == false){
		alert("유의사항 확인버튼을 체크해주세요.");
	} else {
		$(".modal.delMember").show();
	}
}
</script>