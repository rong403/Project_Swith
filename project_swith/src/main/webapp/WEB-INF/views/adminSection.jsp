<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- ENDS filter -->
    <!-- Sidebar -->
    <div class="mySidebar">
      <!-- table -->
      <h6 class="mySidebar side-title"><span>Options</span></h6>
      <!-- ENDS table -->
      <!-- My Category -->
	   	<div class="mypage_mid_l admin">
	         <div class="mypage_mid_l_wrap">
	             <ul class="mypage_mid_l_ul">
	                 <li class="mypage_mid_l_ul_li"><a href="javascript:listChangeHandler('스터디 관리')" class="mypage_mid_l_ul_li_a">스터디 관리<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="javascript:listChangeHandler('스터디 카페 관리')" class="mypage_mid_l_ul_li_a">스터디 카페 관리<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="javascript:listChangeHandler('회원 관리')" class="mypage_mid_l_ul_li_a">회원 관리<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	             </ul>
	         </div>
	     </div>
	   <!-- ENDS My Category -->
    </div>
    <!-- ENDS Sidebar -->
    <!--   -->
    <!-- MyStudyList -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title" id="myStudyTitle">스터디 관리</h3><hr>
    		</div>
    		<div>
    			<form class="study_serch_form" id="study_serch_form">
    				<label>검색 : </label>
    				<input type="text" name="study_keyword" placeholder="스터디 명을 입력해주세요">
    				<select name="category_code">
    					<option value="0">전체</option>
    					<option value="1">IT</option>
    					<option value="2">어학</option>
    					<option value="3">취업</option>
    					<option value="4">자격증</option>
    					<option value="5">고시/공무원</option>
    					<option value="6">취미/교양</option>
    					<option value="7">기타</option>
    				</select>
    				<select name="study_condition">
    					<option value="0">전체</option>
    					<option value="1">시작 예정</option>
    					<option value="2">진행 중</option>
    					<option value="3">종료</option>
    				</select>
    				<button type="button" id="study_serch_btn" class="btn btn-sm btn-secondary">조회</button>
    			</form>
   				<div>
   					<div class="admin_list">
			        	<div class="list_content">
			        		<h5>해당 스터디 명</h5>
			        		<div>
			        			<p>모임장 아이디 : user11</p>
			        			<div>
			        				<p>생성일 : 2023.01.02</p>
			        				<p>시작일 : 2023.01.02</p>
			        				<p>종료일 : 2023.01.02</p>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="list_content">
			        		<h5>해당 스터디 명</h5>
			        		<div>
			        			<p>모임장 아이디 : user11</p>
			        			<div>
			        				<p>생성일 : 2023.01.02</p>
			        				<p>시작일 : 2023.01.02</p>
			        				<p>종료일 : 2023.01.02</p>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="list_content">
			        		<h5>해당 스터디 명</h5>
			        		<div>
			        			<p>모임장 아이디 : user11</p>
			        			<div>
			        				<p>생성일 : 2023.01.02</p>
			        				<p>시작일 : 2023.01.02</p>
			        				<p>종료일 : 2023.01.02</p>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="list_content">
			        		<h5>해당 스터디 명</h5>
			        		<div>
			        			<p>모임장 아이디 : user11</p>
			        			<div>
			        				<p>생성일 : 2023.01.02</p>
			        				<p>시작일 : 2023.01.02</p>
			        				<p>종료일 : 2023.01.02</p>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="list_content">
			        		<h5>해당 스터디 명</h5>
			        		<div>
			        			<p>모임장 아이디 : user11</p>
			        			<div>
			        				<p>생성일 : 2023.01.02</p>
			        				<p>시작일 : 2023.01.02</p>
			        				<p>종료일 : 2023.01.02</p>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="list_content">
			        		<h5>해당 스터디 명</h5>
			        		<div>
			        			<p>모임장 아이디 : user11</p>
			        			<div>
			        				<p>생성일 : 2023.01.02</p>
			        				<p>시작일 : 2023.01.02</p>
			        				<p>종료일 : 2023.01.02</p>
			        			</div>
			        		</div>
			        	</div>
			        </div>
		            <ul class="pager">
				        <li class="first-page"><a href="#">«</a></li>
				        <li><a href="#">‹</a></li>
				        <li class="active"><a href="#">1</a></li>
				        <li><a href="#">2</a></li>
				        <li><a href="#">3</a></li>
				        <li><a href="#">4</a></li>
				        <li><a href="#">5</a></li>
				        <li><a href="#">›</a></li>
				     	<li class="last-page"><a href="#">»</a></li>
				    </ul>
   				</div>
	    	</div>
	   </div>
    </div>
    <!-- End MyStudyList -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<script>
function listChangeHandler(title) {
	$("#myStudyTitle").text(title);
}

function studySerchAjax() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $studySerchForm = $("#study_serch_form").serialize();
	
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/studyList.lo"
		, type : "post"
		, data : $studySerchForm
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			console.log(result);
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
}
$("#study_serch_btn").on("click", studySerchAjax);
</script>
<!-- ENDS MAIN -->