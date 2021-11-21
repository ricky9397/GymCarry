<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="modify.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="js/index.js"></script>

<title>회원_내 정보 수정</title>
<script src="js/includeHTML.js"></script>
<script src="js/includeRouter.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>



	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">

				<form action="<c:url value=""/>" method="post">
					<h1 class="sub_tit_txt">회원 정보 수정</h1>
					<div class="edit_form">
						<div class="profile_form">
							<img src="/images/icon/profile.png"><br> <a
								href="<input type="  name="carryphoto">">프로필 사진 수정</a>
						</div>

						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>이름</span></th>
									<td><input type="text" id="name" placeholder="회원 이름(db)"
										disabled></td>
								</tr>
								<tr>
									<th><span>이메일 주소 </span></th>
									<td><input type="text" id="email" placeholder="이메일 주소(db)"
										disabled></td>
								</tr>
								<tr>
									<th><span>비밀번호</span></th>
									<td><input type="text" id="pw"></td>
								</tr>

								<tr>
									<th><span>비밀번호 확인</span></th>
									<td><input type="text" id="repw"></td>
								</tr>

								<tr>
									<th><span>닉네임</span></th>
									<td><input type="text" id="nickname"></td>
								</tr>

								<tr>
									<th><span>핸드폰 번호 </span></th>
									<td><input type="text" id="phonenum"></td>
								</tr>

								<tr>
									<th><span>생년월일</span></th>
									<td><input type="text" id="birth"></td>
								</tr>

								<tr>
									<th><span>성별</span></th>
									<td>
										<div class="selectbox">
											<input type="radio" name="choice" value="남자"> 남자 <input
												type="radio" name="choice" value="여자"> 여자
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- edit_form E  -->
					<div id="btnbox">
						<div class="btn_wrap">
							<a href="javascript:;">수정 완료</a>
						</div>
						<div class="btn_wrap2">
							<a href="javascript:;">취소</a>
						</div>
					</div>
				</form>
			</div>
			<!-- form_txtInput E -->
		</div>
		<!-- content E-->
	</div>
	<!-- container E -->

	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>
</html>