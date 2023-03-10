<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- SECTION -->
<section>
        <div id="main_section">
            <div id="map"></div>
            <div id="map_home_page">
                <div class="map_home_box">
                	<div class="search_list_box">
                		<div class="close_button">
                        	<button id="all_hidden_button"><img class="all_hidden_button_img" src="<%=request.getContextPath()%>/resources/map/images/화살표머리로고.jpg"></button>
	                    </div>
	                	<div class="hidden_box">
			                <div class="search_input_box">
               			 		<div class="map_home_category_wrap">
               			 			<label>시도 :</label>
			                    	<select class="map_home_category" id="sido" name="sido_name">
			                    		<option value="선택">선택</option>
			                    		<c:forEach items="${sidoList}" var="sido">
				                   			<c:choose>
				                   				<c:when test="${sido ne '세종특별자치시'}">
				                   					<option value="${sido}">${sido}</option>
				                   				</c:when>
				                   				<c:otherwise>
				                   					<option value="${sido}">세종</option>
				                   				</c:otherwise>
				                   			</c:choose>
					    				</c:forEach>
			                    	</select>
               			 		</div>
               			 		<div class="map_home_category_wrap">
               			 			<label>시군구 :</label>
			                    	<select class="map_home_category" id="area_code" name="area_code">
			                    		<option value="0">시도를 선택해주세요</option>
			                    	</select>
               			 		</div>
			                </div>
<script>
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
				let addAreaCode = "<option value='0'>선택</option>";
				console.log(result.length);
				for(var i = 0; i < result.length; i++) {
					addAreaCode += "<option value='"+result[i].area_code+"'>"+result[i].sigungu_name+"</option>";
				}
				$areaCode.html(addAreaCode);
			} else {
				$areaCode.html("<option value='0'>시도를 선택해주세요</option>");
			}
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
});
</script>
			                <h3 class="heading">
			                    <span>Place Info</span>
			                    <div class="line"></div>
			                </h3>
			                <div class="around_wrap">
						        <ul id="destination_list">
						        	<div class="list_null">목록이 없습니다.</div>
						        </ul>
						        <div id="pagination">
						        </div>
		                    </div>
		                </div>
		                <div class="close_button sub">
                        	<button id="reserve_close_btn"><img class="reserve_close_btn_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
	                    </div>
		                <div class="reserve_box">
			                <div class="study_info">
				                <div class="mb-3" id="stuy_detail">
			                	</div>
				                <div class="around_wrap" id="room_list">
				                </div>
			                </div>
		                	<div class="study_reserve" id="study_reserve">
		                		<div class="reserve_header">
		                		</div>
		                		<div class="reserve_section">
		                			<div class="mb-3">
				                	</div>
					                <h3 class="heading">
					                    <span>알정 선택</span>
					                    <div class="line"></div>
					                </h3>
					                <div id="datepicker"></div>
					                <h3 class="heading">
					                    <span>시간 선택</span>
					                    <div class="line"></div>
					                </h3>
					                <div class="map_home_category_wrap" id="start_time">
					                	<label>입실시간 : </label>
					                	<select class='map_home_category'>
					                	</select>
					                </div>
					                <div class="map_home_category_wrap" id="end_time">
					                	<label>퇴실시간 : </label>
					                	<select class='map_home_category'>
					                	</select>
					                </div>
					                <h3 class="heading">
					                    <span>결제 정보</span>
					                    <div class="line"></div>
					                </h3>
					                <div class="payment_info" id="reserve_data">
					                	<p>날짜 및 입실/퇴실 시간을 선택해주세요.</p>
					                </div>
					                <button id="btn-kakaopay" class="btn btn-info">결제</button>
		                		</div>
		                	</div>
<script>
//입 퇴실 시간을 위한 변수 선언
var timeArr;
var startNum = 0;
var endNum = 0;
var roomNo = 0;

//입실/퇴실 시간 선택 시 결제정보 변경 등록
$("#start_time > select.map_home_category").on("change", endTimeDataChangeAction);
$("#end_time > select.map_home_category").on("change", roomReserveDataChangeAction);

