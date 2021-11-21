<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>캐리 아이디 찾기 결과</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/joinlogin/find.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='/gym/carry/login';
		})
	})
</script>
</head>
<body>


	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<!-- 은경 -->

	<!-- Contents -->
	<!-- 혹시 윗간격 이상하면 container div 지우기 -->
	<div class="wrap wd668">
		<div class="container">
			<ul class="tab">
				<li class="active"><a class="sub_tit_txt"
					href="<c:url value="/find/findcarryid"/>">캐리 아이디 찾기</a></li>
				<li><a class="sub_tit_txt"
					href="<c:url value="/find/findcarrypassword"/>">캐리 비밀번호 찾기</a></li>
			</ul>

				<div class="form_txtInput">
					<div class="findview">
						<h2>캐리 아이디 찾기 검색결과</h2>
						<div id="findview">
							<h4>가입하신 이메일은  ${cremail} 입니다.</h4>
						</div>
						<div id="btnbox">
							<div class="btn_wrap">
								<button type="button" id="loginBtn" value="로그인">로그인</button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>



	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	</body>
	</html>