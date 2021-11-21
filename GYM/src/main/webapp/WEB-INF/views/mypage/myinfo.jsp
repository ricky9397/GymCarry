<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Myinfo</title>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<!--제이쿼리 CDN-->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="/gym/css/mypage/bootstrap.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/gym/css/mypage/infoupdate.css">


<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>




	<div class="contents_main">
		<div class="contents">

			<div class="col">

				<form action="<c:url value='/mypage/myinfoUpdate'/>" method="post"
					enctype="multipart/form-data">

					<c:forEach items="${memberList}" var="memberList">

						<input type="hidden" name="memidx" id="memidx"
							value="${memberList.memidx}">


						<div class="my-info profile_form">
							<h1 class="title">내 기본 정보 수정</h1>
							<div class="display_none profileimg" id="image_container">
								<img class="imgc"
									src="<c:url value="/uploadfile/${memberList.memphoto}"/>">
							</div>

							<input type="button" value="사진업로드" class="profilebtn"
								name="memphoto" onclick=document.all.file.click();> <input
								type="file" name="memphoto" id="file" class="profilebtn"
								style="display: none;" />
						</div>

						<c:choose>
							<c:when test="${memberList.memname ne null	}">
								<div class="col-2">
									<div class="col-3">
										<h3>이름</h3>
									</div>
									<div class="col-9" style="float: right;">
										<input value="${memberList.memname}" type="text"
											class="readonly" readonly />
									</div>
								</div>
							</c:when>
						</c:choose>
						<div class="col-2">
							<div class="col-3">
								<h3>이메일 주소</h3>
							</div>
							<div class="col-9" style="float: right;">
								<input name="mememail" id="mememail"
									value="${memberList.mememail}" type="text" class="readonly"
									readonly>
							</div>
						</div>
						<c:choose>
							<c:when test="${memberList.mempw ne null }">
								<div class="col-2">
									<div class="col-3">
										<h3>비밀번호 수정</h3>
									</div>
									<div class="col-9" style="float: right;">
										<input type="password" name="mempw" id="mempw"
											placeholder="비밀번호를 입력해주세요.">
										<div class="check_font" id="pwcheck"></div>

									</div>
								</div>
								<div class="col-2">
									<div class="col-3">
										<h3>비밀번호 수정 확인</h3>
									</div>
									<div class="col-9" style="float: right;">
										<input type="password" name="mempw2" id="mempw2"
											placeholder="비밀번호를 확인해주세요.">
										<div class="check_font" id="mempw2check"></div>

									</div>
								</div>
							</c:when>
						</c:choose>


						<div class="col-2">
							<div class="col-3">
								<h3>닉네임</h3>
							</div>
							<div class="col-9" style="float: right;">
								<input type="text" name="memnick" id="memnick"
									value="${memberList.memnick}" type="text"> <span
									id="msg_nick" class="col-9 display_none"></span>
								<div class="check_font" id="nickcheck"></div>
							</div>
						</div>
						<div class="col-2">
							<div class="col-3">
								<h3>핸드폰 번호</h3>
							</div>
							<div class="col-9" style="float: right;">
								<input type="text" name="memphone" id="memphone"
									value="${memberList.memphone}"> <span id="msg_phone"
									class="display_none"></span>
								<div class="check_font" id="phonecheck"></div>

							</div>
						</div>
						<c:choose>
							<c:when test="${memberList.membirth ne null	}">
								<div class="col-2">
									<div class="col-3">
										<h3>생년월일</h3>
									</div>
									<div class="col-9" style="float: right;">
										<input value="${memberList.membirth}" type="text"
											class="readonly" readonly>
									</div>
								</div>
							</c:when>
						</c:choose>
						<div class="col-2"
							style="margin-top: 7%; width: 100%; display: flex;">
							<div class="col-2" style="width: 50%; margin: auto;">
								<div class="col-2"
									style="width: 50%; /* margin: auto; */ /* padding: 10%; */ float: left;">
									<input value="수정" class="btn on" type="submit" id="reg_submit">
								</div>
								<div class="col-2"
									style="width: 50%; /* margin: auto; */ /* padding: 10%; */ float: right;">
									<a href="javascript:window.history.back();"> <input
										value="취소" class="btn off" type="button" id="reg_submit">
									</a>
								</div>
							</div>
						</div>
						<input type="hidden" name="oldmemphoto"
							value="${memberList.memphoto}">
					</c:forEach>
				</form>
			</div>
		</div>
	</div>

</body>

<footer>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</footer>

<script>
	function readInputFile(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#image_container').html("<img src="+ e.target.result +">");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(".profilebtn").on('change', function() {
		readInputFile(this);
	});
</script>


<script>

//비밀번호 
console.log('비번 도달');
// 비밀번호 정규식 : 영어 대소문자, 숫자로 4~15글자 이내 
var pwJ = /^[A-Za-z0-9]{4,15}$/;
$("#mempw").focusout(function() {
	if (pwJ.test($('#mempw').val())) {
			console.log(pwJ.test($('#mempw').val()));
			$("#pwcheck").text('');
	} else {
		$('#pwcheck').text('영어 대, 소문자, 숫자로  4~15글자로 작성해주세요 .');
		$('#pwcheck').css('color', 'red');
	}
	error : console.log('비밀번호 실패');
});

// 비밀번호 확인 
$("#mempw2").focusout(function() {
	if ($('#mempw2').val() != $('#mempw').val()) {
			console.log($('#mempw2').val(),$('#mempw').val());
			 $("#pwcheck").text('비밀번호가 다릅니다. 다시 입력해주세요.');
			$('#pwcheck').css('color', 'red'); 
	} else {
		$('#pwcheck').text('');
	} 
	error : console.log('비밀번호 확인 실패');
});
</script>


<script>
$('#memnick, #memphone').focusin(function() {

	$('#msg_nick').addClass('display_none');
	$('#msg_nick').removeClass('color_blue');
	$('#msg_nick').removeClass('color_red');
	$('#msg_phone').addClass('display_none');
	$('#msg_phone').removeClass('color_blue');
	$('#msg_phone').removeClass('color_red');

});

var nickJ = /^[가-힣a-zA-Z]{2,6}$/;
$("#memnick").focusout(function() {
	if (nickJ.test($('#memnick').val())) {
			console.log(nickJ.test($('#memnick').val()));
			$("#nickcheck").text('');
			// 닉네임이맞으면 ajax 실행
			$.ajax({
				type : 'POST',
				url : '<c:url value="/member/nickCheck"/>',
				data : { 
					memnick : $(this).val()
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
						$('#meX1mnick').val('');
					}
					
				}
			});
			
	} else {
		$('#nickcheck').text('2~6글자의 한글, 영어만 사용 가능합니다.');
		$('#nickcheck').css('color', 'red');
	}
	error : console.log('닉 실패');
});	

var phoneJ = /^010([0-9]{8})$/;
$('#memphone').focusout(function(){
	if(phoneJ.test($('#memphone').val())){
		console.log(phoneJ.test($('#memphone').val()));
		$("#phonecheck").text('');
		// 번호가 맞으면 ajax 실행
		$.ajax({
			type : 'POST',
			url : '<c:url value="/member/phoneCheck"/>',
			data : { 
				memphone : $(this).val()
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
					$('#memphone').val('');
				}
			}
		});
	} else {
		$('#phonecheck').text('휴대폰번호를 확인해주세요.');
		$('#phonecheck').css('color', 'red');
	}
	error : console.log('휴대폰 번호 실패');
});

</script>

</html>

