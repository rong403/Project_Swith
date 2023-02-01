<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script> 
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script> -->
</head>

<body>
	<h2>게시물 등록</h2>
	<form method = "post" action = "insert.do">
	<div>
	<div>  제목: <input name = "title" id = "title" size = "80" placeholder = "제목을 입력하세요"></div> <br><br>
			<div class="mb-3" style="width: 50%; margin: 0 auto;">
				<label for="exampleFormControlTextarea1" class="form-label"></label>
		내용:	<div style = "width:800px; height:100px;"><textarea class="form-control " name="freeboard_content" id="ckeditor" rows="6"></textarea></div>
			</div>
	</div>
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br>
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br> 
		 <br>
		<div style="width: 700px; text-align: right;">
			<button type="submit" name="submit">확인</button>
		</div>
		
		
		<script type="text/javascript">
		/*
		let editor;
		ClassicEditor.create(document.querySelector('#ckeditor'),{
			ckfinder: {uploadUrl: '<%=request.getContextPath()%>/fileupload.do'}})
		.then(newEditor => {editor = newEditor;}).catch(function (error) {
	        console.error(error);
	    });
		*/
		
		 CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
	         width:'100%',
	         height:'400px',
	         filebrowserUploadUrl:  '<c:url value="/fileupload.do" />?${_csrf.parameterName}=${_csrf.token}'
	    });
		</script>
		</form>
</body>
</html>