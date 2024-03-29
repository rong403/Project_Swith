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
	<c:choose>
	<c:when test="${fn:length(studyMylist) != 0 }">
		<c:choose>
			<c:when test="${fn:length(studyMylist) lt 4 }">
	    	<div class="swiper-wrapper">
				<c:forEach items="${studyMylist}" var="myvo">
				  <div class="swiper-slide">
				  	<div class="excerpt "> 
				  	<a href="<%=request.getContextPath() %>/study?study_no=${myvo.study_no}">
			          	<div class="header"> ${myvo.study_name}</div> 
			          	<div class="text">${myvo.study_info}</div>
		            	<c:if test="${myvo.study_recruitment_condition eq '1' }">
		            	<div class="text_wrap"><label>모집 상태 :</label> <div class="meta">모집 중</div></div>
		            	</c:if>
		            	<c:if test="${myvo.study_recruitment_condition eq '2' }">
		            	<div class="text_wrap"><label>모집 상태 :</label> <div class="meta">모집 마감</div></div>
		            	</c:if>
						<div class="text_wrap"><label>온/오프라인 :</label><div class="meta">${myvo.study_type}</div></div>
		            	<div class="text_wrap"><label>시작 예정일 :</label><div class="meta">${myvo.study_start_date }</div></div>
		            	<div class="text_wrap"><label>종료 예정일 :</label><div class="meta">${myvo.study_end_date }</div></div>
		            	<div class="text_wrap"><label>총 모집 인원 :</label><div class="meta">${myvo.study_people }명</div></div>
		            	<div class="text_wrap"><label>카테고리 :</label><div class="meta">${myvo.study_tag }</div></div>
		             </a>
					 </div>
				  </div>
				</c:forEach>
	    </div>
			</c:when>
			<c:otherwise>
	    	<div class="swiper-wrapper">
				<c:forEach items="${studyMylist}" var="myvo">
				  <div class="swiper-slide">
				  	<div class="excerpt "> 
				  	<a href="<%=request.getContextPath() %>/study?study_no=${myvo.study_no}">
			          	<div class="header"> ${myvo.study_name}</div> 
			          	<div class="text">${myvo.study_info}</div>
		            	<c:if test="${myvo.study_recruitment_condition eq '1' }">
		            	<div class="text_wrap"><label>모집 상태 :</label> <div class="meta">모집 중</div></div>
		            	</c:if>
		            	<c:if test="${myvo.study_recruitment_condition eq '2' }">
		            	<div class="text_wrap"><label>모집 상태 :</label> <div class="meta">모집 마감</div></div>
		            	</c:if>
						<div class="text_wrap"><label>온/오프라인 :</label><div class="meta">${myvo.study_type}</div></div>
		            	<div class="text_wrap"><label>시작 예정일 :</label><div class="meta">${myvo.study_start_date }</div></div>
		            	<div class="text_wrap"><label>종료 예정일 :</label><div class="meta">${myvo.study_end_date }</div></div>
		            	<div class="text_wrap"><label>총 모집 인원 :</label><div class="meta">${myvo.study_people }명</div></div>
		            	<div class="text_wrap"><label>카테고리 :</label><div class="meta">${myvo.study_tag }</div></div>
		             </a>
					 </div>
				  </div>
				</c:forEach>
	    </div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
	    <div class="swiper-wrapper">
	    	<div class="myStudy_null">
				<h4>나의 스터디가 없습니다.</h4>
	    	</div>
	    </div>
	</c:otherwise>
	</c:choose>
	    <div class="swiper-pagination"></div>
	  </div>
	    <!-- End Swiper Section -->
    </div>
    </sec:authorize>
    <!-- ENDS My Study -->
    <!-- Study List -->
    <div class="inner-wrapper">
    <div class="main-study-title_wrap">
	    <h3>스터디</h3>
		<form action="<%=request.getContextPath() %>/main" method="GET">
	    <div class="main-study-title_wrap-2">
		  	<input type="hidden" id="search_cateCode" name="cateCode">
		  	<div class="input-group input-group-merge">
		  		<input id="searchInput" name="searchInput" class="form-control" type="search" value="" id="html5-search-input">
	       	</div>
		  	<button type="submit" class="btn btn-sm btn-secondary" id="searchBtn">검색</button>
	    </div>
		</form>
    </div>
    
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
			          	 <a href="<%=request.getContextPath() %>/study?study_no=${a.study_no}">
		          		<c:if test="${a.study_recruitment_condition eq '1' }">
				          	<div class="header"> ${a.study_name}</div> 
				          	<div class="text">${a.study_info}</div>
			            	<div class="text_wrap"><label>모집 상태 :</label> <div class="meta">모집 중</div></div>
				          	<div class="text_wrap"><label>온/오프라인 :</label><div class="meta">${a.study_type}</div></div>
			            	<div class="text_wrap"><label>시작 예정일 :</label><div class="meta">${a.study_start_date }</div></div>
			            	<div class="text_wrap"><label>종료 예정일 :</label><div class="meta">${a.study_end_date }</div></div>
			            	<div class="text_wrap"><label>총 모집 인원 :</label><div class="meta">${a.study_people }명</div></div>
			            	<div class="text_wrap"><label>카테고리 :</label><div class="meta">${a.study_tag }</div></div>
			             </c:if>
			          	 <c:if test="${a.study_recruitment_condition eq '2' }">
				          	<div class="header"> ${a.study_name}</div> 
				          	<div class="text">${a.study_info}</div>
				          	<div class="text_wrap"><label>모집 상태 :</label><div class="meta">모집 마감</div></div>
				          	<div class="text_wrap"><label>온/오프라인 :</label><div class="meta">${a.study_type}</div></div>
			            	<div class="text_wrap"><label>시작 예정일 :</label><div class="meta">${a.study_start_date }</div></div>
			            	<div class="text_wrap"><label>종료 예정일 :</label><div class="meta">${a.study_end_date }</div></div>
			            	<div class="text_wrap"><label>총 모집 인원 :</label><div class="meta">${a.study_people }명</div></div>
			            	<div class="text_wrap"><label>카테고리 :</label><div class="meta">${a.study_tag }</div></div>
			             </c:if>
			          	</a>
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
	centeredSlides: true, 
	pagination: {
      el: ".swiper-pagination",
      clickable: true
    },
    slidesPerView : 'auto',
    centeredSlides: true, 
    autoplay: {
    	delay: 2500
    }
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