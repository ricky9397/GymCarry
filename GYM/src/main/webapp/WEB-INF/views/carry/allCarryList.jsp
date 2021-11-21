<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 캐리 리스트</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/carry/carryList.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	
	<!-- Contents -->
  <div class="content_main">
    <div class="content_wrap">
    <div class="content">
	<h1 class="all_title">함께할 캐리를 찾고 싶으신가요?</h1>
	 <nav class="top">
        <ul>
          <li>
            <input type="button" class="match_btn" value="지금 바로 1:1 매칭하러가기" onclick="location.href='<c:url value="/survey/survey"/>'">
          </li>
        </ul>
<%--         <div class="sort">
          <span><a href='<c:url value="/carry/allListP"/>'>가격순</a> / <a href="#">인기순</a></span>
        </div> --%>
      </nav>
      <div class="card_main">
      <c:forEach items="${allList}" var="alist">
        <div class="card">
          <div class="board_sidebar">
         	 <div class="crphoto">
	          	<c:if test="${empty alist.crbfphoto}">
		            <img class="profile_image">
	          	</c:if>
	          	<c:if test="${!empty alist.crbfphoto}">
		            <img class="profile_image" src="<c:url value="/uploadfile/${alist.crbfphoto}"/>" />
	          	</c:if>
          	</div>
			<input type="hidden" value="${sv1}" name="sv1">
			<input type="hidden" value="${sv4}" name="sv4">
          </div>
          <div class="board_main">
            <div class="place_badge" onclick="location.href='<c:url value="/place/detail?placeidx=${alist.placeidx}"/>'">${alist.placename}</div>
            <div class="carry_price">
              <span>수업 1회 이용권</span>
              <h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${alist.proprice}"/>원</h3>
            </div>
            <div class="nickname">
              <span>${alist.crnick}</span>
            </div>
            <div class="btnflex">
              <div class="certi">
                <span class="certifi">경력사항</span>
                <%-- <span class="pt_nopt2"><img src="<c:url value="/images/icon/movie.png"/>">비대면PT 가능</span> --%>
                <ul>
                	<c:if test="${!empty alist.crcerti1}">
                  		<li>${alist.crcerti1}</li>
                  	</c:if>
                  	<c:if test="${!empty alist.crcerti2}">
                 		<li>${alist.crcerti2}</li>
                 	</c:if>
                 	<c:if test="${!empty alist.crcerti3}">
                  		<li>${alist.crcerti3}</li>
                  	</c:if>
                </ul>
              </div>
              <div class="bottom_btn">
                <ul class="board_btn">
                <c:if test="${loginSession.memidx ne 0}">
                  <li>
                  	<input type="button" value="1:1 문의" class="inquiry_btn"
                  	onclick="location.href='<c:url value="/chatting/chatInquire?cridx=${alist.cridx}&memidx=${loginSession.memidx}"/>'">
                  </li>
                  </c:if>
                  <li>
                    <input type="button" value="더 알아보기" class="detail_btn"
                    onclick="location.href='<c:url value = "/carry/detail?cridx=${alist.cridx}"/>'">
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
		</c:forEach>	

      </div>
      </div>
    </div>
  </div>
  <!-- Contents end -->
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	
</body>
</html>