<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>GYM CARRY : 회원가입</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/gym/css/joinlogin/regform.css">

</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<!-- Contents -->
	<div class="wrap wd668">
		<div class="container">
			<form id="joinForm">
				<div class="form_txtInput">
					<h1 class="sub_tit_txt">회원 회원가입</h1>
					<p class="exTxt">회원가입시 이메일 인증을 반드시 진행하셔야 합니다.</p>
					<div class="join_form">
						<div class="profile_form">
							<div class="profileimg" id="image_container">
								<img src="/gym/images/icon/profile2.png"><br>
							</div>
							<input type="button" value="사진업로드" class="profilebtn" name="memPhoto" onclick =document.all.file.click();> 
							<input type="file" name="memPhoto" id="file" class="profilebtn" style="display: none;" />
						</div>
						
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							
							<tbody>
								<tr>
									<th><span>이름</span></th>
									<td><input type="text" name="memName" id="memName" placeholder="이름" required />
										<div class="check_font" id="namecheck"></div></td>
								</tr>

								<tr class="email">
									<th><span>이메일</span></th>
									<td><input type="text" name="memEmail" id="memEmail" placeholder="이메일 형식으로 입력해주세요. 로그인시 아이디로 사용됩니다." required>
										<span id="msg" class="display_none"></span>
										<div class="check_font" id="emailcheck" style="float: left"></div>
									</td>
								</tr>
								<tr>
									<th><span>비밀번호</span></th>
									<td><input type="password" name="memPw" id="memPw" placeholder="비밀번호를 입력해주세요.">
										<div class="check_font" id="pwcheck"></div></td>
								</tr>

								<tr>
									<th><span>비밀번호 확인</span></th>
									<td><input type="password" name="memPw2" id="memPw2"
										placeholder="비밀번호를 확인해주세요.">
										<div class="check_font" id="mempw2check"></div></td>
								</tr>

								<tr>
									<th><span>닉네임</span></th>
									<td><input type="text" name="memNick" id="memNick" placeholder="닉네임"> <span id="msg_nick" class="display_none"></span>
										<div class="check_font" id="nickcheck"></div>
									</td>
								</tr>

								<tr>
									<th><span>휴대폰 번호</span></th>
									<td><input type="text" name="memPhone" id="memPhone" placeholder="'-'없이 번호만 11자리 형식으로 입력해주세요.">
										<span id="msg_phone" class="display_none"></span>
										<div class="check_font" id="phonecheck"></div>
									</td>
								</tr>

								<tr>
									<th><span>생년월일</span></th>
									<td><input type="text" name="memBirth" id="memBirth" placeholder="8자리 형식의 숫자로만 입력해주세요.ex_19901010" >
										<div class="check_font" id="birthcheck"></div>
									</td>
								</tr>

								<tr>
									<th><span>성별</span></th>
									<td>
										<div class="selectbox">
											<label for="male" id="male_label">
												<input type="radio" name="memGender" id="male" value="남자">남자
											</label>
											<label for="female" id="female_label">
												<input type="radio" name="memGender" id="female" value="여자">여자
											</label>
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
				</div>
				<!-- form_txtInput E -->
			</form>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>

</body>


