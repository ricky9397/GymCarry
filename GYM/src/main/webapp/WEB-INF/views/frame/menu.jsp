<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="logo">
	<a href="index.do">GymCarry</a>
</div>
<nav class="nav">
	<ul>
		<li><a href="<c:url value="/about"/>">ABOUT</a></li>
		<li><a href="<c:url value="/carry/allList"/>">1:1MATCHING</a></li>
		<li><a href="<c:url value="/place/all"/>">PLACE</a></li>
		<li><a href="<c:url value="/community/boardList"/>">COMMUNITY</a></li>
		<c:choose>
			<c:when test="${empty loginSession}">
				<li><a href="<c:url value="/member/login"/>">MY BODY</a></li>
			</c:when>
			<%-- <c:when test="${loginSession.cridx ne 0}">
				<li><a href="<c:url value="/mypage/carrymypage"/>">MY PAGE</a></li>
			</c:when> --%>
			<c:when test="${loginSession.memIdx ne 0}">
				<li><a href="<c:url value="/mypage/mypage"/>">MY BODY</a></li>
			</c:when>
			</c:choose>
		</ul>
</nav>
<div class="sub_nav">
	<div class="chatting">
		<a href="<c:url value="/chatting/chatList"/>"> <img
			src="<c:url value="/images/icon/chatting_icon.png"/>" alt="chatting">
		</a>
	</div>
	<c:if test="${loginSession eq null}">
		<a href="<c:url value="/member/login"/>" class="login"> LOGIN </a>
	</c:if>
	<c:if test="${loginSession ne null}">
		<a href="<c:url value="/member/logOut"/>" class="login" onclick="kakaoLogout(); signOut();"> LOGOUT </a>
	</c:if>
</div>