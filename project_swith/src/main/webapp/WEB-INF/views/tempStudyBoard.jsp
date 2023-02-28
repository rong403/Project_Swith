<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tempStdBoard</title>
</head>
<body>
	<div class="stdInfo_div" id="board_div">
			<div class="admin_nav_wrap">
				<div class="admin_nav">
					<a href="#" >최신순</a>
					<a href="#" >오래된순</a>
				</div>
				<button class="btn btn-sm btn-info">글작성</button>
			</div>
	        <div class="board_list">
	        	<div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div>
	        	<div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div><div class="list_content">
	        		<h5>해당 게시물의 제목</h5>
	        		<div>
	        			<p>영문을 모르는 사람</p>
	        			<p>2023.01.02</p>
	        		</div>
	        	</div>
	        </div>
            <div class="pagination">
            	<a class="page_item pre"><img class="page_img" src="<%=request.getContextPath()%>/resources/images/my_arrow_180.png"></a>
            	<a class="page_item">1</a>
            	<a class="page_item">2</a>
            	<a class="page_item">3</a>
            	<a class="page_item">4</a>
            	<a class="page_item">5</a>
            	<a class="page_item next"><img class="page_img" src="<%=request.getContextPath()%>/resources/images/my_arrow.png"></a>
            </div>
		</div>
</body>
</html>