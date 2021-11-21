<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>캐리 회원가입</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/joinlogin/regform.css">

</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<!-- Contents -->
	<div class="wrap wd668">
		<div class="container">
			<form method="post" action="<c:url value="/carry/join"/>"
				enctype="multipart/form-data" onsubmit="return joinsubmit();">
				<%-- <form action="<c:url value="/member/carryJoin"/>" method="post"
					enctype="multipart/form-data"> --%>
				<div class="form_txtInput">
					<h1 class="sub_tit_txt">캐리 회원가입</h1>
					<p class="exTxt">회원가입시 이메일 인증을 반드시 진행하셔야 합니다.</p>
				</div>

				<div class="join_form">
					<div class="profile_form">
						<div class="profileimg" id="image_container">
							<img src="/gym/images/icon/profile2.png"><br>
						</div>
						<input type="button" value="사진업로드" class="profilebtn" name="crphoto"
							onclick=document.all.file.click();> <input type="file"
							name="crphoto" id="file" class="profilebtn"
							style="display: none;" />
					</div>
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<th><span>이름</span></th>
								<td><input type="text" name="crname" placeholder="이름"
									id="crname">
									<div class="check_font" id="namecheck"></div></td>

							</tr>

							<tr class="email">
								<th><span>이메일</span></th>
								<td><input type="text" class="email" name="cremail"
									id="cremail" placeholder="이메일 형식으로 입력해주세요. 로그인시 아이디로 사용됩니다.">
									<!-- <a href="javascript:;" class="btn_confirm">인증메일 발송</a> -->
									<span id="msg" class="display_none"></span>
									<div class="check_font" id="emailcheck" style="float: left"></div>
								</td>
							</tr>

							<tr>
								<th><span>비밀번호</span></th>
								<td><input type="password" name="crpw" id="crpw"
									placeholder="비밀번호를 입력해주세요.">
									<div class="check_font" id="pwcheck"></div>
									<div class="check_font" id="mempw2check"></div></td>

							</tr>
							<tr>
								<th><span>비밀번호 확인</span></th>
								<td><input type="password" name="crpw2"
									placeholder="비밀번호를 확인해주세요." id="crpw2"></td>
							</tr>

							<tr>
								<th><span>닉네임</span></th>
								<td><input type="text" name="crnick" placeholder="닉네임"
									id="crnick"> <span id="msg_nick" class="display_none"></span>
									<div class="check_font" id="nickcheck"></div></td>
							</tr>

							<tr>
								<th><span>휴대폰 번호</span></th>
								<td><input type="text" name="crphone" id="crphone"
									placeholder="'-'없이 번호만 11자리 형식으로 입력해주세요">
									<span id="msg_phone" class="display_none"></span>
									<div class="check_font" id="phonecheck"></div></td>
							</tr>
							<tr>
								<th><span>성별</span></th>
								<td>
									<div class="selectbox">
										<input type="radio" name="crgender" value="남자" id="male">
										남자 <input type="radio" name="crgender" value="여자" id="female">
										여자
									</div>
									<div class="check_font" id="gendercheck"></div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="exform_txt">
						<span>필수 입력사항</span>
					</div>
				</div>
				<!-- join_form E  -->


				<div id="btnbox">
					<div class="btn_wrap">
						<!-- 회원가입 -> DB 저장 // 취소 -> 취소되었습니다! 알림 후 index 수정하기 -->
						<input type="submit" id="joinsubmit" value="회원가입">
					</div>
					<div class="btn_wrap2">
						<a href="javascript:history.back()">취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Contents end -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>

