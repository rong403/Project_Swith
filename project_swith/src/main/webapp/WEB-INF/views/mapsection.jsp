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
			                    		<option value="미선택">선택</option>
			                    		<option value="서울">서울</option>
			                    		<option value="부산">부산</option>
			                    		<option value="대구">대구</option>
			                    		<option value="인천">인천</option>
			                    		<option value="광주">광주</option>
			                    		<option value="대전">대전</option>
			                    		<option value="울산">울산</option>
			                    		<option value="세종특별자치시">세종</option>
			                    		<option value="경기도">경기도</option>
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
				let addAreaCode = "<option value='1'>전체</option>";
				console.log(result.length);
				for(var i = 0; i < result.length; i++) {
					console.log(result[i]);
					addAreaCode += "<option value='"+result[i].area_code+"'>"+result[i].sigungu_name+"</option>";
				}
				$areaCode.html(addAreaCode);
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
			                </div>
			                <h3 class="heading">
			                    <span>Place Info</span>
			                    <div class="line"></div>
			                </h3>
			                <div class="around_wrap">
						        <ul id="destination_list">
						        	<li class="item">
							        	<img class="img" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1676562182/placeImg/94e20e12-adfe-4edb-9af1-fced8fbeded5.jpg"></img>
							        	<div class="info" onclick="listclickHandler();">   
							        		<h5>위넌스터디카페 잠실학원사거리점</h5>    
							        		<span class="gray">서울 송파구 석촌호수로 106</span>
							        		<span class="tel">010-8224-5304</span>
							        		<div class="btn_wrap">
							        			<button class="btn btn-warning btn-sm">위치</button>
							        			<button class="btn btn-warning btn-sm">상세</button>
							        		</div>
							        	</div>
						        	</li>
						        	<li class="item">
							        	<img class="img" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1676562182/placeImg/94e20e12-adfe-4edb-9af1-fced8fbeded5.jpg"></img>
							        	<div class="info" onclick="listclickHandler();">   
							        		<h5>위넌스터디카페 잠실학원사거리점</h5>    
							        		<span class="gray">서울 송파구 석촌호수로 106</span>
							        		<span class="tel">010-8224-5304</span>
							        		<div class="btn_wrap">
							        			<button class="btn btn-warning btn-sm">위치</button>
							        			<button class="btn btn-warning btn-sm">상세</button>
							        		</div>
							        	</div>
						        	</li>
						        	<li class="item">
							        	<img class="img" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1676562182/placeImg/94e20e12-adfe-4edb-9af1-fced8fbeded5.jpg"></img>
							        	<div class="info" onclick="listclickHandler();">   
							        		<h5>위넌스터디카페 잠실학원사거리점</h5>    
							        		<span class="gray">서울 송파구 석촌호수로 106</span>
							        		<span class="tel">010-8224-5304</span>
							        		<div class="btn_wrap">
							        			<button class="btn btn-warning btn-sm">위치</button>
							        			<button class="btn btn-warning btn-sm">상세</button>
							        		</div>
							        	</div>
						        	</li>
						        	<li class="item">
							        	<img class="img" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1676562182/placeImg/94e20e12-adfe-4edb-9af1-fced8fbeded5.jpg"></img>
							        	<div class="info" onclick="listclickHandler();">   
							        		<h5>위넌스터디카페 잠실학원사거리점</h5>    
							        		<span class="gray">서울 송파구 석촌호수로 106</span>
							        		<span class="tel">010-8224-5304</span>
							        		<div class="btn_wrap">
							        			<button class="btn btn-warning btn-sm">위치</button>
							        			<button class="btn btn-warning btn-sm">상세</button>
							        		</div>
							        	</div>
						        	</li>
						        	<li class="item">
							        	<img class="img" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1676562182/placeImg/94e20e12-adfe-4edb-9af1-fced8fbeded5.jpg"></img>
							        	<div class="info" onclick="listclickHandler();">   
							        		<h5>위넌스터디카페 잠실학원사거리점</h5>    
							        		<span class="gray">서울 송파구 석촌호수로 106</span>
							        		<span class="tel">010-8224-5304</span>
							        		<div class="btn_wrap">
							        			<button class="btn btn-warning btn-sm">위치</button>
							        			<button class="btn btn-warning btn-sm">상세</button>
							        		</div>
							        	</div>
						        	</li>
						        	<li class="item">
							        	<img class="img" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1676562182/placeImg/94e20e12-adfe-4edb-9af1-fced8fbeded5.jpg"></img>
							        	<div class="info" onclick="listclickHandler();">   
							        		<h5>위넌스터디카페 잠실학원사거리점</h5>    
							        		<span class="gray">서울 송파구 석촌호수로 106</span>
							        		<span class="tel">010-8224-5304</span>
							        		<div class="btn_wrap">
							        			<button class="btn btn-warning btn-sm">위치</button>
							        			<button class="btn btn-warning btn-sm">상세</button>
							        		</div>
							        	</div>
						        	</li>
						        </ul>
						        <div id="pagination">
						        	<a href="#" class="on">1</a>
						        	<a href="#">2</a>
						        	<a href="#">3</a>
						        </div>
		                    </div>
		                </div>
		                <div class="close_button sub">
                        	<button id="reserve_close_btn"><img class="reserve_close_btn_img" src="<%=request.getContextPath()%>/resources/map/images/x_icon.png"></button>
	                    </div>
		                <div class="reserve_box">
			                <div class="study_info">
				                <div class="mb-3">
							      <img class="card-img-top" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570806/placeimg_640_480_arch_a1akmi.jpg" alt="Card image cap">
							      <div class="study_detail">
							        <h3 class="detail_title">스터디 카페 이름</h3>
							        <p class="detail_text">
							          	스터디 카페 정보
							        </p>
							        <p class="detail_text">
							        	서울 광진구 동일로30길 51
							        </p>
							        <p class="detail_text">
							          	02-468-3788
							        </p>
							      </div>
			                	</div>
				                <div class="around_wrap">
					                <h3 class="heading">
					                    <span>예약 정보</span>
					                    <div class="line"></div>
					                </h3>
							        <div class="reserve_list d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570791/placeimg_640_480_arch_1_xjzeih.jpg" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>2인 룸A</h3>
							            <p class="text-muted mb-0">2명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="reserve_list d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570791/placeimg_640_480_arch_1_xjzeih.jpg" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>2인 룸B</h3>
							            <p class="text-muted mb-0">2명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="reserve_list d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570791/placeimg_640_480_arch_1_xjzeih.jpg" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>2인 룸C</h3>
							            <p class="text-muted mb-0">2명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="reserve_list d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570791/placeimg_640_480_arch_1_xjzeih.jpg" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸A</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="reserve_list d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570791/placeimg_640_480_arch_1_xjzeih.jpg" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸B</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="reserve_list d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1675570791/placeimg_640_480_arch_1_xjzeih.jpg" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸C</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
				                </div>
			                </div>
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