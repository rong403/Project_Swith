<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper admin">
    <!-- ENDS filter -->
    <!-- Sidebar -->
    <div class="mySidebar admin">
      <!-- table -->
      <h6 class="mySidebar side-title admin"><span>Options</span></h6>
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
    <div class="right-wrapper admin">
    	<div class="right-content admin">
    		<div class="padding admin">
	    		<div class="title_wrap admin">
    				<h3 class="p-title admin" id="myStudyTitle">스터디 관리</h3>
    				<label class="form-label" id='admin_title_label'><span class="tip_mark admin">*</span>필수 입력 사항</label>
	    		</div>
    			<hr>
    		</div>
    		
    		<div class="admin_content_wrap show" id="admin_study_div">
    			<form class="study_serch_form" id="study_serch_form">
    				<div>
	    				<label>카테고리 : </label>
	    				<select name="study_category">
	    					<option value="0">전체</option>
	    					<option value="1">IT</option>
	    					<option value="2">어학</option>
	    					<option value="3">취업</option>
	    					<option value="4">자격증</option>
	    					<option value="5">고시/공무원</option>
	    					<option value="6">취미/교양</option>
	    					<option value="7">기타</option>
	    				</select>
    				</div>
    				<div>
	    				<label>진행상태 : </label>
	    				<select name="study_condition">
	    					<option value="0">전체</option>
	    					<option value="1">시작 예정</option>
	    					<option value="2">진행 중</option>
	    					<option value="3">종료</option>
	    				</select>
    				</div>
    				<div>
	    				<label>검색 : </label>
    					<input type="text" name="study_keyword" placeholder="키워드를 입력해주세요">
    				</div>
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
	    	
	    	<div class="admin_content_wrap" id="admin_studyCafeEnroll_div">
	    		<form action="<%=request.getContextPath()%>/place/write" method="post" enctype="multipart/form-data">
	    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		          <div class="mb-3">
		          	<div class="label_wrap admin">
		            	<label class="form-label" for="basic-default-fullname">스터디 카페 이름</label>
			            <span class="tip_mark admin">*</span>
		            </div>
		            <input type="text" name="p_name" class="form-control" placeholder="스터디 카페 상호명을 입력해주세요.">
		          </div>
		          <div class="mb-3">
		          	<label class="form-label" for="basic-default-message">스터디 카페 소개</label>
		            <textarea class="form-control admin" name="p_info" placeholder="간단한 소개를 입력해주세요."></textarea>
		          </div>
		          <div class="mb-3">
		          	<div class="label_wrap admin">
		            	<label class="form-label" for="basic-default-phone">전화번호</label>
			            <span class="tip_mark admin">*</span>
		            </div>
		            <input type="text" name="p_phone" class="form-control phone-mask" placeholder="000-0000-0000">
		          </div>
		          <div class="mb-3">
		          	<div class="label_wrap admin">
		            	<label class="form-label" for="basic-default-company">주소</label>
			            <span class="tip_mark admin">*</span>
		            </div>
		            <div class="address_wrap admin">
		            	<input type="text" name="post_code" class="form-control admin" id="adminPostCode" placeholder="우편 번호" readonly="readonly">
		            	<button class="btn address_search admin" type="button" onclick="searchPostCode();">
                            <span>
                                <img src="<%=request.getContextPath()%>/resources/map/images/돋보기로고.jpg">
                                	주소검색
                            </span>
                        </button>
		            </div>
		          </div>
		          <div class="mb-3">
		            <input type="text" name="address_first" class="form-control admin" id="adminmemberAddr" placeholder="기본 주소" readonly="readonly">
		          </div>
		          <div class="mb-3">
		            <input type="text" name="address_second" class="form-control admin" placeholder="상세 주소">
		          </div>
		          <div class="mb-3">
		            <div class="label_wrap admin">
			            <label class="form-label" for="basic-default-email">대표 사진 등록</label>
			            <span class="tip_mark admin">*</span>
		            </div>
		            <input type="file" class="form-control" name="file"  accept="image/*">
		          </div>
		          <button type="submit" class="btn btn-secondary">등록</button>
		        </form>
	    	</div>
