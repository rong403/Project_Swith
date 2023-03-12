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
    	<div class="right-content study">
    		<div class="padding">
    			<h3 class="p-title">가입 스터디 조회</h3><hr>
    		</div>
    		<div class="myStudy_content_wrap">
				<!-- pager -->
				<c:choose>
				<c:when test="${studyMylist != null }">
					<c:forEach items="${studyMylist}" var="myvo">
					<a href="<%= request.getContextPath() %>/study?study_no=${myvo.study_no}" class="header">
					  <div class="list_content study">
			          	 <c:if test="${myvo.study_recruitment_condition eq 1 }">
				          	<h5> ${myvo.study_name}</h5> 
				          	<div>
					          	시작 예정일 :<div>${myvo.study_start_date }</div>
					          	<br>
	            				종료 예정일 :<div>${myvo.study_end_date }</div>
	            				<br>
	            				총 모집 인원 :<div>${myvo.study_people }</div>
				          	</div>
			             </c:if>
					  </div>
					</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<h4>나의 스터디가 없습니다.</h4>
				</c:otherwise>
				</c:choose>
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