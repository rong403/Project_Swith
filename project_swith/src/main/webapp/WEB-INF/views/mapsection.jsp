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
			                    	<select class="map_home_category" id="sido">
			                    		<option value="서울">서울</option>
			                    		<option value="인천">인천</option>
			                    		<option value="대전">대전</option>
			                    		<option value="대구">대구</option>
			                    		<option value="부산">부산</option>
			                    	</select>
               			 		</div>
               			 		<div class="map_home_category_wrap">
               			 			<label>시군구 :</label>
			                    	<select class="map_home_category" id="sigungo">
			                    		<option value="강동구">강동구</option>
			                    		<option value="송파구">송파구</option>
			                    		<option value="광진구">광진구</option>
			                    		<option value="강서구">강서구</option>
			                    		<option value="노원구">노원구</option>
			                    	</select>
               			 		</div>
			                </div>
			                <h3 class="heading">
			                    <span>Place Info</span>
			                    <div class="line"></div>
			                </h3>
			                <div class="around_wrap">
						        <ul id="destination_list"></ul>
						        <div id="pagination"></div>
		                    </div>
		                </div>
		                <div class="close_button sub">
                        	<button id="reserve_hidden_btn"><img class="reserve_hidden_btn_img" src="<%=request.getContextPath()%>/resources/map/images/화살표머리로고.jpg"></button>
	                    </div>
		                <div class="reserve_box">
			                <div class="study_info">
				                <div class="mb-3">
				                	<div class="card h-100">
								      <img class="card-img-top" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="Card image cap">
								      <div class="card-body">
								        <h5 class="card-title">Card title</h5>
								        <p class="card-text">
								          Some quick example text to build on the card.
								        </p>
								        <p class="card-text">
								          Some quick example text to build on the card.
								        </p>
								        <p class="card-text">
								          Some quick example text to build on the card.
								        </p>
								      </div>
								    </div>
			                	</div>
				                <h3 class="heading">
				                    <span>예약 정보</span>
				                    <div class="line"></div>
				                </h3>
				                <div class="around_wrap">
				                	<div class="d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
							        <div class="d-flex align-items-sm-center gap-4">
							          <img src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar">
							          <div class="button-wrapper">
							            <h3>4인 룸</h3>
							            <p class="text-muted mb-0">4명이 사용 가능한 단독 룸</p>
							          </div>
							        </div>
				                </div>
			                </div>
		                	<div class="study_reserve">
		                		<div class="reserve_header">
		                			<img class="reserve_hidden_btn_img" src="<%=request.getContextPath()%>/resources/map/images/화살표머리로고.jpg">
		                			<h2>스터디카페 이름</h2>
		                		</div>
		                		<div class="mb-3">
				                	<div class="card h-100">
								      <img class="card-img-top" src="https://res.cloudinary.com/dnik5jlzd/image/upload/v1674716447/test2/b663205e-f58b-4c45-aa0e-c6989a8712e3.png" alt="Card image cap">
								      <div class="card-body">
								        <h5 class="card-title">Card title</h5>
								        <p class="card-text">
								          Some quick example text to build on the card.
								        </p>
								        <p class="card-text">
								          Some quick example text to build on the card.
								        </p>
								        <p class="card-text">
								          Some quick example text to build on the card.
								        </p>
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
				                <div>
				                	<p>27일 12시 입실 18시 퇴실</p>
				                	<p>6시간 48,000원</p>
				                </div>
				                <div class="map_home_category_wrap">
				                	<label>인원/수량 : </label>
				                	<select class="map_home_category">
				                		<option>1명</option>
				                		<option>2명</option>
				                	</select>
				                </div>
				                <button>다음단계</button>
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