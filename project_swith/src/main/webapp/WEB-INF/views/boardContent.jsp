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
	    <c:choose>
	    	<c:when test="${ board_no != null}">
	    		<c:forEach items="${board_no}" var="boardNum">
			        <h4 style="margin-top : 3rem; margin-bottom : 3rem;">게시글</h4>
			        <div class="form-group">
			            <label for="board_title">${boardNum.board_title }</label>
			            <input type="text" class="form-control" name="board_title" id="board_title" required="">
			        </div>	      	
			        <div class="form-group">
			            <label for="board_contents">${boardNum.board_contents }</label>
			            <textarea class="form-control" rows="20" id="board_contents" name="board_contents" required="" ></textarea>
			        </div>
			        <input type="hidden" name="study_no" value="${study_no }">
			        <input type="hidden" name="category_code" value="1">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</c:forEach>
	       </c:when>
	    </c:choose>
		<br>
		<br>
	</div>
	 <script type="text/javascript">
			 CKEDITOR.replace( 'board_contents', {//해당 이름으로 된 textarea에 에디터를 적용
		         width:'100%',
		         height:'400px',
		         filebrowserUploadUrl:  '<%=request.getContextPath()%>/fileuploadBoard.do?${_csrf.parameterName}=${_csrf.token}'
		    });
			 
			</script>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
