<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<header>
        <div id="header">
            <div class="logo">
                <a href="<%=request.getContextPath() %>/main" class="logo_a"><img src="<%=request.getContextPath()%>/resources/caja/img/logo04.png" class="logo_img"></a>
            </div>
            <div class="content_bar">
                <div class="content_bar_div">
                <sec:authorize access="isAuthenticated()">
					<ul class="content_bar_list">
						<li class="content_item">
                            <a href="javascript:window.history.back();" class="content_item_a">
                                <span class="map_home">뒤로가기</span>
                            </a>
	                    </li>
	                    <li class="content_item">
	                    	<form action="<%=request.getContextPath()%>/logout" method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<button type="submit" id="logout_btn">
									<span class="map_home">로그아웃</span>
								</button>
							</form>
	                    </li>
					</ul>
				</sec:authorize>
                </div>
            </div>
        </div>
    </header>
<!-- ENDS header -->