<script>
	
	//등록 이미지 등록 미리보기
	function readInputFile(input) {
	    if(input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#image_container').html("<img src="+ e.target.result +">");
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	 
	$(".profilebtn").on('change', function(){
	    readInputFile(this);
	});
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;

	// 이름, 이메일, 비밀번호, 비밀번호 확인, 닉네임, 휴대폰 번호, 생일, 성별 순
	
	// 이름에 특수문자 들어가지 않도록 설정
	// 이름 정규식 : 영어, 한글로만 2~6글자 이내 
	var nameJ = /^[가-힣a-zA-Z]{2,6}$/;
	$("#crname").focusout(function() {
		if (nameJ.test($('#crname').val())) {
				console.log(nameJ.test($('#crname').val()));
				$("#namecheck").text('');
		} else {
			$('#namecheck').text('2~6글자의 한글, 영어만 사용 가능합니다.');
			$('#namecheck').css('color', 'red');
		}
		error : console.log('이름 실패');
	});
	
	// 이메일 -> DB다녀와야함 
	console.log('이메일 도달');
	// 이메일 검사 정규식 : 이메일 형식(ㅇㅇㅇ@ㅇㅇㅇ.ㅇㅇ)
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	$("#cremail").focusout(function() {
		if (mailJ.test($('#cremail').val())) {
				console.log(mailJ.test($('#cremail').val()));
				$("#emailcheck").text('');
		// 이메일 이맞으면 ajax 실행		
		$.ajax({
			type : 'POST',
			url : '<c:url value="/carry/emailCheck"/>',
			data : { 
				cremail : $(this).val()
			},
			success : function(data) {
				if(data == 0){
					$('#msg').html('사용가능');
					$('#msg').addClass('color_blue');
					$('#msg').removeClass('display_none');
				} else {
					$('#msg').html('사용 불가능');
					$('#msg').addClass('color_red');
					$('#msg').removeClass('display_none');
					$('#mememail').val('');
				}
			}
		});
				
		} else {
			$('#emailcheck').text('이메일 형식으로 입력해주세요.');
			$('#emailcheck').css('color', 'red');
		}
		error : console.log('이메일 실패');
	});
	
	
	// 비밀번호 
	console.log('비번 도달');
	// 비밀번호 정규식 : 영어 대소문자, 숫자로 4~15글자 이내 
	var pwJ = /^[A-Za-z0-9]{4,15}$/;
	$("#crpw").focusout(function() {
		if (pwJ.test($('#crpw').val())) {
				console.log(pwJ.test($('#crpw').val()));
				$("#pwcheck").text('');
		} else {
			$('#pwcheck').text('영어 대, 소문자, 숫자로  4~15글자로 작성해주세요 .');
			$('#pwcheck').css('color', 'red');
		}
		error : console.log('비밀번호 실패');
	});
	
	// 비밀번호 확인 
	$("#crpw2").focusout(function() {
		if ($('#crpw2').val() != $('#crpw').val()) {
				console.log($('#crpw2').val(),$('#crpw').val());
				$("#pwcheck").text('비밀번호가 다릅니다. 다시 입력해주세요.');
				$('#pwcheck').css('color', 'red');
		} else {
			$('#pwcheck').text('');
		} 
		error : console.log('비밀번호 확인 실패');
	});
	
	// 휴대폰 번호
	// 휴대폰 번호 정규식 : 010(필수)+ 숫자로만 8글자
	var phoneJ = /^010([0-9]{8})$/;
	$('#crphone').focusout(function(){
		if(phoneJ.test($('#crphone').val())){
			console.log(phoneJ.test($('#crphone').val()));
			$("#phonecheck").text('');
			// 번호가 맞으면 ajax 실행
			$.ajax({
				type : 'POST',
				url : '<c:url value="/carry/phoneCheck"/>',
				data : { 
					crphone : $(this).val()
				},
				success : function(data) {
					if(data == 0){
						$('#msg_phone').html('사용가능');
						$('#msg_phone').addClass('color_blue');
						$('#msg_phone').removeClass('display_none');
					} else {
						$('#msg_phone').html('사용 불가능');
						$('#msg_phone').addClass('color_red');
						$('#msg_phone').removeClass('display_none');
						$('#crphone').val('');
					}
				}
			});
			
		} else {
			$('#phonecheck').text('휴대폰번호를 확인해주세요.');
			$('#phonecheck').css('color', 'red');
		}
		error : console.log('휴대폰 번호 실패');
	});
	
	// 성별 
	$(document).ready(function(){
		$('#gendercheck').focusout(function(){
			invalidItem();
		});
		function invalidItem(){
			if($("input[name=memgender]:radio:checked").length < 1){
				$('#gendercheck').text('성별을 선택해주세요.');
				$('#gendercheck').css('color', 'red');  
			} else {
				$('#gendercheck').text('');
			}
		}
	});

	var nickJ = /^[가-힣a-zA-Z]{2,6}$/;
	$("#crnick").focusout(function() {
		if (nickJ.test($('#crnick').val())) {
				console.log(nickJ.test($('#crnick').val()));
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
							$('#crnick').val('');
						}
						
					}
				});
				
		} else {
			$('#nickcheck').text('2~6글자의 한글, 영어만 사용 가능합니다.');
			$('#nickcheck').css('color', 'red');
		}
		error : console.log('닉 실패');
	});	
		
</script>
<!-- alert('입력해주신 이메일로 인증 메일이 발송되었습니다. 이메일 인증을 완료해주세요.') -->

<!-- 회원가입 이메일,닉네임,핸드폰 중복체크 ajax -->
<script>
$('#cremail, #crnick, #crphone').focusin(function() {
	$('#msg').addClass('display_none');
	$('#msg').removeClass('color_blue');
	$('#msg').removeClass('color_red');
	$('#msg').val('');
	$('#msg_nick').addClass('display_none');
	$('#msg_nick').removeClass('color_blue');
	$('#msg_nick').removeClass('color_red');
	//$('#crnick').val('');
	$('#msg_phone').addClass('display_none');
	$('#msg_phone').removeClass('color_blue');
	$('#msg_phone').removeClass('color_red');
});
	
</script>



</html>





