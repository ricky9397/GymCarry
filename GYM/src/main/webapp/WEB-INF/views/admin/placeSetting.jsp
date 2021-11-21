<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>플레이스 관리 : GymCarry Admin</title>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>

<script src="/gym/js/scripts.js"></script>
<script src="/gym/js/datatables-simple-demo.js"></script>

<%@ include file="/WEB-INF/views/frame/metaheader_admin.jsp"%>
<link rel="stylesheet" href="/gym/css/admin/adminStyle.css">

<body class="sb-nav-fixed">

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header_admin.jsp"%>
	<!-- sidebar -->
	<%@ include file="/WEB-INF/views/frame/sidebar_admin.jsp"%>



	<!-- 컨텐츠 시작 -->
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">플레이스 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">컨텐츠 관리</li>
				<li class="breadcrumb-item active"><a
					href="<c:url value="/admin/place"/>">플레이스 관리</a></li>
				<li class="breadcrumb-item active">수정/삭제</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					짐캐리에 등록된 플레이스를 관리하는 페이지입니다.
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 플레이스 리스트
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>IDX</th>
								<th>구분</th>
								<th>이름</th>
								<th>주소</th>
								<th>전화번호</th>
								<th class="setting">관리</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${placeList}" var="placeList">
								<tr>
									<td>${placeList.placeidx}</td>

								<c:set var="num" value="${placeList.placenum}" />
								<c:if test="${num == 1}">
										<td>헬스</td>
								</c:if>
								<c:if test="${num == 2}">
										<td>필라테스</td>
								</c:if>
								<c:if test="${num == 3}">
										<td>요가</td>
								</c:if>
									<%-- <td>${placeList.placenum}</td> --%>
									
									<td>${placeList.placename}</td>
									<td>${placeList.placeaddress}</td>
									<td>${placeList.placephone}</td>
									<%--  <a href="deleteMember?memidx=${memList.memidx}"> --%>
									<td class="setting_delete"><a
										href="place/modifyForm?placeidx=${placeList.placeidx}">수정
									</a> | <a href="javascript:delPlace(${placeList.placeidx})"> 삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- footer -->
		<%@ include file="/WEB-INF/views/frame/footer_admin.jsp"%>

	</div>

		<script>
			function delPlace(placeidx) {
				if (confirm('해당 플레이스를 삭제 처리 하시겠습니까?')) {
					location.href = "deletePlace?placeidx=" + placeidx;
					alert('삭제가 정상적으로 완료되었습니다.');
					location.href = "place";
				}
			}
		</script>

</body>
</html>
