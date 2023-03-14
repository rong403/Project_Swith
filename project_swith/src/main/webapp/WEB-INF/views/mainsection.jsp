<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
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
	    <div class="swiper-slide"><img src="img/event1.png" alt=""></div>
	    <div class="swiper-slide"><img src="img/event2.png" alt=""></div>
	    <div class="swiper-slide"><img src="img/event3.png" alt=""></div>
	  </div>
	  	<div class="swiper-pagination"></div>
	  </div>
    <!-- End Slide Banner -->
    <!-- My Study -->
    <sec:authorize access="isAuthenticated()">
    <div class="inner-wrapper">
    <h3>나의 스터디</h3>
    <hr>
    	<!-- Swiper Section -->
	    <div class="swiper mySwiper second">
	    <div class="swiper-wrapper">
	<c:choose>
	<c:when test="${studyMylist != null }">
		<c:forEach items="${studyMylist}" var="myvo">
		  <div class="swiper-slide">
		  	<div class="excerpt "> 
          	 <c:if test="${myvo.study_recruitment_condition eq 1 }">
	          	<a href="<%= request.getContextPath() %>/study?study_no=${myvo.study_no}" class="header"> ${myvo.study_name}</a> 
	          	<a href="#" class="text">${myvo.study_info}</a>
            	시작 예정일 :<div class="meta">${myvo.study_start_date }</div>
            	종료 예정일 :<div class="meta">${myvo.study_end_date }</div>
            	총 모집 인원 :<div class="meta">${myvo.study_people }</div>
            	카테고리 :<div class="meta">
            	</div>
             </c:if>
			 </div>
		  </div>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<h4>나의 스터디가 없습니다.</h4>
	</c:otherwise>
	</c:choose>
	    </div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-pagination"></div>
	  </div>
	    <!-- End Swiper Section -->
    </div>
    </sec:authorize>
    <!-- ENDS My Study -->
    <!-- Study List -->
    <div class="inner-wrapper">
    <h3>스터디</h3>
    
    <select id="orderBy">
        <option value="createdAtDesc">최신순</option>
        <option value="viewCountDesc">조회순</option>
        <option value="likeCountDesc">추천순</option>
    </select>
    <form action="<%=request.getContextPath() %>/main" method="GET">
	  <label for="searchInput">모임명 입력:</label>
	  <input type="hidden" id="search_cateCode" name="cateCode">
	  <input type="text" id="searchInput" name="searchInput">
	  <button type="submit" id="searchBtn">검색</button>
	</form>
    
	<script>
	$(function(){
		$("#search_cateCode").val($("#select_cateCode").val());
	});
	
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
	      	<input id="select_cateCode" type="hidden" value="${a.study_category_code}">
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