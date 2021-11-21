<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>커뮤니티 관리 : GymCarry Admin</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

<script src="/gym/js/scripts.js"></script>
<script src="/gym/js/datatables-simple-demo.js"></script>

<%@ include file="/WEB-INF/views/frame/metaheader_admin.jsp"%>
<link rel="stylesheet" href="/gym/css/admin/adminStyle.css">


<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" href="/gym/fonts/icomoon/style.css"> -->
<link rel="stylesheet" href="/gym/css/admin/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/gym/css/admin/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="/gym/css/admin/adminBoardStyle.css">


    <body class="sb-nav-fixed">

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header_admin.jsp"%>
	<!-- sidebar -->
	<%@ include file="/WEB-INF/views/frame/sidebar_admin.jsp"%>



	<!-- 컨텐츠 시작 -->
	<div id="layoutSidenav_content">
		
			<div class="content">
				<div class="container">
					<h2 class="mb-5">커뮤니티 관리</h2>
					
					<div class="table-responsive">

						<table class="table table-striped custom-table">
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">카테고리</th>
									<th scope="col">작성자</th>
									<th scope="col">제목 / 내용</th>
									<th scope="col">작성일</th>
									<th scope="col">more</th>
								</tr>
							</thead>

							<tbody>
							
							<c:forEach items="${CommunityList}" var="list">

								<tr scope="row">
									<td>${list.postidx}</td>
									<td>${list.boardcategory}</td>
									<td>${list.postnick}</td>
									<td>
										<a href="<c:url value="/community/postContent?postidx=${list.postidx}"/>" class="text-over-cut">${list.postname}</a>
										<small class="d-block text-over-cut content-style">${list.postcontent}</small>
									</td>
									
									<c:set var="date" value="${list.postdate}"/>
									<c:set var="onlydate" value="${fn:substring(date, 0, 10)}" />
									<td>${onlydate}</td>
									
									<td><a href="<c:url value="/community/postContent?postidx=${list.postidx}"/>" class="more">Details</a>
									<br>
									<span onClick="communityDel('${list.postidx}')"class="delete">삭제</span>
									</td>

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
			function communityDel(postidx) {
				if (confirm ('해당 게시글을 삭제 처리 하시겠습니까?')) {
					location.href = "delete?postidx=" + postidx;
					alert('삭제가 정상적으로 완료되었습니다.');
					location.href = 'list';
				} 
			}
			</script>

		
	
			<script src="/gym/js/admin/jquery-3.3.1.min.js"></script>
			<script src="/gym/js/admin/popper.min.js"></script>
			<script src="/gym/js/admin/bootstrap.min.js"></script>
			<script src="/gym/js/admin/main.js"></script>

</body>
</html>	