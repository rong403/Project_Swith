<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						        	목록이 없습니다.
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
<script>

//룸 선택 시 예약 정보 열기
function roomListClickHandler() {
	$('.study_info').css("display", "none");
	$('.study_reserve').css("display", "flex");
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
							        "<p class='detail_text'>"+result.placeInfo.p_info+"</p>"+
							        "<p class='detail_text'>"+result.placeInfo.p_address+"</p>"+
							        "<p class='detail_text'>"+result.placeInfo.p_phone+"</p>"+
							      "</div>";
				$detailDiv.html(addDetail);
				
				let addItem = "<h3 class='heading'><span>예약 정보</span><div class='line'></div></h3>";
				for(var i = 0; i < result.roomList.length; i++) {
					addItem += "<div class='reserve_list d-flex align-items-sm-center gap-4'>"+
						          "<img src='"+result.roomList[i].room_img_route+"' alt='user-avatar' class='d-block rounded' height='100' width='100' id='uploadedAvatar'>"+
						          "<div class='button-wrapper'>"+
						            "<h3>"+result.roomList[i].room_name+"</h3>"+
						            "<p class='text-muted mb-0'>"+result.roomList[i].room_people+"명이 사용 가능한 단독 룸</p>"+
						          "</div>"+
						        "</div>";
				}
				$roomListDiv.html(addItem);
				$("div#room_list > .reserve_list").on("click", roomListClickHandler);
			} else {
				$roomListDiv.html("스터디 룸 정보가 없습니다.");
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
	$('.study_reserve').css("display", "none");
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
				$destination_list.html("목록이 없습니다.");
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
		                	<div class="study_reserve">
		                		<div class="reserve_header">
		                			<img id="reserve_header_img" src="<%=request.getContextPath()%>/resources/map/images/left_arrow_icon.png">
		                			<h2>스터디카페 이름</h2>
		                		</div>
		                		<div class="reserve_section">
		                			<div class="mb-3">
								      	<img class="card-img-top" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570811/placeimg_640_480_any_m95oe4.jpg" alt="Card image cap">
								      	<div class="study_detail">
								        	<h3 id="ajax_room_name" class="detail_title">4인 룸C</h3>
								        	<p class="detail_text">
								          		예약 룸 가격정보
								        	</p>
								        	<p class="detail_text">
								        		4인실 - 시간 당 8,000원
								        	</p>
								        	<p class="detail_text last">
								          		Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
								        	</p>
									      	<div id="detail_text_hidden">
									      		<label>펼쳐보기<img class="detail_text_hidden_img" src="<%=request.getContextPath()%>/resources/map/images/left_arrow_icon.png"></label>
									      	</div>
								      	</div>
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
					                <div class="map_home_category_wrap">
					                	<label>입실시간 : </label>
					                	<select class="map_home_category">
					                		<option>1:00</option>
					                		<option>2:00</option>
					                	</select>
					                </div>
					                <div class="map_home_category_wrap">
					                	<label>퇴실시간 : </label>
					                	<select class="map_home_category">
					                		<option>1:00</option>
					                		<option>2:00</option>
					                	</select>
					                </div>
					                <h3 class="heading">
					                    <span>결제 정보</span>
					                    <div class="line"></div>
					                </h3>
					                <div class="payment_info">
					                	<p>27일 12시 입실 18시 퇴실</p>
					                	<div>
					                		<p>6시간</p>
					                		<div><p id="ajax_total_price">48000</p><p>원</p></div>
					                	</div>
					                </div>
					                <div class="map_home_category_wrap">
					                	<label>인원/수량 : </label>
					                	<select class="map_home_category">
					                		<option>1명</option>
					                		<option>2명</option>
					                	</select>
					                </div>
					                <!-- 구현용 id 부여, 페이지 완성되면 기능 옮길 예정 hhjng -->
					                <button id="btn-kakaopay" class="btn btn-info">다음단계</button>
		                		</div>
		                	</div>
		                </div>
                	</div>
                </div>
                <div class="page_button">
                </div>
            </div>
        </div>
    </section>
<!-- ENDS SECTION -->