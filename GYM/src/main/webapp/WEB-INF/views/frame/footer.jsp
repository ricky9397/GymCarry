<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Footer -->
<footer class="footer">
	<div class="top_btn" onclick="scrollTopBtn()">
		<img src="<c:url value="/images/icon/top_btn.png"/>" alt="top">
	</div>
	<div class="footer_nav">
		<div class="container_fix">
			<ul class="footer_menu">
				<li><a href="<c:url value="/content?idx=1"/>">이용약관</a></li>
				<li><a href="<c:url value="/content?idx=2"/>">개인정보보호정책</a></li>
				<li><a href="<c:url value="/content/noticelist"/>">공지사항</a></li>
			</ul>
			<div class="sns"> 
				<a href="#" class="insta"> <img src="<c:url value="/images/icon/insta.png"/>" alt="">
				</a> <a href="#" class="facebook"> <img src="<c:url value="/images/icon/facebook.png"/>" alt="">
				</a>
			</div>
		</div>
	</div>
	<div class="footer_content">
		<div class="container_fix">
			<div class="company_info">
				<h2 class="company_name">(주)짐캐리 | Gym Carry</h2>
				<ul>
					<li>서울특별시 마포구 백범로 23</li>
					<li>대표자 : 짐캐리</li>
				</ul>
				<ul>
					<li>사업자등록번호 : 123-45-67899</li>
					<li>통신판매업신고번호 : 2021-서울마포-12345호</li>
				</ul>
				<ul>
					<li>고객센터 및 제휴문의 : gymcarry@gmail.com</li>

				</ul>
			</div>
			<div class="sevice_center">
				<h3>고객센터</h3>
				<p>02-1234-5678 (평일 10:00 ~ 18:00)</p>
				<br><br>
				<a href="<c:url value="/admin/login"/>" class="admin_page">관리자 페이지</a>
			</div>
		</div>
	</div>
</footer>

<script>
	// Top button
	function scrollTopBtn(){
		window.scrollTo({
			top: 0,
			behavior: 'smooth'
		});

	}
</script>
	
</body>
</html>