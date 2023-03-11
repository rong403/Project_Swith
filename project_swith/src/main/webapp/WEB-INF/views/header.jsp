<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<!-- HEADER -->
<div id="header">
	<!-- wrapper-header -->
	<div class="wrapper">
		<!-- Social -->
		<sec:authorize access="isAnonymous()">
			<ul class="social ">
				<li class="con-tooltip bottom">
					<a href="<%=request.getContextPath()%>/member/viewLogin">
						<img id="icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-들어가다-32.png" alt="">
					</a>
					<div class="tooltip "><p>로그인</p></div>
				</li>
				<li class="con-tooltip bottom">
					<a href="<%=request.getContextPath()%>/member/join">
						<img id="icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-회원-가입-64.png" alt="">
					</a>
					<div class="tooltip "><p>회원 가입</p></div>
				</li>
			</ul>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">
			<ul class="social ">
				<li class="con-tooltip bottom">
					<a href="#">
						<img id="user_icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-약속-미리-알림-48.png" alt="">
					</a>
					<div class="tooltip "><p>알림</p></div>
				</li>
				<li class="con-tooltip bottom">
					<a href="<%=request.getContextPath()%>/CreateStudy">
						<img id="user_icons8_png" src="<%=request.getContextPath()%>/resources/images/icon - 글쓰기.svg" alt="">
					</a>
					<div class="tooltip "><p>글 등록</p></div>
				</li>
				<li class="con-tooltip bottom">
					<a href="<%=request.getContextPath()%>/mypage">
						<img id="user_icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-미니-홈피-제곱은-윤곽-64.png" alt="">
					</a>
					<div class="tooltip "><p>마이페이지</p></div>
				</li>
				<li class="con-tooltip bottom">
					<form action="<%=request.getContextPath()%>/logout" method="POST">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button type="submit" id="logout_btn">
							<img id="user_icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-출구-48.png" alt="">
						</button>
					</form>
					<div class="tooltip "><p>로그아웃</p></div>
				</li>
			</ul>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<ul class="social ">
				<li class="con-tooltip bottom">
					<a href="#">
						<img id="user_icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-약속-미리-알림-48.png" alt="">
					</a>
					<div class="tooltip "><p>알림</p></div>
				</li>
				<li class="con-tooltip bottom">
					<a href="<%=request.getContextPath()%>/admin">
						<img id="user_icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-미니-홈피-제곱은-윤곽-64.png" alt="">
					</a>
					<div class="tooltip "><p>관리페이지</p></div>
				</li>
				<li class="con-tooltip bottom">
					<form action="<%=request.getContextPath()%>/logout" method="POST">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button type="submit" id="logout_btn">
							<img id="user_icons8_png" src="<%=request.getContextPath()%>/resources/images/icons8-출구-48.png" alt="">
						</button>
					</form>
					<div class="tooltip "><p>로그아웃</p></div>
				</li>
			</ul>
		</sec:authorize>
		<!-- ENDS Social -->
		<a href="<%=request.getContextPath()%>/main"><img id="logo"
			src="<%=request.getContextPath()%>/resources/caja/img/logo04.png"
			alt=""></a>
		<!-- headline -->
		<!-- 
    <div id="headline">
      <div class="slides_container">
        <div>여기 우리가 필요한 내용I am Free Portfolio Template. <a href="#">Get Premium Version</a></div>
        <div>들어갈 자리 I'm a beautiful crafted template designed for creatives to be used by creatives. My layout is perfect to showcase work and offer free files downloads. Come on, approach and discover me and my many color skins, you will be amazed! </div>
        <div>두군데? 세군데?More to say? Use as many paragraphs as you want to express yourself. Let them know what you got and what you can do! </div>
      </div>
    </div>
     -->
	</div>
</div>
<!-- ENDS HEADER -->
