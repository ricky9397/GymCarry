<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>캐리 마이페이지_내 회원 목록</title>

<link rel="stylesheet" href="/gym/css/style.css">
<link rel="stylesheet" href="/css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/index.js"></script>

<!-- 캘린더 -->
<link rel="stylesheet" href="css/carrycalendar.css">
<script src="/js/calendar.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
</script>




</head>

<style>
#container {
	display: flex;
	flex-wrap: wrap;
	width: 70%;
	margin: 140px auto 0;
	justify-content: center;
	gap: 20px;
}

.main {
	padding-top: 20px;
	text-align: center;
	width: 1200px;
	min-width: 500px;
	height: auto;
	background-color: snow;
}

#container>.main>img {
	width: 200px;
	height: 200px;
	margin-top: 20px;
}

#container>.main>.nameline {
	list-style-type: none;
	text-align: center;
	margin: 0;
	padding: 0;
	vertical-align: middle;
}

.edit1 {
	width: 20px;
	height: 20px;
	background-color: transparent;
	border: none;
	float: left;
	visibility: hidden;
}

#container>.main>.nameline>a>#edit2 {
	width: 20px;
	height: 20px;
	margin-left: 5px;
}

#container>.main>#calendar {
	width: 80%;
	margin-top: 20px;
	margin-bottom: 50px;
	height: auto;
	display: inline-block;
	text-align: center;
	justify-content: center;
}

#container>.mypage .todaylist {
	display: inline-flex;
}

.second-line {
	display: flex;
	min-width: 500px;
	width: 1200px;
	flex-wrap: nowrap;
	gap: 20px;
}

.title {
	font-size: 20px;
	margin: 20px auto;
	display: inline-block;
}

.modi-list {
	background-color: lavender;
	width: 35%;
	height: auto;
	padding: 10px;
}

.modi-list>h3 {
	margin-bottom: 10px;
}

.mylist {
	background-color: honeydew;
	width: 65%;
	height: auto;
	padding: 10px;
}

.mylist>h3 {
	display: inline-block;
	margin-bottom: 10px;
}

table {
	width: 100%;
	text-align: center;
	border-top: 2px solid #bbb;
	border-bottom: 2px solid #bbb;
	border-collapse: collapse;
}

th {
	background-color: #ddd;
}

th, td {
	border-bottom: 1px solid #bbb;
	border-collapse: collapse;
	padding: 5px 30px;
}
</style>

<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<div id="container">
		<div class="main">
			<p>바탕색은 구분을 위한 임시배경색입니다</p>
			<img src="image/icon/profile.png"><br>
			<div class="nameline">
				<!-- 정렬을 위해 왼쪽에 숨겨둘 것 -->
				<button class="edit1" type="button" onclick>
					<img id="edit1" src="image/icon/edit.png">
				</button>
				<!-- 여기까지 -->
				<h3 class="title">캐리 이름</h3>
				<a href="modifycarrybasicinfo.html"> <img id="edit2"
					src="image/icon/edit.png">
				</a>
			</div>
			<div id="calendar"></div>
		</div>


		<div class="second-line">
			<div class="modi-list">
				<h3>My Page</h3>
				<ul>
					<li><a href="modifycarrybasicinfo.html">기본 정보 수정</a></li>
					<br>
					<li><a href="modifycarryinfo.html">캐리 정보 수정</a></li>
					<br>
					<li><a href="carry_mymemberlist.html">내 회원 리스트</a></li>
					<br>
				</ul>
			</div>

			<div class="mylist">
				<h3>내 회원 리스트</h3>
				<table>
					<tr>
						<th>No.</th>
						<th>회원 이름</th>
						<th>결제 횟수</th>
					</tr>
					<tr>
						<td>1</td>
						<td>박회원</td>
						<td>10회</td>
					</tr>
					<tr>
						<td>2</td>
						<td>신회원</td>
						<td>20회</td>
					</tr>
				</table>
			</div>
		</div>
	</div>


	<!-- Contents end -->
	<!-- Footer -->
	<header include-html="footer.html"></header>
	</footer>

	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>

</html>