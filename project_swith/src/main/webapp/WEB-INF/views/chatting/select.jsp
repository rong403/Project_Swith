<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- sockjs -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<!-- stompjs -->
<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@6.1.2/bundles/stomp.umd.min.js"></script>
<meta charset="UTF-8">
<!-- <title>채팅</title> -->
<style>
	#s_chat_btn {
		width: 240px;
	}
	
	#s_emp_list {
		font-size: 1.1em;
		width: 120px;
		height: 45px;
		border: 1px solid;
	}
	
	#s_chat_list {
		font-size: 1.1em;
		border: 1px solid;
	}
	
	#s_sub_menu {
		display: flex;
		margin-top: 5px;
	}
	
	.s_menu_box {
		width: 242px;
		height: 613px;
		border: 1px solid lightgray;
		border-radius: 10px;
		padding: 20px;
		overflow: auto;
	}
	
	.s_modal_menu_box {
		width: 400px;
		height: 500px;
		border: 1px solid lightgray;
		border-radius: 10px;
		padding: 20px;
		overflow: auto;
	}
	
	.s_emp_box {
		display: flex;
		align-items: center;
		justify-content: space-evenly;
		border-bottom: 1px solid lightgray;
		padding: 10px 0;
	}
	
	.s_img_style {
		width: 50px;
		height: 50px;
		border-radius: 25px;
	}
	
	#s_f_list {
		font-size: 1.2em;
		padding: 10px 0;
		font-weight: bold;
		color: #0d6efd;
		text-align: center;
		margin-top: 5px;
	}
	
	.s_dn_en {
		display: inline-block;
	}
	
	#s_sub_menu_box {
		width: 300px; 
		height: 50px;
		margin-left: 10px;
	}
	
	.s_chat_box {
		margin-bottom: 20px;
		border-bottom: 1px solid lightgray;
		padding-bottom: 20px;
		cursor: pointer;
	}
	
	.modal-body {
		margin: 0 auto;
	}
	
	#s_select_part {
	    text-align: center;
	    height: 200px;
	    overflow: auto;
	    border: 1px solid lightgray;
	    border-radius: 10px;
	    padding: 20px;
	    margin-bottom: 30px;
	    width: 400px;
	}
	
	.s_select_part_tt {
		font-size: 1.2em;
	    font-weight: bold;
	    text-align: center;
    	margin-bottom: 10px;
	}
	
	.s_invite_p {
		border: 1px solid;
	    width: 90px;
	    padding: 0 10px;
	    border-radius: 10px;
	    display: inline-block;
	    margin: 5px;
	}
	
	.btn-close {
		font-size: .7em;
		margin-left: 3px;
	}
	
	#s_select_part_cnt {
		margin-left: 5px;
	    color: gray;
	}
	/* 스크롤바 디자인 */
	.s_scroll::-webkit-scrollbar {
    	width: 10px;  /* 스크롤바의 너비 */
    	height: 10px;  /* 스크롤바의 너비 */
	}
	
	.s_scroll::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: #34343482; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	.s_scroll::-webkit-scrollbar-track{
	    background: #4747471a;  /*스크롤바 뒷 배경 색상*/
	}
	
	#s_chat_img {
	    display: flex;
	    align-content: stretch;
	    justify-content: center;
	    align-items: center;
	    flex-direction: row;
	    flex-wrap: wrap;
	    margin-top: 320px;
	}
	
	.s_room_tt {
		font-size: 1.2em;
	    font-weight: bold;
	}
</style>
</head>
<body>
	<section>
        <article style="float: left; width: 310px">
            <div id="s_sub_menu_box">
				<div id="s_sub_menu">
	                <h1>채팅 리스트</h1>
                </div>
				

                <div id="s_menu_box2" class="s_menu_box s_scroll">
                	<!-- 채팅방 리스트만큼 반복문 실행 -->
                	<c:forEach items="${selectRoom }" var="i">
	                	<div class="s_chat_box">
					<!-- 채팅방 상세조회 시 넘길 방 번호 hidden으로 주기 -->
	                		<input type="hidden" id="${i.study_no }" value="${i.study_no }">
					<!-- 방 제목 표기 -->
		                	<div class="s_room_tt">${i.study_name }</div>
		                	<div>마지막 대화 내용 뜰곳</div>
	                	</div>
                	</c:forEach>
                </div>
            </div>
        </article>  
        <article style="float: left;">
			<div style="border: 1px solid lightgray;height: 660px;width: 700px;margin-top: 20px;margin-left: 10px;border-radius: 10px;padding: 20px;" id="s_chat_content_box">
            	<div id="s_chat_img">
           		</div>
            </div>
        </article>    
    </section>

</body>

<!-- 모달창 스크립트 -->
<script>
	// 채팅 리스트에 있는 대화방 리스트 클릭했을 때
	$(".s_chat_box").click(function() {
		$(".s_chat_box").css('color', 'black');
		$(this).css('color', 'rgb(13, 110, 253)');
	});
</script>

<!-- 채팅 리스트에서 방 눌렀을 때 -->
<script>
	$(".s_chat_box").click(function() {
		console.log($(this).children().val());
		var roomNo = $(this).children().val();
		//location.href="${pageContext.request.contextPath}/echo/selectroom?study_no=" + roomNo;
		$("#s_chat_content_box").load("<%=request.getContextPath()%>/echo/selectroom?study_no=" + roomNo);
	});
</script>
</html>