<script type="text/javascript">
$(function(){
	var msg = '${msg}';
	if(msg != '') {
		alert(msg);
	}
});
function searchPostCode(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var post_code = data.zonecode;
            var addr = data.roadAddress;
            
            document.getElementById('adminPostCode').value = post_code;
                     document.getElementById("adminmemberAddr").value = addr;
        }
    }).open();
}
</script>
	    	<div class="admin_content_wrap" id="admin_studyCafe_div">
	    		<form class="study_serch_form" id="studyCafe_serch_form">
	    			<div>
	    				<label>시도 : </label>
	    				<select name="sido_name" id="sido">
	    					<option value="선택">선택</option>
	                   		<option value="서울">서울</option>
	                   		<option value="부산">부산</option>
	                   		<option value="대구">대구</option>
	                   		<option value="인천">인천</option>
	                   		<option value="광주">광주</option>
	                   		<option value="대전">대전</option>
	                   		<option value="울산">울산</option>
	                   		<option value="세종특별자치시">세종</option>
	                   		<option value="경기">경기도</option>
	                   		<option value="강원">강원도</option>
	                   		<option value="충북">충청북도</option>
	                   		<option value="충남">충청남도</option>
	                   		<option value="전북">전라북도</option>
	                   		<option value="전남">전라남도</option>
	                   		<option value="경북">경상북도</option>
	                   		<option value="경남">경상남도</option>
	                   		<option value="제주">제주도</option>
	    				</select>
	    			</div>
	    			<div>
	    				<label>시군구 : </label>
	    				<select name="area_code" id="area_code">
	                		<option value="0"> - </option>
	    				</select>
	    			</div>
	    			<div>
	    				<label>검색 : </label>
	    				<input type="text" name="studyCafe_keyword" placeholder="키워드를 입력해주세요">
	    			</div>
    				<button type="button" onclick="studyCafeAdminSerchAjax(1);" class="btn btn-sm btn-secondary">조회</button>
    			</form>
   				<div>
   					<div class="admin_list" id="admin_cafe_list">
   						<div class='list_null'>
   							<h5>원하는 스터디카페 목록을 조회해주세요.</h5>
   						</div>
			        </div>
		            <ul class="pager" id="admin_cafe_page">
				    </ul>
   				</div>
	    	</div>
	    	<div class="admin_content_wrap" id="admin_reserve_div">
	    		<form class="study_serch_form" id="reserve_serch_form">
	    			<div>
	    				<label>시도 : </label>
	    				<select name="sido_name" id="reserve_sido">
	    					<option value="선택">선택</option>
	                   		<option value="전체">전체</option>
	                   		<option value="서울">서울</option>
	                   		<option value="부산">부산</option>
	                   		<option value="대구">대구</option>
	                   		<option value="인천">인천</option>
	                   		<option value="광주">광주</option>
	                   		<option value="대전">대전</option>
	                   		<option value="울산">울산</option>
	                   		<option value="세종특별자치시">세종</option>
	                   		<option value="경기">경기도</option>
	                   		<option value="강원">강원도</option>
	                   		<option value="충북">충청북도</option>
	                   		<option value="충남">충청남도</option>
	                   		<option value="전북">전라북도</option>
	                   		<option value="전남">전라남도</option>
	                   		<option value="경북">경상북도</option>
	                   		<option value="경남">경상남도</option>
	                   		<option value="제주">제주도</option>
	    				</select>
	    			</div>
	    			<div>
	    				<label>시군구 : </label>
	    				<select name="area_code" id="reserve_area_code">
	                		<option value="0"> - </option>
	    				</select>
	    			</div>
    				<button type="button" onclick="reserveAdminSerchAjax();" class="btn btn-sm btn-secondary">조회</button>
    			</form>
	    		<div class="chart_wrap">
	    			<div id="firstChart_title"></div>
					<div id="firstChart_div"><canvas id="firstChart" ></canvas></div>
	    			<div id="secondChart_title"></div>
					<div id="secondChart_div"><canvas id="secondChart" ></canvas><div id='legend_div' class="legend_div"></div></div>
	    		</div>
	    	</div>
	    	<div class="admin_content_wrap" id="admin_member_div">
	    	</div>
	    	
	   </div>
    </div>
    <!-- End MyStudyList -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<script>
