<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>회원 관리 : GymCarry Admin</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

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
			<h1 class="mt-4">회원 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">사용자 관리</li>
				<li class="breadcrumb-item active">회원 관리</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">GymCarry의 회원들을 관리하는 페이지입니다.</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 회원 리스트
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
								<th>생년월일</th>
								<th class="setting">관리</th>
							</tr>
						</thead>

						
						<tbody>
						<c:forEach items="${memList}" var="memList">
							<tr>
								<td>${memList.memidx}</td>
								<td>${memList.mememail}</td>
								<td>${memList.memnick}</td>
								<td>${memList.memname}</td>
								<td>${memList.memgender}</td>
								<td>${memList.memphone}</td>
								<td>${memList.membirth}</td>
								<td class="setting_delete"><a href="javascript:delMember(${memList.memidx})">삭제</a></td>
								<%-- <td class="setting"><a href="deleteMember?memidx=${memList.memidx}">삭제</a></td> --%>
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
		function delMember(memidx) {
			if (confirm ('해당 회원을 탈퇴 처리 하시겠습니까?')) {
				location.href = "deleteMember?memidx=" + memidx;
				alert('삭제가 정상적으로 완료되었습니다.');
				location.reload();
				/* location.href = "member"; */
			}
		}
		</script>
				
		
		
	</div>
			
</body>
</html>	