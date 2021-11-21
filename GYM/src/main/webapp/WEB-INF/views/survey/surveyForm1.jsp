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
								<span>01</span> / 05
							</p>
						</div>
						<h1>원하는 운동 종목이 무엇인가요?</h1>
					</div>
					<form action="<c:url value='/survey/survey2'/>" method="post">
					<div class="survey_ul">
						<ul>
							<li><label class="box-radio-input"> <input
									type="radio" name="sv1" value = "헬스" checked="checked"><span>헬스</span></label>
							</li>
							<li><label class="box-radio-input"> <input
									type="radio" name="sv1" value = "필라테스"><span>필라테스</span></label>
							</li>
							<li><label class="box-radio-input"> <input
									type="radio" name="sv1" value = "요가"><span>요가</span></label>
							</li>
						</ul>
						<div class="next_btn">
							<input type="submit" value="다음" onclick="check()">
						</div>
					</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>