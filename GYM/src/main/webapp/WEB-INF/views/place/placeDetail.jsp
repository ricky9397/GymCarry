<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>내 주변 운동시설 찾아보기</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/place/placeDetail.css">
<script src="/gym/js/placeDetail.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	
	
	<!-- Contents -->
	<c:set var="placeDetail" value="${placeDetail}"/>
    <div class="container place_detail_section">
        <div class="place_image swiper-container mySwiper">
            <ul class="swiper-wrapper">
           		<c:set var="imageLists" value="${placeDetail.placeimg}"/>
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
                <h2 class="place_name">
                   	${placeDetail.placename}
                </h2>
                <p class="place_introduce">
	            	${placeDetail.placeintro}
                </p>
                <div class="place_address">
                    <h3>위치</h3>
                    <p>${placeDetail.placeaddress}</p>
                    <p>${placeDetail.placephone}</p>
                </div>
                <div class="place_time">
                    <h3>운영시간</h3>
                    <ul>
                    	<c:set var="timeList" value="${placeDetail.openhour}"/>
		             	<c:set var="timeListlength" value="${fn:length(timeList)}"/>
						<c:set var="times" value="${fn:substring(timeList, 0, timeListlength)}"/>
						<c:set var="timearr" value="${fn:split(times, ',')}"/>
						
						<c:forEach items="${timearr}" var="time" varStatus="status">
		            		<li>
			                    ${time}
			                </li>
		                </c:forEach>
                    </ul>
                </div>
                <div class="place_parking">
                    <h3>이용정보</h3>
                    <ul>
                    	<c:set var="placeinfo" value="${placeDetail.placeinfo}"/>
                    	<c:if test="${!empty placeinfo}">
		            		<c:set var="infoList" value="${fn:split(placeinfo, ',')}"/>
		            		<c:forEach items="${infoList}" var="info">
			            		<li>${info}</li>
	                        </c:forEach>
                        </c:if>
                    </ul>
                </div>
                <div class="place_map">
                    <h3>지도</h3>
                    <div id="map" style="width:100%;height:300px;"></div>
                </div>
            </div>
            <div class="place_banner">
            
	            <c:set var="rightimg" value="${fn:split(imageLists, ', ')}"/>
	             <%--
				<c:set var="rightImglength" value="${fn:length(rightimg[0])}"/>
				<c:set var="rightImage" value="${fn:substring(rightimg[0], 1, rightImglength-1)}"/> --%>
				
                <c:if test="${empty imageLists}">
               		<img src="<c:url value="/images/review1.jpg"/>">
               	</c:if>
               	<c:if test="${!empty imageLists}">
                  	<img src="<c:out value="${rightimg[0]}"/>">
                </c:if>
                <h4 class="place_name">
                    ${placeDetail.placename}
                </h4>
                <c:if test="${!empty placeDetail.placephone}">
	                <div class="place_tel">
	                    ${placeDetail.placephone}
	                </div>
                </c:if>
            </div>
        </div>
    </div>
    <!-- Contents end -->
	
	
	<!-- kakao map api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2791d61cfcb1bc044154adc4c6bc431"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${placeDetail.latitude}, ${placeDetail.longitude}), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${placeDetail.latitude}, ${placeDetail.longitude}); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	
	
	<!-- swiper plugin -->
	<script>
        // place 이미지 슬라이드
        var swiper = new Swiper(".mySwiper", {
        spaceBetween: 0,
        slidesPerView: 6,
        centeredSlides: false,
        autoplay: {
          delay: 1500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
    </script>