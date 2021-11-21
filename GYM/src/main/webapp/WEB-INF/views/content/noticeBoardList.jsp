<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GymCarry : 공지사항</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/admin/content.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<!-- Content 시작 -->
	
	
	<div id="layoutSidenav_content">
		<div class="allWrap">
			<div class="content">
				<div class="container">
					<h2 class="mb-5">공지사항</h2>

					<div class="table-responsive">

						<table class="table table-striped custom-table">
							<thead>
								<tr>
									<th scope="col" class="jb-th-1">제목</th>
									<th>작성일</th>
								</tr>
							</thead>

							<tbody>
							<c:forEach items="${noticeList}" var="list">
								
								<tr scope="row" onclick="location.href='<c:url value="/content?idx=${list.idx}"/>'">
									<td>
										<a>${list.title}</a>
									</td>
									
									<c:set var="date" value="${list.date}"/>
									<c:set var="onlydate" value="${fn:substring(date, 0, 10)}" />
									<td class= "center">${onlydate}</td>
								</tr>
								
							</c:forEach>
							</tbody>
							
						</table>
					</div>


				</div>

			</div>
	</div>
	
	

			<script src="/gym/js/admin/jquery-3.3.1.min.js"></script>
			<script src="/gym/js/admin/popper.min.js"></script>
			<script src="/gym/js/admin/bootstrap.min.js"></script>
			<script src="/gym/js/admin/main.js"></script>
	
	
	
	<!-- Content 끝 -->


	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>
</html>