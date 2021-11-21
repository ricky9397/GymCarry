<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<title>내 주변 운동시설 찾아보기</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
<link rel="stylesheet" href="/gym/css/place/placeList.css">


<script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ql9vcy7uun"></script>
</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>


<!-- Contents -->
<div class="container container_fix place_list_section">
    <h1 class="page_title">내 주변 운동시설 찾아보기</h1>
    <ul class="place_menu">
        <li><a href="<c:url value="/place/all"/>">전체</a></li>
        <li><a href="<c:url value="/place/health"/>">헬스</a></li>
        <li class="on"><a href="<c:url value="/place/pilates"/>">필라테스</a>
        </li>
        <li><a href="<c:url value="/place/yoga"/>">요가</a></li>
    </ul>
    <div class="place_search_bar">
        <input type="text" name="search" id="search"
               placeholder="센터명을 검색해보세요.">
        <%-- <button type="submit">
            <img src="<c:url value="/images/icon/search_icon.png"/>"
                 alt="search">
        </button> --%>
    </div>
    <div id="map" class="map_section"></div>

    <div class="place_list">
        <c:forEach items="${placePilatesList}" var="placeList" varStatus="status">
            <!-- 대표 이미지 추출 -->
            <c:set var="imgUrl" value="${placeList.placeimg}"/>
			<c:set var="img" value="${fn:split(imgUrl, ', ')}"/>
            <div class="place_content">
                <div class="place_info">
                    <h3>${placeList.placename}</h3>
                    <p>${placeList.placeaddress}</p>
                    <a href="<c:url value="/place/detail?placeidx=${placeList.placeidx}"/>">더 알아보기</a>
                </div>
                <div class="place_img">
                    <c:if test="${empty imgUrl}">
                        <img src="<c:url value="/images/review1.jpg"/>">
                    </c:if>
                    <c:if test="${!empty imgUrl}">
                        <img src="<c:out value="${img[0]}"/>">
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!-- Contents end -->

<!-- 지도[s] -->
<div id="map" style="width: 100%; height: 500px; margin-top: 50px"></div>

<script>
    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.55528086061827, 126.93683578593966), //지도 시작 지점
        zoom: 15
    });
    $(function() {
        initMap();
    });
    function initMap() {
        const areaArr = new Array(); // 지역을 담는 배열 ( 지역명/위도경도 )
        <c:forEach items="${placePilatesList}" var="placeList" varStatus="status">
            areaArr.push(
                /*업체 이름*/			               /*위도*/					/*경도*/
                {location : '<div class="map_in_place_name">${placeList.placename}</div>' , latlng : new naver.maps.LatLng(${placeList.latitude} , ${placeList.longitude})}  // 중심좌표
        );
        </c:forEach>
        for (var i = 0; i < areaArr.length; i++) {
            // 마커 생성
            var marker = new naver.maps.Marker({
                map: map,
                position: areaArr[i].latlng,
                icon: {
                    // 마커 이미지 설정
                    content: [
                        '<div style="padding-top:5px;padding-bottom:5px;padding-left:5px;padding-right:5px;">' +
                        '<div> <img src="/gym/images/icon/gym-location.png" style="width:42px; height:42px;"></div>' +
                        '</div>'
                    ].join(''),
                    size: new naver.maps.Size(50, 52),
                    origin: new naver.maps.Point(0, 0),
                    anchor: new naver.maps.Point(25, 26)
                },
                draggable: false
            });
           // 마커 표시 할 인포윈도우 생성
            var infoWindow = new naver.maps.InfoWindow({
                backgroundColor : 'none',   // 기분 말풍선 색상
                disableAnchor : true,       // 기본 말풍선 꼬리 사용 여부
                borderWidth : 0,            // 기본 말풍선 창 테두리 두께
                content: areaArr[i].location
            });
            // markers.push(marker); // 생성한 마커를 배열에 담는다.
            // infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
            naver.maps.Event.addListener(marker, 'mouseover', makeOverListener(map, marker, infoWindow));
            naver.maps.Event.addListener(marker, 'mouseout', makeOutListener(infoWindow));
            naver.maps.Event.addListener(marker, 'click', makeClickListener(marker, i));
        }
        // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
        function makeOverListener(map, marker, infoWindow) {
            return function() {
                infoWindow.open(map, marker);
            };
        }
        // 인포윈도우를 닫는 클로저를 만드는 함수입니다
        function makeOutListener(infoWindow) {
            return function() {
                infoWindow.close();
            };
        }
        // 마커 클릭시 해당하는 place list로 스크롤 이동
        function makeClickListener(marker, i){
            return function(){
                var idx = i + 1;
                var window_y = window.scrollY;
                var content_top = $('.place_list .place_content:nth-child(' + idx + ')').offset().top
                window.scrollTo({
                    top: content_top - 200,
                    behavior: 'smooth'
                });
                $('.place_list .place_content:nth-child(' + idx + ')').addClass('on');
                $(window).scroll(function(){
                    var window_top = $(window).scrollTop() + 500;
                    if(window_top > content_top) {
                        $('.place_list .place_content:nth-child(' + idx + ')').addClass('on');
                    } else {
                        $('.place_list .place_content:nth-child(' + idx + ')').removeClass('on');
                    }
                })
            }
        }
    }
</script>


<!-- 지도[e] -->

<!-- 검색 자동완성 -->
<script>
$(document).ready(function() {
	
	$("#search").autocomplete({
		
		source : function(request, response) {
			$.ajax({
				url : '<c:url value="/autocomplete/pilates"/>',
				type : "post",
				dataType : "json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				data : { term: request.term },
				success : function(data) {
					response(
						$.map(data, function(item){
							var idx = item.placeidx;
							return {
								label:item.placename,
								value:item.placename,
								idx : item.placeidx
							}
						})
					)
					
				},
				error : function(data) {
					alert("에러가 발생하였습니다.")
				}
			});
		},
		select: function(event, ui, item, response) {
			var placeidx = ui.item.idx;
			$.ajax({
				url : '<c:url value="/place/detail"/>',
				type : "get",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				data : {placeidx:placeidx},
				success : function(data) {
					location.href = '<c:url value="/place/detail"/>?placeidx=' + placeidx;
				},
				error : function(data) {
					alert("에러가 발생하였습니다.")
				}
			});
            
        },
        focus: function(event, ui) {
            return false;
        }
	}).autocomplete('instance')._renderItem = function(ul, item) {
		
		<c:set var="placeSearchDetail" value="${placeSearchDetail}"/>
		
        return $('<li>') //기본 tag가 li
        .append('<a href="/gym/place/detail?placeidx=' + item.idx + '">' + item.value + '</a>') // a태그 추가
        .appendTo(ul);
    };   
});
</script>


<!-- footer -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>