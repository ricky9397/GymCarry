<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<title>관리자 게시판 작성 : GymCarry Admin</title>

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

<link rel="stylesheet" href="/gym/css/admin/adminBoardWrite.css">


    <body class="sb-nav-fixed">

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header_admin.jsp"%>
	<!-- sidebar -->
	<%@ include file="/WEB-INF/views/frame/sidebar_admin.jsp"%>


	<!-- 컨텐츠 시작 -->
	<div id="layoutSidenav_content">

		<div class="content">
			<div class="container">
				<h2 class="mb-5">관리자 게시판 : 작성</h2>


				<div class="board_write">
					<form method="post" id="adminBoardForm" name="adminBoardForm">
						<div class="write_form">
							<div class="category">
								<span class="left">CATEGORY</span>
								<select class="category_info" name="category">
									<option value="공지사항">공지사항</option>
									<option value="약관 및 정책">약관 및 정책</option>
								</select>
							</div>
							
							<div class="name">
								<span class="left">작성자</span>
								<span class="name_info">
								<input type="text" value="${adminLoginSession.adminid}" readonly class="admin"></span>
								<input type="hidden" value="${adminLoginSession.adminidx}" name="adminidx">
							</div>
							
							<div class="title">
								<span class="left">제목</span>
								<span>
									<input type="text" name="title" placeholder="제목을 입력하세요." required>
								</span>
							</div>
						
							<div class="content">
								<span class="left">내용</span>
								<span class="editor">
									<textarea class="form-control" cols="20" placeholder="내용을 입력하세요." name="content" id="postcontent" wrap="hard"></textarea>
								</span>
							</div>
							
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="now"/>
							<input type ="hidden" name="date" value="${now}">
							
						</div>
						<div class="btn">
							<input type="button" class="completeBtn" onclick="adminBoardWrite('${result.code}')" value="작성 완료">
							<input type="button" class="cancelBtn" onclick="location.href='javascript:window.history.back();'" value="취소">
						</div>
						
					</form>

				</div>

			</div>

		</div>

		
		<script>
			
			function adminBoardWrite(code) {

				$.ajax({
					type : 'POST',
					url : "<c:url value='/admin/board/write'/>",
					data : $("#adminBoardForm").serialize(),
					success : function() {
						alert('관리자 게시글 작성이 완료되었습니다.');
						location.href = "/gym/admin/board/list";
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}

				});
			}
			
		</script>


		<!-- footer -->
		<%@ include file="/WEB-INF/views/frame/footer_admin.jsp"%>
	
	</div>
		
		<script src="/gym/js/adminjquery-3.3.1.min.js"></script>
		<script src="/gym/js/admin/popper.min.js"></script>
		<script src="/gym/js/adminbootstrap.min.js"></script>
		<script src="/gym/js/admin/main.js"></script>
</body>
</html>	
