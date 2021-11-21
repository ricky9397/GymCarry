<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:useBean id="now" class="java.util.Date" />

<title>캐리 상세페이지</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/carry/carryDetail.css">
<script src="/gym/js/carryDetail.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>



	<!-- Contents -->
	<div class="container">
		<div class="carry_image swiper-container mySwiper">
			<ul class="swiper-wrapper">
				<c:set var="imageLists" value="${carryPlaceInfo.placeimg}"/>
				<c:forEach items="${imageLists}" var="image" varStatus="status">
		            <c:set var="imglen" value="${status.count}"/>
	            
           			<c:if test="${!empty imageLists}">
	            		<li class="swiper-slide">
		                    <img src="<c:out value="${image}"/>">
		                </li>
	                </c:if>
                
              		</c:forEach>
				<c:choose>
                	<c:when test="${empty imageLists}">
                		<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
                		<li class="swiper-slide"><img src="<c:url value="/images/review2.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review3.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review4.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review2.jpg"/>"></li>
                	</c:when>
                	<c:when test="${imglen eq 1}">
                		<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
                		<li class="swiper-slide"><img src="<c:url value="/images/review2.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review3.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review4.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
                	</c:when>
                	<c:when test="${imglen eq 2}">
                		<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
                		<li class="swiper-slide"><img src="<c:url value="/images/review2.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review3.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review4.jpg"/>"></li>
                	</c:when>
                	<c:when test="${imglen eq 3}">
                		<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
                		<li class="swiper-slide"><img src="<c:url value="/images/review2.jpg"/>"></li>
	                	<li class="swiper-slide"><img src="<c:url value="/images/review3.jpg"/>"></li>
                	</c:when>
                	<c:when test="${imglen eq 4}">
                		<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
                		<li class="swiper-slide"><img src="<c:url value="/images/review2.jpg"/>"></li>
                	</c:when>
                	<c:when test="${imglen eq 5}">
                		<li class="swiper-slide"><img src="<c:url value="/images/review1.jpg"/>"></li>
                	</c:when>
                </c:choose>
			</ul>
			<div class="swiper-pagination"></div>
		</div>


		<div class="place_info container_fix">

			<div class="place_info_content">
				<!-- carry info section START -->

				<div class="carryinfo_section">
					<div>
						<c:if test="${empty carryDetail.crbfphoto}">
							<img id="c1">
						</c:if>
						<c:if test="${!empty carryDetail.crbfphoto}">
							<img class="crbfphoto" src="<c:url value="/uploadfile/${carryDetail.crbfphoto}"/>" />
						</c:if>
					</div>


					<table class="carry_info_message" id="introduce">
						<tr>
							<td><span class="carry_name">${carryDetail.crname}</span><span
								class="carry_nick">${carryDetail.crnick}</span></td>
						</tr>

						<tr>
							<td><span class="carry_introduce">${carryDetail.crintro}</span></td>
						</tr>

						<tr>
							<td>
								<div class="carry_procategory">
									<span style="color: #AAA">전문분야</span> <br> <span>${carryDetail.crdepart}</span>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<!-- carry info section END -->


				<div class="carry_carrer" id="certi">
					<h3>자격 및 경력</h3>
					<ul>
						<c:if test="${!empty carryCerti.crcerti1}">					
							<li>${carryCerti.crcerti1}</li>
						</c:if>
						<c:if test="${!empty carryCerti.crcerti2}">
							<li>${carryCerti.crcerti2}</li>
						</c:if>
						<c:if test="${!empty carryCerti.crcerti3}">
							<li>${carryCerti.crcerti3}</li>
						</c:if>
						<c:if test="${!empty carryCerti.crcerti4}">
							<li>${carryCerti.crcerti4}</li>
						</c:if>
						<c:if test="${!empty carryCerti.crcerti5}">
							<li>${carryCerti.crcerti5}</li>
						</c:if>
					</ul>
				</div>



				<!-- carry review section all wrap START -->
				<div class="carry_review_all_wrap">
					<div class="review_write_wrap" id="review">
						<div class="carry_review_title">
							<h2>캐리 후기</h2>
							<c:if test="${loginSession.memidx ne 0}">
								<input type="button" value="후기작성" id="write_review_btn2" class="off" onclick="loginChk()">
							</c:if>
						</div>

						<!-- 리뷰 작성 입력폼 -->
						<form id="reviewForm" name="reviewForm" method="post">
							<div id="review_write" class="review_write display_none"
								class="reviewForm">
								<textarea class="review_input" rows="2" cols="30"
									name="reviewcontent" id="review" placeholder="리뷰를 입력해주세요."
									required></textarea>
								<input type="button" value="등록" class="write_btn" id="write_btn"
									onClick="fn_review('${result.code}')">


								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"
									var="now" />
								<input type="hidden" name="reviewdate" value="${now}"> <input
									type="hidden" id="cridx" name="cridx"
									value="${carryDetail.cridx}"> <input type="hidden"
									id="memidx" name="memidx" value="${loginSession.memidx}">
							</div>
						</form>
					</div>


					<!-- 작성된 캐리 리뷰 리스트 -->
					<%-- <c:forEach items="${carryReviewList}" var="carryReviewList"> --%>
					<div class="review_list_wrap" id="review_sec">
						<%--	<div class="review_list_section">
							<div class="member_profile_image">
								<img src="<c:url value="/images/icon/profile.png"/>" style="width: 50px">
							</div>
							
							<div class="review_content">
								<span class="review_name">${carryReviewList.memnick}</span>
								<span class="review_date">${carryReviewList.reviewdate}</span>
								<br>
								<span>${carryReviewList.reviewcontent}</span>
							</div>
						</div>
					</div> --%>

					</div>
				</div>
				<!-- carry review section all wrap END -->


				<!-- 소속 플레이스 section all wrap START -->
				<div class="carry_place_title">
					<h2>소속 플레이스</h2>
					<div class="carry_place_content">
						<!-- <img src="http://placehold.it/600x300"> -->

						<%-- <c:set var="carryPlaceInfo" value="${carryPlaceInfo}"/> --%>
						<c:set var="imageLists" value="${carryPlaceInfo.placeimg}" />

						<c:set var="mainimg" value="${fn:split(imageLists, ', ')}" />
						<c:set var="mainImglength" value="${fn:length(mainimg[2])}" />
						<c:set var="mainImage"
							value="${fn:substring(mainimg[2], 0, mainImglength)}" />

						<c:if test="${!empty mainImage}">
							<img src="<c:out value="${mainImage}"/>" class="place_main_img">
						</c:if>

						<p>
							<span>
							<a href="<c:url value='/place/detail?placeidx=${carryPlaceInfo.placeidx}'/>">${carryPlaceInfo.placename}</a></span>
					</div>
				</div>
				<!-- 소속 플레이스 section all wrap END -->



				<div class="place_map" id="location">
					<h3>지도</h3>
					<div class="place_address">
						<p>${carryPlaceInfo.placeaddress}</p>
						<p>${carryPlaceInfo.placephone}</p>
					</div>
					<div id="map" style="width: 100%; height: 300px;"></div>
				</div>

			</div>

			<!-- 우측 배너 START -->
			<div class="right_banner">

					<div>
						<c:if test="${empty carryDetail.crphoto}">
							<img id="c2">
						</c:if>
						<c:if test="${!empty carryDetail.crphoto}">
							<img class="crphoto" src="<c:url value="/uploadfile/${carryDetail.crphoto}"/>" />
						</c:if>
					</div>
					
				<h2>${carryDetail.crnick}</h2>
				
				<div class="program_all">

					<c:forEach items="${price}" var="price" varStatus="status">
						<form action="<c:url value='/payment/pay'/>" method="post">

							<input type="hidden" name="cridx" value="${price.cridx}">
							<input type="hidden" name="paynum" value="${price.procount}">
							<input type="hidden" name="payprice" value="${price.proprice}">
							<div class="program">
								<div class="program_info">
									<span>수업 ${price.procount}회 이용권</span> <br>
									<h4>
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${price.proprice}" />
										원
									</h4>
								</div>
								<c:if test="${empty loginSession.crnick}">
									<div id="purchase_btn">
										<input type="submit" value="구매하기" class="button" class="purchaseBtn">
									</div>
								</c:if>
							</div>



							<input type="hidden" name="crnick" value="${carryDetail.crnick}">
							<input type="hidden" name="crname" value="${carryDetail.crname}">
						</form>
					</c:forEach>

				</div>

			</div>
			<!-- 우측 배너 END -->


		</div>
	</div>
	<!-- Contents END -->

	


	<script>

	// 페이지 진입시 이벤트 발생
	$(document).ready(function(){
		
			reviewList();
		
	});

	// 리뷰쓰기 로그인 검사
	 $('#write_review_btn2').click(function(){
            if(${loginSession == null}) {
                alert("로그인 후 이용해 주세요.");
                $(location).attr('href', '<c:url value="/member/login"/>');
            } else {
	           	if(${loginSession.memidx != 0}) {
	           	    $('#write_review_btn2').click(function() {
	           			$('#review_write').removeClass('display_none');
	           		});
	            }   	
	         }
	 });
	
	
	// 결제하기 로그인 검사
	 $('.purchaseBtn').click(function(){
            if(${loginSession == null && loginSession.memidx != 0}) {
                alert("로그인 후 이용해 주세요.");
                $(location).attr('href', '<c:url value="/member/login"/>');
            } 
	 });
	
	
	
	// 리뷰 리스트 출력 ajax
	function reviewList() {
		
		$.ajax({
			url : '<c:url value="/carry/list"/>',
			type : 'POST',
			datatype : 'JSON',
			data : {
				cridx:$("#cridx").val()
			}, 
			success : function(data) {
				var tag = '<div>'
					$.each(data, function(index, item) {
							tag+=	'<div class="review_list_section">' 
							tag+=		'<div class="member_profile_image">' 
							tag+=			'<img class="profileImg" src="<c:url value="/uploadfile/' + item.memphoto + '"/>">' 
							tag+=	    '</div>' 
							tag+=			'<div class="review_content">' 
							tag+=				'<span class="review_name">' + item.memnick + '</span>' 
							tag+=				'<span class="review_date">' + item.reviewdate + '</span>' 
							tag+=				'<br>'
							tag+=				'<span class="review_content_span">' + item.reviewcontent + '</span>' 
							tag+=			'</div>'	
							tag+=	'</div>'	
					});
				
							$('#review_sec').html(tag);
		},

			error : function() {
				alert("error");
				
			}
			
	});
			
	
}
	// 리뷰 등록하기(Ajax)
	function fn_review(code) {

		$.ajax({
			type : 'POST',
			url : "<c:url value='/carry/add'/>",
			data : $("#reviewForm").serialize(),
			success : function() {
				$(".review_input").val("");
				alert('리뷰가 정상적으로 등록되었습니다.');
				reviewList();
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});
	}
	
		
		 // place 이미지 슬라이드
		var swiper = new Swiper(".mySwiper", {
			spaceBetween : 0,
			slidesPerView : 6,
			centeredSlides : false,
			autoplay : {
				delay : 1500,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
		});

		 
</script>


	<!-- kakao map api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2791d61cfcb1bc044154adc4c6bc431"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${carryPlaceInfo.latitude}, ${carryPlaceInfo.longitude}), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${carryPlaceInfo.latitude}, ${carryPlaceInfo.longitude}); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>






<!-- footer -->
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	