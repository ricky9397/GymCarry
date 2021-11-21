<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>GymCarry : 결제 완료</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/payment/paymentComplete.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<!-- Contents -->
	<div class="container_fix container paymentComplete_wrap">
		<h1>결제 완료</h1>
		<br> <br>
		<h2>결제가 정상적으로 완료 되었습니다.</h2>
		<h2>감사합니다!</h2>

		<div class="btn">
			<input type="submit" value="결제 내역"
				onclick="location.href='<c:url value = "/mypage/mypage2"/>'">
			<input type="button" value="홈으로"
				onclick="location.href='<c:url value = "/index"/>'">
		</div>

	</div>



	<!-- Contents end -->


	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>

