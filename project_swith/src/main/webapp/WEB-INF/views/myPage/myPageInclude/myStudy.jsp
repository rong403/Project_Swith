<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- ENDS filter -->
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/myPage/myPageInclude/mySidebar.jsp"/>
    <!-- ENDS Sidebar -->
    <!--   -->
    <!-- MyStudyList -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">가입 스터디 조회</h3><hr>
    		</div>
    		<div>
    		<ul class="blocks-thumbs" id="myStudyList">
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
	   </div>
    </div>
    <!-- End MyStudyList -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->