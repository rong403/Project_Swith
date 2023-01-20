<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
</head>
<body>
	
	<textarea id="textarea_ck_test"></textarea>
	<button type="button" id="testbtn">버튼</button>
	<script>
	let editor;
		ClassicEditor.create(document.querySelector('#textarea_ck_test'),{
			ckfinder: {uploadUrl: '<%=request.getContextPath()%>/wisupload'}})
		.then(newEditor => {editor = newEditor;}).catch(function (error) {
	        console.error(error);
	    });
	</script>
</body>
</html>