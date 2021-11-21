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
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	
	<!-- Contents -->
  <div class="content_main">
  <div class="content_wrap">
    <div class="content">
    <h1 class="match_title">당신과 함께할 캐리를 소개합니다 !</h1>
    <div class="re_survey">
    	<a href="<c:url value="/survey/survey"/>">다른 매칭을 원하신다면?</a>
    </div>
<!--      <nav class="top">
  	 	<div class="sort">
          	<span>인기순 / 가격순</span>
     	</div>
      </nav> -->
      <div class="card_main">
      <c:forEach items="${matchingList}" var="mlist">
        <div class="card">
          <div class="board_sidebar">
         	 <div class="crphoto">
	          	<c:if test="${empty mlist.crbfphoto}">
		            <img class="profile_image">
	          	</c:if>
	          	<c:if test="${!empty mlist.crbfphoto}">
		            <img class="profile_image" src="<c:url value="/uploadfile/${mlist.crbfphoto}"/>" />
	          	</c:if>
          	</div>
			<input type="hidden" value="${sv1}" name="sv1">
			<input type="hidden" value="${sv4}" name="sv4">
          </div>
          <div class="board_main">
            <div class="place_badge" onclick="location.href='<c:url value="/place/detail?placeidx=${mlist.placeidx}"/>'">${mlist.placename}</div>
            <div class="carry_price">
              <span>수업 1회 이용권</span>
              <h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${mlist.proprice}"/>원</h3>
            </div>
            <div class="nickname">
              <span>${mlist.crnick}</span>
            </div>
            <div class="btnflex">
              <div class="certi">
                <span class="certifi">경력사항</span>
                <%-- <span class="pt_nopt2"><img src="<c:url value="/images/icon/movie.png"/>">비대면PT 가능</span> --%>
                <ul>
                  <li>${mlist.crcerti1}</li>
                  <li>${mlist.crcerti2}</li>
                  <li>${mlist.crcerti3}</li>
                </ul>
              </div>
              <div class="bottom_btn">
                <ul class="board_btn">
                <c:if test="${loginSession.memidx ne 0}">
                  <li>
                  	<input type="button" value="1:1 문의" class="inquiry_btn"
                  	onclick="location.href='<c:url value="/chatting/chatInquire?cridx=${mlist.cridx}&memidx=${loginSession.memidx}"/>'">
                  </li>
                  </c:if>
                  <li>
                    <input type="button" value="더 알아보기" class="detail_btn"
                    onclick="location.href='<c:url value = "/carry/detail?cridx=${mlist.cridx}"/>'">
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