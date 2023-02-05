<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
 	<div class="wrapper">

		<div class="movieChartBeScreen_btn_wrap">
			<div class="tabBtn_wrap">
				<h3>
					<a href="#" class="active" id="btnInfo">Info</a>
				</h3>
				<h3>
					<a href="#" id="btnSchedule">Schedule</a>
				</h3>
				<h3>
					<a href="#" id="btnBoard">Board</a>
				</h3>
			</div>
		</div>
		
		<hr>
		
		<div id="info" >
			<br>
            <h4>모임정보</h4>
            <br>
            <pre><c:out value="${group.info}"/></pre>
            <p>
            	스터디 소개 <br>
            	영어를 공부하려고 원서를 샀는데 <br>
            	얼마 읽지 못하고 책꽂이로 간 경험 있으신가요? :(
            </p>
        </div>
		<div>
			<button>가입신청</button>
		</div>
		<br>
		<br>
		<div>
			<h3>멤버	2/8	&nbsp;&nbsp;&nbsp; *공부의신</h3>
		</div>
		<hr>
		
		<section class="mb-5">
            <div class="card bg-light">
                <div class="card-body">
                    <!-- Comment form-->
                    <form class="mb-4">
                    	<textarea class="form-control" rows="3" placeholder="댓글을 작성해 주세요."></textarea>
                    	<input type="button" value="등록">
                    </form>
                    <!-- Comment with nested comments-->
                    <div class="d-flex mb-4">
                        <!-- Parent comment-->
                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                        <div class="ms-3">
                            <div class="fw-bold">스터디를찾아서</div>
                            	한번에 몇시간정도 진행하나요?
                            <!-- Child comment 1-->
                            <div class="d-flex mt-4">
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold">공부의신</div>
                                    	약 1~2시간 정도 진행합니다.
                                </div>
                            </div>
                            <!-- Child comment 2-->
                            <div class="d-flex mt-4">
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold">스터디를찾아서</div>
                                    	네 감사합니다
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single comment-->
                    <div class="d-flex">
                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                        <div class="ms-3">
                            <div class="fw-bold">영어배운사람</div>
                            	어디 스터디카페에서 진행하나요?
                        </div>
                    </div>
                </div>
            </div>
        </section>
		<br>
	</div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->