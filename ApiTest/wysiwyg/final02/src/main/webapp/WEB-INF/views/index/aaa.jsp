<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script> -->

<script type="text/javascript" src=".../resources/ckeditor_4.20.1_standard/ckeditor/ckeditor.js"></script>

</head>
<body>
	
	<div class="mb-3" style="width: 50%; margin: 0 auto;">
		<label for="exampleFormControlTextarea1" class="form-label">News Content</label>
		<testarea class="form-control" name="freeboard_content" id="ckeditor" rows="6"></testarea>
	</div>
	<script>
		CKEDITOR.replace('ckeditor',{ //해당 이름으로 된 textarea에 에디터를 적용
		width:'100%',
		height:'400%',
		filebrowserUploadUrl:"fileupload.do"  //컨트롤러랑 연결해 줄 코드이다.
		});
<%-- 	let editor;
		ClassicEditor.create(document.querySelector('#textarea_ck_test'),{
			ckfinder: {uploadUrl: '<%=request.getContextPath()%>/wisupload'}})
		.then(newEditor => {editor = newEditor;}).catch(function (error) {
	        console.error(error);
	    }); --%>
	</script>
</body>
</html>