<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GymCarry : 짐캐리</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/admin/content.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<!-- Content 시작 -->
	<div class="allWrap">
		<div class="title">
			<h1>${content.title}</h1>
			<p>${content.date}</p>
		</div>

		<div class="content_textarea">
		<span>
			<textarea rows="30" readonly><c:out value="${content.content}" /></textarea>
		</span>
		</div>
		<div class="prevBtn">
		<c:set var="category" value="${content.category}"/>
			<c:if test="${category eq '약관 및 정책'}">
				<input type="button" value= "< 목록으로" onclick="location.href='<c:url value="/content/termlist"/>'">
			</c:if>
			<c:if test="${category eq '공지사항'}">
				<input type="button" value= "< 목록으로" onclick="location.href='javascript:window.history.back();'">
			</c:if>
		</div>

	</div>


	<!-- Content 끝 -->


	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>
</html>