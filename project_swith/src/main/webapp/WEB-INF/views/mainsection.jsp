<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- filter -->
    
    <!-- ENDS filter -->
    <!-- Slide Banner -->
    <div class="swiper mySwiper first">
	  <div class="swiper-wrapper">
	    <div class="swiper-slide"><img src="img/dummySlider.jpg" alt=""></div>
	    <div class="swiper-slide"><img src="img/dummySlider.jpg" alt=""></div>
	    <div class="swiper-slide"><img src="img/dummySlider.jpg" alt=""></div>
	  </div>
	  	<div class="swiper-pagination"></div>
	  </div>
    <!-- End Slide Banner -->
    <!-- My Study -->
    <div class="inner-wrapper">
    <h3>나의 스터디</h3>
    <hr>
    	<!-- Swiper Section -->
	    <div class="swiper mySwiper second">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">11Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">22Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">33Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">44Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">55Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">66Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">77Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">88Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	      <div class="swiper-slide">
	      	<div class="excerpt"> <a href="project.html" class="header">99Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
	        	<div class="meta">Admin on 23 Jun, 2010</div>
	        </div>
	      </div>
	    </div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-pagination"></div>
	  </div>
	    <!-- End Swiper Section -->
    </div>
    <!-- ENDS My Study -->
    <!-- Study List -->
    <div class="inner-wrapper">
    <h3>스터디</h3>
    
    <select id="orderBy">
        <option value="createdAtDesc">최신순</option>
        <option value="viewCountDesc">조회순</option>
        <option value="likeCountDesc">추천순</option>
    </select>
    <form action="<%=request.getContextPath() %>/search" method="GET">
	  <label for="searchInput">모임명 입력:</label>
	  <input type="text" id="searchInput" name="searchInput">
	  <button type="submit" id="searchBtn">검색</button>
	</form>
    
	<script>
	
 	$("#orderBy").change(function(){
 		//선택한 옵션 값 가져오기
 		var selectedValue = $(this).val();
 		
 		// ajax 호출을 통해 결과 가져오기
		$.ajax({
			url: "<%= request.getContextPath()%>/postList",
			type: "POST",
			data: {selectedValue:selectedValue}, //선태한 option의 value를 서버로 전달함
			dataType: "json",
			success: function(data){
				//AJAX 호출 결과를 문자열로 받아와서 <ul> 요소에 HTML 문자열로 설정
				$("#orderBy").html(data.html);
			},
			error:function(xhr, status, error){
				//오류 처리
				alert("Error occurred while retrieving results");
			}
		})
	})
	$(document).ready(function() {
	$("#searchBtn").click(function() {
		$.ajax({
			url: "<%= request.getContextPath()%>/search",
			type: "GET",
			data: {searchInput: $("#searchInput").val()}, // 검색어 전송
			dataType: "json",
			success: function(response) {
				$("#postList").html(response.html); // 검색 결과 표시
			},
			error: function(xhr, status, error) {
				alert("Error occurred while retrieving results");
			}
		});
	});
});
	</script>
    <hr>
    <ul class="tags">
      <li><span>Categories</span></li>
	      <c:if test="${cateCode ==0 }">
	      	<li class="active">
	      </c:if>
	      <c:if test="${cateCode !=0 }">
	      	<li>
	      </c:if>
      		<a href="<%=request.getContextPath() %>/main">All</a></li>
      <c:forEach items="${categorylist }" var="a">
	      <c:if test="${cateCode ==a.study_category_code }">
	      	<li class="active">
	      </c:if>
	      <c:if test="${cateCode !=a.study_category_code }">
	      	<li>
	      </c:if>
     	<a href="<%=request.getContextPath() %>/main?cateCode=${a.study_category_code}">${a.study_category_name }</a></li>
      </c:forEach>
    </ul>
    <div id="postList">
      	<ul class="blocks-thumbs" id="result-list">
	      <c:choose>
	      		<c:when test="${empty studylist}">
	      			<h2>등록된 스터디 글이 없습니다.</h2>
	      		</c:when>
	     		<c:otherwise>
	   			<c:forEach items="${studylist}" var="a">
		   			<li> 
			          <div class="excerpt "> 
			          	 <c:if test="${a.study_recruitment_condition eq 1 }">
				          	<a href="<%= request.getContextPath() %>/study?study_no=${a.study_no}" class="header"> ${a.study_name}</a> 
				          	<a href="#" class="text">${a.study_info}</a>
			            	시작 예정일 :<div class="meta">${a.study_start_date }</div>
			            	종료 예정일 :<div class="meta">${a.study_end_date }</div>
			            	총 모집 인원 :<div class="meta">${a.study_people }</div>
			            	카테고리 :<div class="meta">
			            	<c:forEach items="${a.study_category_list }" var="categoryvo">
			            		#${categoryvo.study_category_name }&nbsp;
			            	</c:forEach> 
    	
			            	</div>
			             </c:if>
			          </div>
			        </li>
	   			</c:forEach>
	      		</c:otherwise>
	      	</c:choose>
      	</ul>
      </div>
      <!-- pager -->
      <ul class='pager'>
        <li class='first-page'><a href="#">&laquo;</a></li>
        <li><a href="#">&lsaquo;</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li class='active'><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">6</a></li>
        <li><a href="#">&rsaquo;</a></li>
        <li class='last-page'><a href="#">&raquo;</a></li>
      </ul>
      <div class="clear"></div>
      <!-- ENDS pager -->
    </div>
    <!-- Study List -->
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
<!-- swiper script -->
<script>
var swiper1 = new Swiper(".first", {
    pagination: {
      el: ".swiper-pagination",
      clickable: true
    },
  });
  
var swiper2 = new Swiper(".second", {
    slidesPerView: 3,
    spaceBetween: 10,
    slidesPerGroup : 3,
    loop: true,
    loopFillGroupWithBlank: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
</script>