<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>캐리 관리 : GymCarry Admin</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

<script src="/gym/js/scripts.js"></script>
<script src="/gym/js/datatables-simple-demo.js"></script>
<script src="/gym/assets/demo/chart-area-demo.js"></script>
<script src="/gym/assets/demo/chart-bar-demo.js"></script>
        
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
			<h1 class="mt-4">캐리 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">사용자 관리</li>
				<li class="breadcrumb-item active">캐리 관리</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">GymCarry의 캐리들을 관리하는 페이지입니다.</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 캐리 리스트
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>IDX</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>성별</th>
								<th>휴대폰 번호</th>
								<th>소속 플레이스</th>
								<th class="setting">관리</th>
							</tr>
						</thead>

						
						<tbody>
						<c:forEach items="${carryList}" var="carryList">
							<c:set var="placename" value="${carryList.placename}" />

								<c:if test="${empty placename}">
									<tr>
										<td>${carryList.cridx}</td>
										<td>${carryList.cremail}</td>
										<td>${carryList.crnick}</td>
										<td>${carryList.crname}</td>
										<td>${carryList.crgender}</td>
										<td>${carryList.crphone}</td>
										<td>소속되어있는 플레이스가 없습니다.</td>
										<td class="setting_delete"><a
											href="javascript:delCarry(${carryList.cridx})">삭제</a></td>
									</tr>
								</c:if>
								<c:if test="${!empty placename}">
									<tr>
										<td>${carryList.cridx}</td>
										<td>${carryList.cremail}</td>
										<td>${carryList.crnick}</td>
										<td>${carryList.crname}</td>
										<td>${carryList.crgender}</td>
										<td>${carryList.crphone}</td>
										<td>${placename}</td>
										<%-- <td>${carryList.placename}</td> --%>
										<td class="setting_delete"><a
											href="javascript:delCarry(${carryList.cridx})">삭제</a></td>
										<!-- <td class="setting"><a href="#">삭제</a></td> -->
									</tr>
								</c:if>

							</c:forEach>
						</tbody>
						
					</table>
				</div>
			</div>
		</div>

		<script>
		function delCarry(cridx) {
			if (confirm ('해당 캐리를 탈퇴 처리 하시겠습니까?')) {
				location.href = "deleteCarry?cridx=" + cridx;
				alert('삭제가 정상적으로 완료되었습니다.');
				location.reload();
			}
		}
		</script>


		<!-- footer -->
		<%@ include file="/WEB-INF/views/frame/footer_admin.jsp"%>
		
	</div>
			
</body>
</html>	