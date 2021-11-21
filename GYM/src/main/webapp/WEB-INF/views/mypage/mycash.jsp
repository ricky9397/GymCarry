


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>



<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

<!--제이쿼리 CDN-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="/gym/css/mypage/bootstrap.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

<!-- 개인 css -->
<link rel="stylesheet" href="/gym/css/mypage/grid.css">

</head>
<body>

	<div class="col-r-order">

		<div class="col-right-top">

			<h1 class="col-h1">내 결제 내역</h1>
			<div class="c-table">
				<table border="1" style="width: 100%">
					<tr>
						<td>
							<h2>캐리 네임</h2>
						</td>
						<td>
							<h2>결제 횟수</h2>
						</td>
						<td>
							<h2>결제 가격</h2>
						</td>
						<td>
							<h2>결제일</h2>
						</td>
					</tr>
					<c:forEach items="${paymentList}" var="paymentList">
					<tr>
						<td>
							<h3>${paymentList.crname}</h3>
						</td>
						<td>
							<h3>${paymentList.paynum}</h3>
						</td>
						<td>
							<h3>${paymentList.payprice}</h3>
						</td>
						<td>
							<h3>${paymentList.paydate}</h3>
						</td>
					</tr>
					</c:forEach>


				</table>
			</div>

		</div>

	</div>


</body>


</html>

