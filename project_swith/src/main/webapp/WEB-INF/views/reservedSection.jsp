<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String item_name=request.getParameter("item_name");
	String amount=request.getParameter("amount");
%>

<!-- Main -->
<div>
	<h2>결제 완료</h2>
	<div>
		<div>
			<div>결제 정보</div>
			<ul>
				<li>상품명 : <%= item_name %></li>
				<li>금액 : <%= amount %></li>
				<li>결제일 : </li>
			</ul>
		</div>
		<div>
			<div>예약 정보</div>
			<ul>
				<li>예약자 : </li>
				<li>예약자 아아이디 : </li>
				<li>예약일 : </li>
			</ul>
		</div>
	</div>
</div>
<!--End Main -->