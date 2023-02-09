<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- filter -->
    <ul class="tags">
      <li><span>Categories</span></li>
      <li><a href="#">All</a></li>
      <li class="active"><a href="#"> Photography</a></li>
      <li><a href="#">Logo</a></li>
      <li><a href="#">Webdesign</a></li>
      <li><a href="#">Marketing</a></li>
      <li><a href="#">Gaming</a></li>
      <li><a href="#">Coding</a></li>
    </ul>
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
<%-- 	    <c:choose>
			<c:when test="${empty list }">
				   <h2>등록한 스터디 글이 없습니다..</h2>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="a">
				<div style="border: 1px solid skyblue; margin-right: 2px"; margin-left=2px; margin-top=2px;>
					<!-- private int pocket;
					private String goodsName;
					private int price;
					private String productimg; -->
					<form action="<%=request.getContextPath()%>/pocketInsert.do" method="post">
						<div class="b" name="price">월 ${a.price }원x12</div>
						<div class="b" name="productimg"><img src="${a.productimg }" width="200" height="200"></div>
						<div class="b" name="goodsName">${a.goodsName }</div>
						TODO
						<input type="hidden" name="pocket" value="${a.pocket }">
						<div class="b"><button type="submit"><img src= "${pageContext.request.contextPath }/images/장바구니로고_hover.svg"></button></div>
					</form>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose> --%>
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
    <hr>
      <ul class="blocks-thumbs">
        <li> 
          <div class="excerpt"> <a href="project.html" class="header">Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
            <div class="meta">Admin on 23 Jun, 2010</div>
          </div>
        </li>
        <li> 
          <div class="excerpt"> <a href="project.html" class="header">Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
            <div class="meta">Admin on 23 Jun, 2010</div>
          </div>
        </li>
        <li> 
          <div class="excerpt"> <a href="project.html" class="header">Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
            <div class="meta">Admin on 23 Jun, 2010</div>
          </div>
        </li>
        <li> 
          <div class="excerpt"> <a href="project.html" class="header">Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
            <div class="meta">Admin on 23 Jun, 2010</div>
          </div>
        </li>
        <li> 
          <div class="excerpt"> <a href="project.html" class="header">Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
            <div class="meta">Admin on 23 Jun, 2010</div>
          </div>
        </li>
        <li> 
          <div class="excerpt"> <a href="project.html" class="header">Lorem ipsum dolor</a> <a href="project.html" class="text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet. Quisque sit amet est et sapien ullamcorper pharetra.</a>
            <div class="meta">Admin on 23 Jun, 2010</div>
          </div>
        </li>
      </ul>
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