<script>
	$('#joinsubmit').click(function(event){
		/* 이벤트막음 */
		event.preventDefault();
		
		var form = $('#file')[0].files[0]
		var formData = new FormData();
		formData.append('memEmail', $('#memEmail').val());
		formData.append('memPw', $('#memPw').val());
		formData.append('memName', $('#memName').val());
		formData.append('memNick', $('#memNick').val());
		formData.append('memBirth', $('#memBirth').val());
		formData.append('memPhone', $('#memPhone').val());
		formData.append('memGender', $('input[name="memGender"]:checked').val());
		formData.append('memPhoto', form);
		
		// 회원가입 From Action 데이타
		$.ajax({
			url : '<c:url value="/member/join"/>',
			type : 'POST',
			data : formData,
			enctype : 'multipart/form-data',
			processData: false,
	        contentType: false,
	        cache: false,
			success : function(e){
				console.log(e);
				/* if(e == 0){
					alert('회원가입 실패 했습니다.');	
				} else if(e == 1){
					alert('회원가입 완료 되었습니다.');
				} else {
					
				} */
			}
		});
	});

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
	/* var empJ = /\s/g;

	// 이름, 이메일, 비밀번호, 비밀번호 확인, 닉네임, 휴대폰 번호, 생일, 성별 순
	
	// 이름 정규식 : 영어, 한글로만 2~6글자 이내 
	var nameJ = /^[가-힣a-zA-Z]{2,6}$/;
	$("#memname").focusout(function() {
		if (nameJ.test($('#memname').val())) {
				console.log(nameJ.test($('#memname').val()));
				$("#namecheck").text('');
		} else {
			$('#namecheck').text('2~6글자의 한글, 영어만 사용 가능합니다.');
			$('#namecheck').css('color', 'red');
		}
		error : console.log('이름 실패');
	});
	
	
	// 이메일 검사 정규식 : 이메일 형식(ㅇㅇㅇ@ㅇㅇㅇ.ㅇㅇ)
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	$("#mememail").focusout(function() {
		if (mailJ.test($('#mememail').val())) {
				console.log(mailJ.test($('#mememail').val()));
				$("#emailcheck").text('');
		// 이메일 이맞으면 ajax 실행		
		$.ajax({
			type : 'POST',
			url : '<c:url value="/member/emailCheck"/>',
			data : { 
				mememail : $(this).val()
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
	
	// 휴대폰 번호
	// 휴대폰 번호 정규식 : 010(필수)+ 숫자로만 8글자
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
	
	
	// 생년월일
	// 생일 정규식 : 숫자로만 8글자 
	var birthJ = /^[0-9]{8}$/;
	$('#membirth').focusout(function(){
		var dateStr = $('#membirth').val();		
	    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    var today = new Date(); // 날짜 변수 선언
	    var yearNow = today.getFullYear(); // 올해 연도 가져옴
	    
	    if (dateStr.length <=8) {
	    	
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환
		    if (1900 > year || year > yearNow){
		    	
		    	$('#birthcheck').text('태어난 연도를 정확하게 입력해주세요.');
				$('#birthcheck').css('color', 'red');
		    	
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birthcheck').text('태어난 월을 정확하게 입력해주세요.');
				$('#birthcheck').css('color', 'red'); 
		    
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birthcheck').text('태어난 날짜를 정확하게 입력해주세요.');
				$('#birthcheck').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birthcheck').text('생년월일을 정확하게 입력해주세요.');
				$('#birthcheck').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birthcheck').text('생년월일을 정확하게 입력해주세요.');
					$('#birthcheck').css('color', 'red'); 
		    	
				}else{
					$('#birthcheck').text('');
					birthJ = true;
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birthcheck').text(''); 
				birthJ = true;
			}//end of if
			
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false
				$('#birthcheck').text('8자리 숫자형식으로 정확하게 입력해주세요.');
				$('#birthcheck').css('color', 'red');  
			}
	    
		}); //End of method /*
	
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
	});	 */
		
</script>
<!-- alert('입력해주신 이메일로 인증 메일이 발송되었습니다. 이메일 인증을 완료해주세요.') -->

<!-- 회원가입 이메일,닉네임,핸드폰 중복체크 ajax -->
<script>
$('#mememail, #memnick, #memphone').focusin(function() {
	$('#msg').addClass('display_none');
	$('#msg').removeClass('color_blue');
	$('#msg').removeClass('color_red');
	$('#msg').val('');
	$('#msg_nick').addClass('display_none');
	$('#msg_nick').removeClass('color_blue');
	$('#msg_nick').removeClass('color_red');
	$('#msg_phone').addClass('display_none');
	$('#msg_phone').removeClass('color_blue');
	$('#msg_phone').removeClass('color_red');
});
	
</script>

</html>





