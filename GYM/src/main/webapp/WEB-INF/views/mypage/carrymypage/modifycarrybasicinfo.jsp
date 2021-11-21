<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>GYM CARRY : 기본 정보 수정</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

<link rel="stylesheet" href="/gym/css/style.css">
<link rel="stylesheet" href="/gym/css/mypage/modify.css">

<title>캐리_내 정보 수정</title>

</head>

<body>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>


<div class="wrap wd668">
	<div class="container">
		<div class="form_txtInput">

			<form method="post" enctype="multipart/form-data">
				<h1 class="sub_tit_txt">캐리 기본정보 수정</h1>
				<div class="edit_form">
					<div class="profile_form">
						<div class="profile_photo">
							<img src="<c:url value="/uploadfile/${carry.crphoto}"/>">
						</div>
						<input type="button" value="사진업로드" class="profilebtn" name="crphoto"
							   onclick=document.all.file.click();> <input type="file"
																		  name="crphoto" id="file" class="profilebtn" style="display: none;" />
					</div>

					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
						<tr>
							<th><span>이름</span></th>
							<td><input type="text" id="name" name="crname" value="${carry.crname}"
									   readonly></td>
						</tr>
						<tr>
							<th><span>이메일 주소 </span></th>
							<td><input type="text" id="email" name="cremail" value="${carry.cremail}"
									   readonly></td>
						</tr>
						<tr>
							<th><span>비밀번호</span></th>
							<td><input type="password" id="pw" name="crpw" value=""required></td>
						</tr>
						<tr>
							<td></td>
							<td class="check"><div class="check_font" id="pwcheck"></div></td>
						</tr>

						<tr>
							<th><span>비밀번호 확인</span></th>
							<td><input type="password" id="repw" value="" required></td>
						</tr>
						<tr>
							<td></td>
							<td class="check"><div class="check_font" id="repwcheck"></div></td>
						</tr>

						<tr>
							<th><span>닉네임</span></th>
							<td><input type="text" id="nickname" name="crnick" value="${carry.crnick}" required></td>
						</tr>
						<tr>
							<td></td>
							<td class="check"><div class="check_font" id="nickcheck"></div></td>
						</tr>

						<tr>
							<th><span>핸드폰 번호 </span></th>
							<td><input type="text" id="phonenum" name="crphone" value="${carry.crphone}" required></td>
							<td class="check"><div class="check_font" id="phonecheck"></div></td>
						</tr>

						<tr>
							<th><span>성별</span></th>
							<td>
								<div class="selectbox">
									<c:if test="${carry.crgender eq '남자'}">
										<label for="male">
											<input type="radio" name="crgender" value="남자" id="male" checked> 남자
										</label>
										<label for="female">
											<input type="radio" name="crgender" id="female" value="여자"> 여자
										</label>	
									</c:if>
									<c:if test="${carry.crgender eq '여자'}">
										<label for="male">
											<input type="radio" name="crgender" value="남자" id="male"> 남자
										</label>
										<label for="female">
											<input type="radio" name="crgender" value="여자"checked id="female"> 여자
										</label>
									</c:if>
								</div>
							</td>
						</tr>
						</tbody>
						<input type="hidden" name="cridx" id="cridx" value="${carry.cridx}">
						<input type="hidden" name="oldcrphoto" value="${carry.crphoto}">
					</table>
				</div>
				<!-- edit_form E  -->
				<div id="btnbox">
					<div class="btn_wrap">
						<input type="submit" value="수정 완료">
					</div>
					<div class="btn_wrap2">
						<a href="javascript:window.history.back();">취소</a>
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

<script>
	//등록 이미지 등록 미리보기
	function readInputFile(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('.profile_photo').html("<img src="+ e.target.result +">");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(".profilebtn").on('change', function(){
		readInputFile(this);
	});


	// 비밀번호
	console.log('비번 도달');
	// 비밀번호 정규식 : 영어 대소문자, 숫자로 4~15글자 이내
	var pwJ = /^[A-Za-z0-9]{4,15}$/;
	$("#pw").focusout(function() {
		if (pwJ.test($('#pw').val())) {
			console.log(pwJ.test($('#pw').val()));
			$("#pwcheck").text('');
		} else {
			$('#pwcheck').text('영어 대, 소문자, 숫자로  4~15글자로 작성해주세요 .');
			$('#pwcheck').css('color', 'red');
		}
		error : console.log('비밀번호 실패');
	});

	// 비밀번호 확인
	$("#repw").focusout(function() {
		if ($('#repw').val() != $('#pw').val()) {
			console.log($('#repw').val(),$('#pw').val());
			$("#repwcheck").text('비밀번호가 다릅니다. 다시 입력해주세요.');
			$('#repwcheck').css('color', 'red');
		} else {
			$('#pwcheck').text('');
		}
		error : console.log('비밀번호 확인 실패');
	});

	// 휴대폰 번호
	// 휴대폰 번호 정규식 : 010(필수)+ 숫자로만 8글자
	var phoneJ = /^010([0-9]{8})$/;
	$('#phonenum').focusout(function(){
		if(phoneJ.test($('#phonenum').val())){
			console.log(phoneJ.test($('#phonenum').val()));
			$("#phonecheck").text('');
		} else {
			$('#phonecheck').text('휴대폰번호를 확인해주세요.');
			$('#phonecheck').css('color', 'red');
		}
		error : console.log('휴대폰 번호 실패');
	});

	var nickJ = /^[가-힣a-zA-Z]{2,6}$/;
	$("#nickname").focusout(function() {
		if (nickJ.test($('#nickname').val())) {
			console.log(nickJ.test($('#nickname').val()));
			$("#nickcheck").text('');
			// 닉네임이맞으면 ajax 실행
			$.ajax({
				type : 'POST',
				url : '<c:url value="/carry/nickCheck"/>',
				data : {
					crnick : $(this).val()
				},
				success : function(data) {
					if(data == 0){
						$('#msg_nick').html('사용가능');
						$('#msg_nick').addClass('color_blue');
						$('#msg_nick').removeClass('display_none');
					} else {
						$('#msg_nick').html('사용 불가능');
						$('#msg_nick').addClass('color_red');
						$('#msg_nick').removeClass('display_none');
						$('#memnick').val('');
					}

				}
			});

		} else {
			$('#nickcheck').text('2~6글자의 한글, 영어만 사용 가능합니다.');
			$('#nickcheck').css('color', 'red');
		}
		error : console.log('닉 실패');
	});
</Script>