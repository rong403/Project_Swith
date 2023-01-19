<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.js"></script>
</head>
<body>
  <form action="${pageContext.request.contextPath }/cloudinaryd" method="post" enctype="multipart/form-data">
    <input type="file" name="file" multiple>
    <input type="submit" value="Upload Files" name="submit">
  </form>
  <p id="data">
  </p>



<script type="text/javascript">
/* const url = "https://api.cloudinary.com/v1_1/dnik5jlzd/image/upload";
const form = document.querySelector("form");

form.addEventListener("submit", function(e) {
  e.preventDefault();

  const files = document.querySelector("[type=file]").files;
  const formData = new FormData();

  for (let i = 0; i < files.length; i++) {
    let file = files[i];
    formData.append("file", file);
    formData.append("upload_preset", "lzponm2b");

    fetch(url, {
      method: "POST",
      body: formData
    })
      .then(function(response) {
        return response.text();
      })
      .then(function(data) {
        document.getElementById("data").innerHTML += data;
        console.log(data);
      });
  }
}); */
</script>
</body>
</html>