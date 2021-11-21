<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<title>GymCarry</title>
<link rel="stylesheet" href="/gym/css/index.css">
<script src="/gym/js/index.js"></script>
</head>
<body>
	
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	
	
	<!-- ------------------------------------ -->
	

	<!-- Contents -->
	<div class="container">
		<section class="video_section">
			<div class="video">
				<video src="<c:url value="/video/index.mp4"/>" autoplay muted loop></video>
			</div>
			<div class="survey">
				<div class="typing-txt"> 
				  <ul>
				    <li>혼자 하는 운동이 막막하고 어려우신가요?</li>
				    <li>당신의 맞춤 전문 코치를 찾아드릴게요 !</l>
				</ul>
				
				</div> 
				<div class="typing">
				   <ul>
				     <li></li>
				     <li></li>
				  </ul>
				</div> 
			</div>
			<a href="<c:url value='/survey/survey'/>" class="btn">시작</a>
		</section>
		<section class="review_section container_fix swiper-container">
			<h1 class="title">Carry Review</h1>
			<h2 class="title2">짐캐리 회원들의 생생한 리뷰를 확인하세요 !</h2>
			<div class="review_contaier swiper-wrapper">
				<c:forEach var="list" items="${review}" begin="0" end="10">
					<div class="review_content swiper-slide" onclick="location.href='<c:url value = "/carry/detail?cridx=${list.cridx}"/>'">
						<div class="review_img">
							<img src="<c:url value="/uploadfile/${list.crbfphoto}"/>" alt="img" class="crphoto">
						</div>
						<div class="review">
							<h2 class="title">${list.crname}<span>캐리</span></h2> 
							<p>${list.reviewcontent}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</section>
	</div>
	<!-- Contents end -->
	
	<!-- ------------------------------------- -->
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>	
	
	<!-- ------------------------------------- -->
	
	<!-- review slider script -->	
	<script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 4,
            direction: getDirection(),
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            on: {
                resize: function () {
                    swiper.changeDirection(getDirection());
                },
            },
        });

        function getDirection() {
            var windowWidth = window.innerWidth;
            var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

            return direction;
        }
	</script>	