//입실 시간 선택시 퇴실 시간 변경
function endTimeDataChangeAction() {
	var $end_time = $('#end_time > select.map_home_category');
	var selectTime = parseInt($('#start_time > select.map_home_category').val());
	
	console.log("selectTime : "+selectTime);
	console.log("endNum : "+endNum);
	console.log("timeArr : "+timeArr);
	
	let addEndTime = "<option value='0'>선택</option>";
	if(selectTime == 0) {
		addEndTime += "<option value='99'>입실시간 선택필요</option>";
	} else {
		for(var i = selectTime+1; i <= endNum; i++) {
			console.log("비교결과 : "+timeArr.indexOf(i));
			if(timeArr.indexOf(i) < 0) {
				addEndTime += "<option value='"+i+"'>"+i+":00</option>";
			} else {
				addEndTime += "<option value='"+i+"'>"+i+":00</option>";
				break;
			}
		}
	}
	
	$end_time.html(addEndTime);
}
//선택된 날짜에 따른 예약정보 조회 후 입,퇴실시간에 반영
function selectDateAction() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var selectDate = $("#datepicker").val();
	var $start_time = $('#start_time > select.map_home_category');
	var $end_time = $('#end_time > select.map_home_category');
	
	$.ajax({
		url : "<%=request.getContextPath()%>/rezroom.lo"
		, type : "post"
		, data : { room_no : roomNo }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			//해당 룸의 예약되어 있는 시간 시간대별로 배열에 집어넣기
			//예약별로 예약한 시간중 마지막 시간은 입실 가능으로 제외
			timeArr = new Array();
			if(result.length > 0) {
				for(var i = 0; i < result.length; i++) {
					if(selectDate == result[i].reserve_date) {
						for(var j = result[i].reserve_start_time; j < result[i].reserve_end_time; j++) {
							timeArr.push(j);
						}
					}
				}
			}
			
			//총 운영시간 중 예약되어 있는 시간대를 제외한 시간을 출력
			let addStartTime = "<option value='0'>선택</option>";
			for(var i = startNum; i < endNum; i++) {
				if(timeArr.indexOf(i) < 0) addStartTime += "<option value='"+i+"'>"+i+":00</option>";
			}						      
			
			//퇴실시간 초기화
			var addEndTime = "<option value='0'>선택</option><option value='99'>입실시간 선택필요</option>";

        	$start_time.html(addStartTime);
        	$end_time.html(addEndTime);
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
}

//룸 선택 시 예약 정보 열기
function roomListClickHandler(num, placeName) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $header = $('#study_reserve > .reserve_header');
	var $section = $('#study_reserve > .reserve_section > .mb-3');
	
	$.ajax({
		url : "<%=request.getContextPath()%>/room/detail.lo"
		, type : "post"
		, data : { room_no : num }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			if(result != null) {
				//최상단 뒤로가기
				var addHeader = "<img id='reserve_header_img' src='<%=request.getContextPath()%>/resources/map/images/left_arrow_icon.png'>"+
								 "<h2>"+placeName+"</h2>";
				
    			//룸정보
				var addSection = "<img class='card-img-top' src='"+result.room_img_route+"' alt='Card image cap'>"+
						      	"<div class='study_detail div_reserve'>"+
						        	"<h3 id='ajax_room_name' class='detail_title'>"+result.room_name+"</h3>"+
						        	"<p class='detail_text'>예약 룸 가격정보</p>"+
						        	"<p class='detail_text'>"+result.room_people+"인실 - 시간 당 "+result.room_price+"원</p>"+
						        	"<input type='hidden' id='room_price' value='"+result.room_price+"'>"+
						        	"<p class='detail_text last'>최대 "+result.room_people+"명이서 이용가능한 스터디 룸입니다. 콘센트 및 와이파이 제공 및 평상시 정도의 대화가 가능합니다. </p>"+
							      	"<div id='detail_text_hidden'>"+
							      		"<label>펼쳐보기<img class='detail_text_hidden_img' src='<%=request.getContextPath()%>/resources/map/images/left_arrow_icon.png'></label>"+
							      	"</div>"+
					      		"</div>";
				
				//해당 룸의 시작 및 종료 시간, 룸 번호 저장하기
				startNum = result.room_start_time;
				endNum = result.room_end_time;
				roomNo = num;
				
				$header.html(addHeader);
	        	$section.html(addSection);
	        	
				//룸 정보 펼쳐보기 등록
			    $('#detail_text_hidden').on("click", detailTextHandler);
				
				//예약 정도 닫기 등록
			    $('#reserve_header_img').on("click", reverseCloseHandler);
				
				//현재 날짜의 입실시간 출력
			    selectDateAction();
			}
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
	
	$('.study_info').css("display", "none");
	$('#study_reserve').css("display", "flex");
}
    
//목록 클릭 시 이벤트 추가
function listclickHandler(currentPage) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	//상세정보 창 정보 바꾸기
	var $p_no = $(this).siblings("input[type=hidden]").val();
	var $detailDiv = $("div#stuy_detail");
	var $roomListDiv = $("div#room_list");
	$.ajax({
		url : "<%=request.getContextPath()%>/place/detail.lo"
		, type : "post"
		, data : { p_no : $p_no }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			if(result != null) {
				let addDetail = "<img class='card-img-top' src='"+result.placeInfo.p_img_route+"' alt='Card image cap'>"+
							      "<div class='study_detail'>"+
							        "<h3 class='detail_title'>"+result.placeInfo.p_name+"</h3>"+
							        "<p class='detail_text gray'>"+result.placeInfo.p_address+"</p>"+
							        "<p class='detail_text tel'>"+result.placeInfo.p_phone+"</p>"+
							        "<p class='detail_text'>"+result.placeInfo.p_info+"</p>"+
							      "</div>";
				$detailDiv.html(addDetail);
				
				let addItem = "<h3 class='heading'><span>예약 정보</span><div class='line'></div></h3>";
				if(result.roomList.length > 0) {
					for(var i = 0; i < result.roomList.length; i++) {
						addItem += '<div class="reserve_list d-flex align-items-sm-center gap-4" onclick="roomListClickHandler('+result.roomList[i].room_no+',\''+result.placeInfo.p_name+'\')">'+
							          "<img src='"+result.roomList[i].room_img_route+"' alt='user-avatar' class='d-block rounded' height='100' width='100' id='uploadedAvatar'>"+
							          "<div class='button-wrapper'>"+
							            "<h3>"+result.roomList[i].room_name+"</h3>"+
							            "<p class='text-muted mb-0'>"+result.roomList[i].room_people+"명이 사용 가능한 단독 룸</p>"+
							          "</div>"+
							        "</div>";
					}
				} else {
					addItem +="<div class='list_null'>목록이 없습니다.</div>";
				}
				
				$roomListDiv.html(addItem);
			}
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
	
	
	//상세목록창 보이기
	$(".reserve_box").css("display", "flex");
    $('.close_button.sub').css("display", "block");
    
    //정보 창 열때 예약창이면 화면 바꾸기
	$('.study_info').css("display", "flex");
	$('#study_reserve').css("display", "none");
}

var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//마커등록 함수
function addMarker(position, title) {
	var marker = new kakao.maps.Marker({
					map : map,
					position: position, // 마커의 위치
					title : title
	        	});
	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="display: flex; justify-content: center; z-index:1; width: 200px;"><p style="font-size: 15px; margin:0 auto;">' + title + '</p></div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

//지도 중심 위치 이동
function setCenter(p_y, p_x) {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(p_y, p_x);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

//ajax 페이지 번호 선택 시 스터디 카페 목록 조회
var pageNum = 1;
function pageItemHandler(num) {
	pageNum = num;
	studylistAjax();
}


//ajax 스터디 카페 목록 조회 
function studylistAjax() {
	//시군구 스터디 카페 조회 시 상세/예약 창 열려있으면 닫기
	reserveCloseHandler();
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $destination_list = $("#destination_list");
	var $pagination = $("#pagination");
	$.ajax({
		url : "<%=request.getContextPath()%>/place/list.lo"
		, type : "post"
		, data : { 
					area_code : $("select#area_code").val(),
					page : pageNum
				 }
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			//지도에 표시된 모든 마커 제거
			removeMarker();
			
			if(result.list.length > 0) {
				var bounds = new kakao.maps.LatLngBounds(),
					$fragment = $(document.createDocumentFragment());
				
				let addItem = "";
				for(var i = 0; i < result.list.length; i++) {
					//마커를 생성하고 지도에 표시하기
					var placePosition = new kakao.maps.LatLng(result.list[i].p_y, result.list[i].p_x),
		            	marker = addMarker(placePosition, result.list[i].p_name);
					
		         	// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
		         	
			        var $button = $("<button class='btn btn-warning btn-sm' onclick='setCenter("+result.list[i].p_y+","+result.list[i].p_x+")'>위치</button>");
		         	
			        //마커랑, 위치 버튼에 이벤트 등록
			        (function(marker, title, p_y, p_x) {
			            kakao.maps.event.addListener(marker, 'mouseover', function() {
			            	infowindow.close();
			            	displayInfowindow(marker, title);
			            });

			            kakao.maps.event.addListener(marker, 'mouseout', function() {
			                infowindow.close();
			            });

			            $button.on("click", function () {
			            	infowindow.close();
			                displayInfowindow(marker, title);
			                setCenter(p_y, p_x);
			            });
			        })(marker, result.list[i].p_name, result.list[i].p_y, result.list[i].p_x);
			        
			        var $divBtnWrap = $("<div class='btn_wrap'></div>");
			        $divBtnWrap.append($button);
			        $divBtnWrap.append($("<button class='btn btn-warning btn-sm detail'>상세</button>"));
			        $divBtnWrap.append($("<input type='hidden' name='p_no' value='"+result.list[i].p_no+"'>"));
			
			        var $divInfo = $("<div class='info'></div>");
			        $divInfo.append($("<h5>"+result.list[i].p_name+"</h5>"));
			        $divInfo.append($("<span class='gray'>"+result.list[i].p_address+"</span>"));
			        $divInfo.append($("<span class='tel'>"+result.list[i].p_phone+"</span>"));
			        $divInfo.append($divBtnWrap);
			        
			        var $itemEl = $("<li class='item'></li>");
			        $itemEl.append($("<img class='img' src='"+result.list[i].p_img_route+"'></img>"));
			        $itemEl.append($divInfo);
					 
					$fragment.append($itemEl);
				}
	         	
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
				
				$destination_list.html($fragment);
				$("#destination_list .btn.btn-warning.btn-sm.detail").on("click", listclickHandler);
				
				
			} else {
				$destination_list.html("<div class='list_null'>목록이 없습니다.</div>");
			}
			
			var addpage = "";
			if(result.maxPage != 0 && result.maxPage != 1) {
				if(result.startPage != 1) {
					addpage += "<a onclick='pageItemHandler("+(result.startPage-1)+");'><img src='<%=request.getContextPath()%>/resources/images/my_arrow_180.png'></a>";
				}
				for(var i = result.startPage; i <= result.endPage; i++) {
					if(i == result.currentPage) {
						addpage += "<a class='on' onclick='pageItemHandler("+i+");'>"+i+"</a>";
					} else {
						addpage += "<a onclick='pageItemHandler("+i+");'>"+i+"</a>";
					}
				}
				if(result.endPage < result.maxPage) {
					addpage += "<a onclick='pageItemHandler("+(result.endPage+1)+");'><img src='<%=request.getContextPath()%>/resources/images/my_arrow.png'></a>";
				}
			}
			$pagination.html(addpage);
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
}
function arealistHandler() {
	pageNum = 1;
	studylistAjax();
}
//시군구 선택 시 이벤트 등록
$("select#area_code").on("change", arealistHandler);
</script>
		                </div>
                	</div>
                </div>
                <div class="page_button">
                </div>
            </div>
        </div>
    </section>
<!-- ENDS SECTION -->