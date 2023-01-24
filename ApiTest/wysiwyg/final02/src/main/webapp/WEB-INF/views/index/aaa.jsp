<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="C:\Users\LSC\Documents\GitHub\Project_Swith\ApiTest\wysiwyg\final02\src\main\webapp\resources\ckeditor\ckeditor.js"></script>
</head>

<body>
	<div class="mb-3" style="width: 50%; margin: 0 auto;">
		<label for="exampleFormControlTextarea1" class="form-label">NewsContent</label>
		<textarea class="form-control " name="freeboard_content" id="ckeditor" rows="6"></textarea>
	</div>
	
	<script type="text/javascript">
		CKEDITOR.replace('ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
	        width:'100%',
	        height:'400px',
	        filebrowserUploadUrl:  "fileupload.do"
	    });
	</script>
</body>
</html>