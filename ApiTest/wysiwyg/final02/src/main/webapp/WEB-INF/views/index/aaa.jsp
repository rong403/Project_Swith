<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script> --%>
<script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
</head>

<body>
	<div class="mb-3" style="width: 50%; margin: 0 auto;">
		<label for="exampleFormControlTextarea1" class="form-label">NewsContent</label>
		<textarea class="form-control " name="freeboard_content" id="ckeditor" rows="6"></textarea>
	</div>
	
	<script type="text/javascript">
	let editor;
	ClassicEditor.create(document.querySelector('#ckeditor'),{
		ckfinder: {uploadUrl: '<%=request.getContextPath()%>/wisupload'}})
	.then(newEditor => {editor = newEditor;}).catch(function (error) {
        console.error(error);
    });
	</script>
</body>
</html>