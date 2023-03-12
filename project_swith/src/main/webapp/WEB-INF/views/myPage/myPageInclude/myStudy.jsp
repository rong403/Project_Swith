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
<script>
/* 스터디 관리 */
var studySerchForm = "";
function studyAdminPageHandler(num) {
	studyAdminSerchAjax(num);
}
function studyAdminSerchHandler(num) {
	studySerchForm = $("#study_serch_form").serialize();
	studyAdminSerchAjax(num);
}
function studyAdminSerchAjax(num) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var $adminList = $("#admin_list");
	var $adminPage = $("#admin_page");
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/studyList.lo"
		, type : "post"
		, data : studySerchForm+"&page="+num
		, dataType : "json"
		, beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		}
		, success : function(result) {
			console.log(result.list);
			console.log(result.currentPage);
			console.log(result.maxPage);
			console.log(result.startPage);
			console.log(result.endPage);
			let addAdminList = "";
			if(result.list.length != 0) {
				for(var i = 0; i < result.list.length; i++) {
					addAdminList +=	"<div class='list_content study'>"+
						        		"<h5>"+result.list[i].study_name+"</h5>"+
						        		"<div>"+
						        			"<p>모임장 아이디 : "+result.list[i].nick_name+"</p>"+
						        			"<div>"+
						        				"<p>생성일 : "+result.list[i].study_create_date+"</p>"+
						        				"<p>시작일 : "+result.list[i].study_start_date+"</p>"+
						        				"<p>종료일 : "+result.list[i].study_end_date+"</p>"+
						        			"</div>"+
						        		"</div>"+
						        	"</div>";
				}
				$adminList.html(addAdminList);
			} else {
				addAdminList += "<div class='list_null'><h5>해당 조건의 스터디 목록이 없습니다.</h5></div>";
				$adminList.html(addAdminList);
			}
			
			let addpage = "";
			if(result.maxPage != 0 && result.maxPage != 1) {
				if(result.startPage != 1) {
					addpage += "<li class='first-page'><a href='javascript:studyAdminPageHandler(1);'>«</a></li>"+
							   "<li><a href='javascript:studyAdminPageHandler("+(result.startPage-1)+");'>‹</a></li>";
				}
				for(var i = result.startPage; i <= result.endPage; i++) {
					if(i == result.currentPage) {
						addpage += "<li class='active'><a href='javascript:studyAdminPageHandler("+i+");'>"+i+"</a></li>";
					} else {
						addpage += "<li><a href='javascript:studyAdminPageHandler("+i+");'>"+i+"</a></li>";
					}
				}
				if(result.endPage < result.maxPage) {
					addpage += "<li><a href='javascript:studyAdminPageHandler("+(result.endPage+1)+");'>›</a></li>"+
								"<li class='first-page'><a href='javascript:studyAdminPageHandler("+result.maxPage+");'>»</a></li>";
		   			
				}
			}
			$adminPage.html(addpage);
		}
		, error : function(request, status, errordata) {
			alert("error code:" + request.status + "/n"
					+ "message :" + request.responseText + "\n"
					+ "error :" + errordata + "\n");
		}
	});
}
</script>