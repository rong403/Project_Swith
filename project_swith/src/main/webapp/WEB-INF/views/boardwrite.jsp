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
	    <form action="<%=request.getContextPath() %>/studyBoard" method="post" >
	        <h4 style="margin-top : 3rem; margin-bottom : 3rem;">게시글</h4>
	        <div class="form-group">
	            <label for="board_title">제목</label>
	            <input type="text" class="form-control" name="board_title" id="board_title" required="">
	        </div>	      	
	        <div class="form-group">
	            <label for="board_contents">공지할 내용</label>
	            <textarea class="form-control" rows="20" id="board_contents" name="board_contents" required="" ></textarea>
	        </div>
	        <input type="hidden" name="study_no" value="${study_no }">
	        <input type="hidden" name="category_code" value="1"> <!-- TODO 일단 공지글 1개 추후 category 여러개로 나타낼 예정임. -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        <button type="submit" class="btn btn-primary">등록</button>
	    </form> 
		<br>
		<br>
	</div>
	<script>
	function validation() {
        if(getByte($('#board_title').val()) == "") {
            alert("제목을 입력해주세요");
            return false;
        } else if(getByte($('#board_title').val()) > 70) {
            alert("제목을 20자 이하로 작성해주세요");
            return false;
        }

        if(getByte($('#board_contents').val()) == "") {
            alert("공지할 내용을 입력해주세요");
            return false;
        } else if(getByte($('#board_contents').val()) > 1000) {
            alert("간단소개를 300자 이내로 작성해주세요")
            return false;
        }
	}
	</script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->
