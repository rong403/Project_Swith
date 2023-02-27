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
	                 <li class="mypage_mid_l_ul_li"><a href="javascript:listChangeHandler('스터디 카페 등록')" class="mypage_mid_l_ul_li_a">스터디 카페 등록<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="javascript:listChangeHandler('스터디 카페 관리')" class="mypage_mid_l_ul_li_a">스터디 카페 관리<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
	                 <li class="mypage_mid_l_ul_li"><a href="javascript:listChangeHandler('예약 통계')" class="mypage_mid_l_ul_li_a">예약 통계<img src="<%=request.getContextPath()%>/resources/images/my_arrow.png" alt=""></a></li>
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
    				<button type="button" onclick="studyAdminSerchAjax(1);" class="btn btn-sm btn-secondary">조회</button>
    			</form>
   				<div>
   					<div class="admin_list" id="admin_list">
   						<div class='list_null'>
   							<h5>원하는 스터디 목록을 조회해주세요.</h5>
   						</div>
			        </div>
		            <ul class="pager" id="admin_page">
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
function studyAdminSerchAjax(num) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $studySerchForm = $("#study_serch_form").serialize();
	var $adminList = $("#admin_list");
	var $adminPage = $("#admin_page");
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/studyList.lo"
		, type : "post"
		, data : $studySerchForm+"&page="+num
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			console.log(result.list);
			console.log(result.currentPage);
			console.log(result.maxPage);
			console.log(result.startPage);
			console.log(result.endPage);
			let addAdminList = "";
			if(result.list.length != 0) {
				for(var i = 0; i < result.list.length; i++) {
					addAdminList +=	"<div class='list_content'>"+
						        		"<h5>"+result.list[i].study_name+"</h5>"+
						        		"<div>"+
						        			"<p>모임장 아이디 : "+result.list[i].nick_name+"</p>"+
						        			"<div>"+
						        				"<p>생성일 : "+result.list[i].study_create_date+"</p>"+
						        				"<p>시작일 : "+result.list[i].study_start_date+"</p>"+
						        				"<p>종료일 : "+result.list[i].study_end_date+"</p>"+
						        			"</div>"+
						        		"</div>"+
						        	"</div>";
				}
				$adminList.html(addAdminList);
			} else {
				addAdminList += "<div class='list_null'><h5>해당 조건의 스터디 목록이 없습니다.</h5></div>";
				$adminList.html(addAdminList);
			}
			
			let addpage = "";
			if(result.maxPage != 0 && result.maxPage != 1) {
				if(result.startPage != 1) {
					addpage += "<li class='first-page'><a href='javascript:studyAdminPageHandler(1);'>«</a></li>"+
							   "<li><a href='javascript:studyAdminPageHandler("+(result.startPage-1)+");'>‹</a></li>";
				}
				for(var i = result.startPage; i <= result.endPage; i++) {
					if(i == result.currentPage) {
						addpage += "<li class='active'><a href='javascript:studyAdminPageHandler("+i+");'>"+i+"</a></li>";
					} else {
						addpage += "<li><a href='javascript:studyAdminPageHandler("+i+");'>"+i+"</a></li>";
					}
				}
				if(result.endPage < result.maxPage) {
					addpage += "<li class='first-page'><a href='javascript:studyAdminPageHandler(1);'>«</a></li>"+
					   			"<li><a href='javascript:studyAdminPageHandler("+(result.endPage+1)+");'>‹</a></li>";
				}
			}
			$adminPage.html(addpage);
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
}
function studyAdminPageHandler(num) {
	studyAdminSerchAjax(num);
}
</script>
<!-- ENDS MAIN -->