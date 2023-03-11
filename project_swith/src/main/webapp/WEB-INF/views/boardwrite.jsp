<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <h1>게시판</h1>
	<hr style="margin-top: 0px; margin-bottom: 0px;">
	<!-- sockJS -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<div class="container group-register">
	    <form action="<%=request.getContextPath() %>/boardwrite" method="post" >
	        <h4 style="margin-top : 3rem; margin-bottom : 3rem;">게시글</h4>
	        <div class="form-group">
	            <label for="board_title">제목</label>
	            <input type="text" class="form-control" name="board_title" id="board_title" required="">
	        </div>	      	
	        <div class="form-group">
	            <label for="board_contents">공지할 내용</label>
	            <textarea class="form-control" rows="20" id="board_contents" name="board_contents" required="" ><c:out value="${group.info}"/></textarea>
	        </div>
			<input type="hidden" name="study_category_code" value="1" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			 <!-- <input type="hidden" name="_csrf" value="5e458943-9ea5-4962-8875-d8542255e5f5"> -->
	        <button type="submit" class="btn btn-primary">등록</button>
	    </form> 
		<br>
		<br>
	</div>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
