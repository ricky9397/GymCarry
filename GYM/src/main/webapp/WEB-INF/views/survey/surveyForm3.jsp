<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>당신과 어울리는 캐리는?</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/survey/survey.css">
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<div id="survey_wrap">
		<div class="survey_box">
			<div class="formstyle">
				<div class="survey_box2">
					<div class="survey_h1">
						<div class="survey_page">
							<p>
								<span>03</span> / 05
							</p>
						</div>
						<h1>선호하는 캐리 성별</h1>
					</div>
					<form action="<c:url value='/survey/survey4'/>" method="post">
					<div class="survey_ul">
						<ul>
							<li><label class="box-radio-input"> <input
									type="radio" name="sv3" value = "남자" checked="checked"> <span>남자</span></label>
							</li>
							<li><label class="box-radio-input"> <input
									type="radio" name="sv3" value = "여자"> <span>여자</span></label>
							</li>
						</ul>
						<div class="next_btn">
							<a href="javascript:window.history.back();">이전</a>
							<input type="submit" value="다음">
						</div>
					</div>
					<input type="hidden" value="${sv1}" name="sv1">
					<input type="hidden" value="${sv2}" name="sv2">
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>