/* 스터디 관리 */
function listChangeHandler(title) {
	$("#myStudyTitle").text(title);
	$(".admin_content_wrap").removeClass("show");
	$("#admin_title_label").hide();
	
	switch(title) {
	case '스터디 관리' : $("#admin_study_div").addClass("show"); break;
	case '스터디 카페 등록' : $("#admin_studyCafeEnroll_div").addClass("show"); $("#admin_title_label").show(); break;
	case '스터디 카페 관리' : $("#admin_studyCafe_div").addClass("show"); break;
	case '예약 통계' : $("#admin_reserve_div").addClass("show"); break;
	case '회원 관리' : $("#admin_member_div").addClass("show"); break;
	}
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
					addpage += "<li><a href='javascript:studyAdminPageHandler("+(result.endPage+1)+");'>›</a></li>"+
								"<li class='first-page'><a href='javascript:studyAdminPageHandler("+result.maxPage+");'>»</a></li>";
		   			
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

/* 스터디 카페 관리 */
$("select#sido").on("change", function () {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $areaCode = $("select#area_code");
	$.ajax({
		url : "<%=request.getContextPath()%>/sigungu.lo"
		, type : "post"
		, data : { sido_name : $(this).val() }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			if(result != null) {
				let addAreaCode = "<option value='99'>전체</option>";
				console.log(result.length);
				for(var i = 0; i < result.length; i++) {
					addAreaCode += "<option value='"+result[i].area_code+"'>"+result[i].sigungu_name+"</option>";
				}
				$areaCode.html(addAreaCode);
			} else {
				$areaCode.html("<option value='0'> - </option>");
			}
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
});
function studyAdminCafePageHandler(num) {
	studyCafeAdminSerchAjax(num);
}
function studyCafeAdminSerchAjax(num) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $adminCafeList = $("#admin_cafe_list");
	var $adminCafePage = $("#admin_cafe_page");
	
	if($("select#area_code").val() == 0 || $("select#sido").val() == "선택") {
		alert("지역선택이 올바르지 않습니다.");
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/studyCafeList.lo"
		, type : "post"
		, data : $("#studyCafe_serch_form").serialize()+"&page="+num
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			let addAdminCafeList = "";
			if(result.list.length != 0) {
				for(var i = 0; i < result.list.length; i++) {
					addAdminCafeList +=	"<div class='list_content'>"+
							        		"<h5>"+result.list[i].p_name+"</h5>"+
							        		"<div class='list_right_content'>"+
								        		"<div class='btn-group'>"+
										          	"<button type='button' class='btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow' data-bs-toggle='dropdown' aria-expanded='false'><i class='bx bx-dots-vertical-rounded'></i></button>"+
										          	"<ul class='dropdown-menu dropdown-menu-end' style=''>"+
										            	"<li><a class='dropdown-item' href='javascript:adminRoomDataAjax("+result.list[i].p_no+");'>스터디 룸 관리</a></li>"+
										            	"<li><hr class='dropdown-divider'></li>"+
										            	"<li><a class='dropdown-item' href='javascript:adminCafeDataAjax("+result.list[i].p_no+");'>정보 수정</a></li>"+
										            	"<li><hr class='dropdown-divider'></li>"+
										            	"<li><a class='dropdown-item' href='javascript:adminCafeDeleteAjax("+result.list[i].p_no+");'>삭제</a></li>"+
										          	"</ul>"+
											    "</div>"+
							        			"<p>전화번호 : "+result.list[i].p_phone+"</p>"+
							        			"<p>주소 : "+result.list[i].p_address+"</p>"+
							        		"</div>"+
						        		"</div>";
				}
				$adminCafeList.html(addAdminCafeList);
			} else {
				addAdminCafeList += "<div class='list_null'><h5>해당 조건의 스터디카페 목록이 없습니다.</h5></div>";
				$adminCafeList.html(addAdminCafeList);
			}
			
			let addCAfePage = "";
			if(result.maxPage != 0 && result.maxPage != 1) {
				if(result.startPage != 1) {
					addCAfePage += "<li class='first-page'><a href='javascript:studyAdminCafePageHandler(1);'>«</a></li>"+
							   "<li><a href='javascript:studyAdminCafePageHandler("+(result.startPage-1)+");'>‹</a></li>";
				}
				for(var i = result.startPage; i <= result.endPage; i++) {
					if(i == result.currentPage) {
						addCAfePage += "<li class='active'><a href='javascript:studyAdminCafePageHandler("+i+");'>"+i+"</a></li>";
					} else {
						addCAfePage += "<li><a href='javascript:studyAdminCafePageHandler("+i+");'>"+i+"</a></li>";
					}
				}
				if(result.endPage < result.maxPage) {
					addCAfePage += "<li><a href='javascript:studyAdminCafePageHandler("+(result.endPage+1)+");'>›</a></li>"+
									"<li class='first-page'><a href='javascript:studyAdminCafePageHandler("+result.maxPage+");'>»</a></li>";
				}
			}
			$adminCafePage.html(addCAfePage);
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
}

/* 예약 통계 */
 $("select#reserve_sido").on("change", function () {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $areaCode = $("select#reserve_area_code");
	$.ajax({
		url : "<%=request.getContextPath()%>/sigungu.lo"
		, type : "post"
		, data : { sido_name : $(this).val() }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			if(result != null) {
				let addAreaCode = "<option value='99'>전체</option>";
				console.log(result.length);
				for(var i = 0; i < result.length; i++) {
					addAreaCode += "<option value='"+result[i].area_code+"'>"+result[i].sigungu_name+"</option>";
				}
				$areaCode.html(addAreaCode);
			} else {
				$areaCode.html("<option value='0'> - </option>");
			}
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
});
function reserveAdminSerchAjax() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	if($("select#reserve_code").val() == 0 || $("select#reserve_sido").val() == "선택") {
		alert("지역선택이 올바르지 않습니다.");
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/rezadmin.lo"
		, type : "post"
		, data : $("#reserve_serch_form").serialize()
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			
			//기존 차트 제거
			$('#firstChart').remove();
			$('#secondChart').remove();
			
			//차트 태그 다시 추가 및 타이틀 태그 변경
			$('#firstChart_div').append('<canvas id="firstChart" ></canvas>');
			$('#secondChart_div').append('<canvas id="secondChart" ></canvas>');
			$("#firstChart_title").html('<h6>월별 매출</h6>');
			$("#secondChart_title").html('<h6>월별 건수</h6>');
			
			
			var Label1 = [];
			var Data1 = [];
			var Label2 = [];
			var Data2 = [];
			
			for(var i = 0; i < result.PriceList.length; i++) {
				Label1.push(result.PriceList[i].chart_date);
				Data1.push(result.PriceList[i].chart_price);
			}
			for(var i = 0; i < result.CntList.length; i++) {
				Label2.push(result.CntList[i].chart_date);
				Data2.push(result.CntList[i].chart_cnt);
			}
			
			var firstData = {
					   labels: Label1,
					   datasets: [{
					     data: Data1,
					     backgroundColor: [
					         'rgba(255, 99, 132, 0.5)',
					         'rgba(255, 159, 64, 0.5)',
					         'rgba(255, 205, 86, 0.5)',
					         'rgba(75, 192, 192, 0.5)',
					         'rgba(54, 162, 235, 0.5)',
					         'rgba(153, 102, 255, 0.5)'
					         ],
					     borderColor: [
					         'rgb(255, 99, 132)',
					         'rgb(255, 159, 64)',
					         'rgb(255, 205, 86)',
					         'rgb(75, 192, 192)',
					         'rgb(54, 162, 235)',
					         'rgb(153, 102, 255)'
					       ],
					     borderWidth: 1
					   }]};
			
			var secondData = {
					   labels: Label2,
					   datasets: [{
					     data: Data2,
					     backgroundColor: [
					         'rgba(255, 99, 132, 0.5)',
					         'rgba(255, 159, 64, 0.5)',
					         'rgba(255, 205, 86, 0.5)',
					         'rgba(75, 192, 192, 0.5)',
					         'rgba(54, 162, 235, 0.5)',
					         'rgba(153, 102, 255, 0.5)'
					         ],
					     borderColor: [
					         'rgb(255, 99, 132)',
					         'rgb(255, 159, 64)',
					         'rgb(255, 205, 86)',
					         'rgb(75, 192, 192)',
					         'rgb(54, 162, 235)',
					         'rgb(153, 102, 255)'
					       ],
					     borderWidth: 1
					   }]};
			   
			   var firstOptions = {
			      	/* title : {
						display : true,
						text: '월별 매출'
					}, */
					scales: {
				      	yAxes: [{
				        	ticks : {
				        		min: 0,
								max: 1000000,
				        		beginAtZero: true //0부터 표시
				        	}
				      	}]
				    },
				    legend: {
				    	display : false // 상단 색상별 라벨 제거
				    },
				    tooltips : {
				    	callbacks: {
				    		label : function(tooltipItem) { // 툴팁 정보 수정
				    			return tooltipItem.yLabel+"원"; //수치 + 원
				    		}
				    	}
				    }
			   };
			   var secondOptions = {
				      	/* title : {
							display : true,
							text: '월별 건수'
						}, */
						scales: {
					      	yAxes: [{
					        	ticks : {
					        		min: 0,
									max: 100,
					        		beginAtZero: true //0부터 표시
					        	}
					      	}]
					    },
					    legend: {
					    	display : false // 상단 색상별 라벨 제거
					    },
					    tooltips : {
					    	callbacks: {
					    		label : function(tooltipItem) { // 툴팁 정보 수정
					    			return tooltipItem.yLabel+"개"; //수치 + 원
					    		}
					    	}
					    }
				   };
			   
			   var firstChart = new Chart($('#firstChart').get(0).getContext('2d'), {
			       type: 'bar', // 차트의 형태
			       data: firstData,
			       options: firstOptions
			   });
			   
			   var secondChart = new Chart($('#secondChart').get(0).getContext('2d'), {
			       type: 'bar', // 차트의 형태
			       data: secondData,
			       options: secondOptions
			   });
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});	
}
   
   /* var secondData = {
		    labels: ['2022-10', '2022-11', '2022-12', '2023-01', '2023-02', '2023-03'],
		    datasets: [{
		        data: [1, 12, 13, 7, 13, 10],
		        backgroundColor: [
			         'rgba(255, 99, 132, 0.5)',
			         'rgba(255, 159, 64, 0.5)',
			         'rgba(255, 205, 86, 0.5)',
			         'rgba(75, 192, 192, 0.5)',
			         'rgba(54, 162, 235, 0.5)',
			         'rgba(153, 102, 255, 0.5)',
			         'rgba(201, 203, 207, 0.5)'
			         ]
		    }] 
		};
   
   let customLegend = function (chart) {
	    let ul = document.createElement('ul');
	    let color = chart.data.datasets[0].backgroundColor;

	    chart.data.labels.forEach(function (label, index) {
	        ul.innerHTML += '<li><span style="background-color:'+color[index]+'"></span>'+label+'</li>';
	    });

	    return ul.outerHTML;
	};
	
   var secondOption = {
		   responsive: false,
		    title : {
				display : true,
				text: '예약 통계'
			}, 
		    legend: {
		    	display : false // 상단 색상별 라벨 제거
		    },
		    legendCallback: customLegend
   		}
	
   window.secondChart = new Chart(secondContent, {
        type: 'pie',
        data: secondData,
        options: secondOption
    });
   
   document.getElementById('legend_div').innerHTML = window.secondChart.generateLegend(); */
</script>
<!-- ENDS MAIN -->