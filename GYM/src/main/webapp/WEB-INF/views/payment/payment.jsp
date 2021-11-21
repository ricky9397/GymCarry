<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<title>GymCarry : 결제 페이지</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/gym/css/payment/payment.css">

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<!-- Contents -->
	<div class="container_fix container payment_wrap">
		<h1>결제하기</h1>
		<div>
			<h3>주문 정보</h3>
				<div class="order_info">
					<span>${crnick}(${crname}) 캐리 : ${paynum}회 이용권</span> <br>
					<h4>
						${paynum}회
						<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${payprice}" />
						원
					</h4>
				</div>

			<br> <br>
			
				<form id="paymentForm" name="paymentForm" method="post">
				<div>
					<h3>결제 정보</h3>
					<p>
						이름 <span style="color: blue">*</span>
					</p>
					<input type="text" class="input_box" placeholder="이름을 입력해주세요"
						name="payname" required>
					<p>
						연락처 <span style="color: blue">*</span>
					</p>
					<input type="text" class="input_box" placeholder="'-'없이 번호만 11자리 형식으로 입력해주세요."
						name="payphone" required> <br> <br> <br> <br>
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="now" />
					<%-- <c:out value="${now}" /> --%>
					<input type ="hidden" name="paydate" value="${now}">
					<input type ="hidden" name="cridx" value ="${cridx}">
					<input type ="hidden" name="memidx" value="${loginSession.memidx}">
					<input type ="hidden" name="payprice" value="${payprice}">
					<input type ="hidden" name="paynum" value="${paynum}">
					<!-- <h3>대면 / 비대면 여부</h3>
					<div class="faceornot_selectbox">
						<input type="radio" name="faceornot" value="1" id="rd1" checked="checked">
						<label for="rd1" class="label">대면</label>
						<br>
						<input type="radio" name="faceornot" value="2" id="rd2" checked="checked">
						<label for="rd2" class="label">비대면</label>
					</div> -->
					
					<br> <br>

					<h3>최종 결제 금액</h3>
					<div class="pricebox">
						<ul>
							${paynum}회 이용권
							<li><fmt:formatNumber type="number" maxFractionDigits="3"
									value="${payprice}" />원</li>
						</ul>
					</div>
				</div>
				
				<div class="btn_wrap">
					<input type="button" value="결제하기" onclick="requestPay();" class="pay_btn">
					<input type="button" value="취소" onclick="location.href='javascript:window.history.back();'">
				</div>
				</form>
		</div>

	</div>


	<!-- Contents end -->


	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>


	<script>
	  document.getElementById('currentDatetime').value= new Date().toISOString().slice(0, 18);
	</script>



	<script>
	
		/* 이니시스API 호출  START*/
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp65837574"); // 예: imp00000000

		function requestPay() {
			
			// 주문자명, 연락처 input이 비어있을 경우에 alert 띄움
			if(!document.paymentForm.payname.value || !document.paymentForm.payphone.value) {
				
				alert('주문자명과 연락처를 입력해주세요.');
				document.paymentForm.payname.focus();
				return false;
			
			} else {
			
				// IMP.request_pay(param, callback) 결제창 호출
				IMP.request_pay({ // param
					pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
					pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
					merchant_uid : "${payidx}",
					name : "수업${paynum}회 이용권",
					amount : "${payprice}",
					buyer_email : "",
					buyer_name : "${loginSession.memname}",
					buyer_tel : "${payphone}",
					buyer_addr : "",
					buyer_postcode : ""
				}, function(rsp) { // callback
					if (rsp.success) {
						// 결제 성공 시 로직
	            		$.ajax({
						type : 'POST',
						url : "<c:url value='/payment/complete'/>",
						data : $("#paymentForm").serialize()
						});	
						location.href='/gym/payment/complete'
	      			} else {
						alert("결제에 실패하였습니다. \n에러 내용: " + rsp.error_msg);
					}	
				});
				/* 이니시스API 호출 END*/
				}
		}
		
	</script>