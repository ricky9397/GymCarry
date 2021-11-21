<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>Gym Carry</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/about/about.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	
	
	<div class="container container_fix about">
		<div class="project_info">
			<h1 class="about_title">Project Introduce</h1>
			<div class="info_menu">
				<div class="info_detail">
					<div class="info_left">Name</div>
					<div class="info_right">Gym Carry</div>
				</div>		
				<div class="info_detail">
					<div class="info_left">Term</div>
					<div class="info_right">2021.08 - 2021.09</div>
				</div>	
				<div class="info_detail">
					<div class="info_left">Introduce</div>
					<div class="info_right">- 트레이닝 장소 정보 및 트레이너 매칭 서비스
						- 정보 공유 커뮤니티
						- PT 결제 시스템
						- 본인 운동 일지 및 메모 기록
						- 트레이너와 채팅을 통해 신중한 선택
					</div>
				</div>		
			</div>
		</div>
		<div class="project_maker">
			<h1 class="about_title">Project Maker</h1>
			<ul>
				<li>
					<a href="https://github.com/jiwondotcom" target="_blank">
						<div class="my_photo">
							<img src="<c:url value="/images/people/j.png"/>">
						</div>
						<div class="li_info">
							<span class="name">Ji Won</span>
							<span class="git">
								<img class="img" src="<c:url value="/images/icon/github.png"/>" alt="git">
							</span>
						</div>
					</a>
				</li>
				<li>
					<a href="https://github.com/seungmin1592" target="_blank">
						<div class="my_photo">
							<img src="<c:url value="/images/people/s.png"/>">
						</div>
						<div class="li_info">
							<span class="name">Seung Min</span>
							<span class="git">
								<img class="img" src="<c:url value="/images/icon/github.png"/>" alt="git">
							</span>
						</div>
					</a>
				</li>
				<li>
					<a href="https://github.com/kimrumm" target="_blank">
						<div class="my_photo">
							<img src="<c:url value="/images/people/a.png"/>">
						</div>
						<div class="li_info">
							<span class="name">Arum</span>
							<span class="git" >
								<img class="img" src="<c:url value="/images/icon/github.png"/>" alt="git">
							</span>
						</div>
					</a>
				</li>
				<li>
					<a href="https://github.com/alghrksl" target="_blank">
						<div class="my_photo">
							<img src="<c:url value="/images/people/h.png"/>">
						</div>
						<div class="li_info">
							<span class="name">Hoon</span>
							<span class="git">
								<img class="img" src="<c:url value="/images/icon/github.png"/>" alt="git">
							</span>
						</div>
					</a>
				</li>
				<li>
					<a href="https://github.com/heybrilliant" target="_blank">
						<div class="my_photo">
							<img src="<c:url value="/images/people/e.png"/>">
						</div>
						<div class="li_info">
							<span class="name">Eun Kyung</span>
							<span class="git">
								<img class="img" src="<c:url value="/images/icon/github.png"/>" alt="git">
							</span>
						</div>
					</a>
				</li>
				<li>
					<a href="https://github.com/ricky9397" target="_blank">
						<div class="my_photo">
							<img src="<c:url value="/images/people/m.png"/>">
						</div>
						<div class="li_info" href="">
							<span class="name">Myung Ho</span>
							<span class="git">
								<img class="img" src="<c:url value="/images/icon/github.png"/>" alt="git">
							</span>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
	<script>
	$(function(){
		var imgurl_1 = "/gym/images/icon/github_on.png"
		var imgurl_2 = "/gym/images/icon/github.png"
		$('.project_maker li').mouseenter(function(){
			$(this).addClass("on");
			$(this).find('.img').attr("src", imgurl_1);
		})
		$('.project_maker li').mouseleave(function(){
			$(this).removeClass("on");
			$(this).find('.img').attr("src", imgurl_2);
		})
	})
	</script>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	
	