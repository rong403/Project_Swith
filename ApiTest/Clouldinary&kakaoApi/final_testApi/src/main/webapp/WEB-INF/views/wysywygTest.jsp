<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
</head>
<body>
<textarea style="height: 200px;" name="bookIntro" id="bookIntro_textarea"></textarea>
<button type="button" id="testbtn">버튼</button>
<script>
let editor;
	ClassicEditor
		.create(document.querySelector( '#bookIntro_textarea' ), {
			ckfinder: {
				uploadUrl: '<%=request.getContextPath()%>/wisupload'
			}
		})
		.then( newEditor => {
		  	editor = newEditor;
		})
		.catch((error) => {
			console.error(error);
	});
	
	$("#testbtn").click(function() {
		console.log(editor.getData());
	});
</script>
</body>
</html>