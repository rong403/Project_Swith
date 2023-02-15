<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String item_name=request.getParameter("item_name");
	String amount=request.getParameter("amount");
%>

<!-- Main -->
<div>
	<h2>결제 완료</h2>
	결제 완료 되었습니다.
	<div>
	*------결제 내역------*
		<ul>
			<li>결제 상품 : ${approve.item_name}</li>
			<li>결제 수량 : ${approve.quantity}</li>
			<li>결제 수단 : ${approve.payment_method_type}</li>
			<li>결제 금액 : ${total_price}</li>
			<li>결제 완료 시간 : ${approve.approved_at}</li>
			<li>
				결제 정보
				${approve.card_info }
			</li>
		</ul>
	</div>
	<div>
		<button type="button">예약 내역 확인</button>
	</div>
</div>
<script>
	
</script>
<!--End Main -->