<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- filter -->
    <ul class="tags">
      <li><span>Categories</span></li>
      <li><a href="#">All</a></li>
      <li class="active"><a href="#"> Photography</a></li>
      <li><a href="#">Logo</a></li>
      <li><a href="#">Webdesign</a></li>
      <li><a href="#">Marketing</a></li>
      <li><a href="#">Gaming</a></li>
      <li><a href="#">Coding</a></li>
    </ul>
    <!-- ENDS filter -->
    <!-- search -->
    <div class="top-search">
      <form  method="get" id="searchform" action="#">
        <div>
          <input type="text" value="Search..." name="s" id="s" onFocus="defaultInput(this,'Search...')" onBlur="clearInput(this,'Search...')">
          <input type="submit" id="searchsubmit" value=" ">
        </div>
      </form>
    </div>
    <!-- ENDS search -->
    <!-- Sidebar -->
    <div class="mySidebar">
      <!-- table -->
      <h6 class="mySidebar side-title"><span>Profile</span></h6>
      <table>
	    <tbody>
	    	<tr class="first-item">
		    	<td rowspan="2"><img src="img/dummyProfile.png" alt=""></td>
		    	<td colspan="2">공부의신</td>
	    	</tr>
	    	<tr class="">
		    	<td colspan="2">교과서만 읽었어요!</td>
	    	</tr>
	    	<tr class="last-item">
		    	<td colspan="3" align="right"><button>update profile</button></td>
	    	</tr>
	    </tbody>
      </table>
      <!-- ENDS table -->
      <!-- My Category -->
      	<table class="button-list">
      		<tr class="first-item">
      			<td>
      				<button>스케줄 조회</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      		<tr>
      			<td>
      				<button>가입 스터디 조회</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      		<tr>
      			<td>
      				<button>신청 스터디 내역</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      		<tr>
      			<td>
      				<button>개인 정보 수정</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      		<tr>
      			<td>
      				<button>비밀번호 변경</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      		<tr class="last-item">
      			<td>
      				<button>회원탈퇴</button>
      			</td>
      			<td class="btn-img"><img src="img/arrow.png" alt=""></td>
      		</tr>
      	</table>
      <!-- ENDS My Category -->
    </div>
    <!-- ENDS Sidebar -->
    <!-- MySchedule -->
    <div class="right-wrapper">
    	<div class="right-content">
    		<div class="padding">
    			<h3 class="p-title">스터디 신청 내역</h3><hr>
    		</div>
    		<div>
				<table class="right-section">
					<tr>
						<td></td>
						<td>신청일</td>
						<td>승인일</td>
						<td>탈퇴일</td>
						<td>종료일</td>
					</tr>
					<tr>
						<td>파이썬 알고리즘/자료구조 코딩 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td>2022.03.21</td>
					</tr>
					<tr>
						<td>프론트엔드 개발자 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
					</tr>
					<tr>
						<td>강남 백엔드 스터디</td>
						<td>2022.03.21</td>
						<td>승인 거절</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>알고리즘 오프라인 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>자바 알고리즘 오프라인 스터디</td>
						<td>2022.03.21</td>
						<td>2022.03.21</td>
						<td></td>
						<td></td>
					</tr>
				</table>
	   		</div>
	   </div>
    </div>
    <!-- End MySchedule -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->