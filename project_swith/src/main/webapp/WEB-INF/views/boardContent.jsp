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
			        <h4 style="margin-top : 3rem; margin-bottom : 3rem;">게시글</h4>
			        <div class="form-group">
			            <div><h3>제목</h3><label for="board_title">${board.board_title }</label></div>
			        </div>	      	
			        <div class="form-group">
			            <div><h3>상세내용</h3><label for="board_contents">${board.board_contents }</label></div>
			        </div>
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
