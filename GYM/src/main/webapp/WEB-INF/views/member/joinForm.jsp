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
									<th><span>이름</span></th>
									<td><input type="text" name="memName" id="memName" placeholder="이름" required />
										<div class="check_font" id="namecheck"></div></td>
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
			success : function(data){
				console.log(data);
				if(data == 0){
					alert('회원가입이 안되었습니다. 다시 시도해 주세요.');	
				} else {
					alert('회원가입 되셨습니다.');
					window.location.href = '<c:url value="/member/login"/>';
				} 
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

	
	// 회원가입 정규표현식
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	/* 이메일  : test@naver.com*/
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	/* 이름 : 영어, 한글로만 2~6글자이내 */
	var nameReg = /^[가-힣a-zA-Z]{2,6}$/;
	/* 비밀번호 : 영문(소,대,특수문자 포함 8자이상 16자이하) */
	var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/;
	/* 휴대폰번호  : 010필수, (-)없이 8숫자 */
	var phoneReg = /^010([0-9]{8})$/;
	/* 생년월일 : 19880630 숫자만 8자 */
	var birthReg = /^[0-9]{8}$/;
	/* 닉네임 : 한글 또는 영어 2~6글자 */
	var nickReg = /^[가-힣a-zA-Z]{2,6}$/;
	
	/* 이메일 */
	$('#memEmail').focusout(function(){
		if(emailReg.test($(this).val())){
			$('#emailcheck').text('');
			
			$.ajax({
				type : 'POST',
				url : '<c:url value="/member/emailCheck"/>',
				data : { 
					memEmail : $(this).val()
				},
				success : function(data) {
					if(data == 0){
						$('#msg').html('사용가능');
						$('#msg').removeClass('color_red');
						$('#msg').addClass('color_blue');
						$('#msg').removeClass('display_none');
					} else {
						$('#msg').html('중복이메일 입니다.');
						$('#msg').addClass('color_red');
						$('#msg').removeClass('display_none');
						$('#memEmail').val('');
					}
				}
			});
			
		} else {
			$('#msg').text('');
			$('#emailcheck').text('이메일 형식으로 입력해주세요.');
			$('#emailcheck').css('color', 'red');
		}
	});
	
	/* 비밀번호 */
	$("#memPw").focusout(function() {
		if (pwReg.test($(this).val())) {
				$("#pwcheck").text('');
		} else {
			$('#pwcheck').text('영어 대,소문자,특수문자포함  8~16글자로 작성해주세요 .');
			$('#pwcheck').css('color', 'red');
		}
	});
	
	/* 비밀번호 확인  */
	$("#memPw2").focusout(function() {
		if ($(this).val() != $('#memPw').val()) {
				$("#pwcheck").text('비밀번호가 다릅니다. 다시 입력해주세요.');
				$('#pwcheck').css('color', 'red');
		} else {
			$('#pwcheck').text('');
		} 
	});
	
	/* 이름 */
	$("#memName").focusout(function() {
		if (nameReg.test($(this).val())) {
				$("#namecheck").text('');
		} else {
			$('#namecheck').text('2~6글자의 한글, 영어만 사용 가능합니다.');
			$('#namecheck').css('color', 'red');
		}
	});
	
	/* 휴대폰 번호 */
	$('#memPhone').focusout(function(){
		if(phoneReg.test($(this).val())){
			$("#phonecheck").text('');
			
			// 번호가 맞으면 ajax 실행
			$.ajax({
				type : 'POST',
				url : '<c:url value="/member/phoneCheck"/>',
				data : { 
					memPhone : $(this).val()
				},
				success : function(data) {
					if(data == 0){
						$('#msg_phone').html('사용가능');
						$('#msg_phone').removeClass('color_red');
						$('#msg_phone').addClass('color_blue');
						$('#msg_phone').removeClass('display_none');
					} else {
						$('#msg_phone').html('사용 불가능');
						$('#msg_phone').addClass('color_red');
						$('#msg_phone').removeClass('display_none');
						$('#memPhone').val('');
					}
				}
			});
			
		} else {
			$('#msg_phone').text('');
			$('#phonecheck').text('휴대폰번호를 확인해주세요.');
			$('#phonecheck').css('color', 'red');
		}
	});
	
	/* 생년월일 */
	$('#memBirth').focusout(function(){
		var dateStr = $(this).val();		
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
	
	/* 성별  */
	$('#gendercheck').focusout(function(){
		invalidItem();
	});
	function invalidItem(){
		if($("input[name=memGender]:radio:checked").length < 1){
			$('#gendercheck').text('성별을 선택해주세요.');
			$('#gendercheck').css('color', 'red');  
		} else {
			$('#gendercheck').text('');
		}
	}
	
	/* 닉네임  */
	$("#memNick").focusout(function() {
		if (nickReg.test($(this).val())) {
				$("#nickcheck").text('');
				
				// 닉네임이맞으면 ajax 실행
				$.ajax({
					type : 'POST',
					url : '<c:url value="/member/nickCheck"/>',
					data : { 
						memNick : $(this).val()
					},
					success : function(data) {
						if(data == 0){
							$('#msg_nick').html('사용가능');
							$('#msg_nick').removeClass('color_red');
							$('#msg_nick').addClass('color_blue');
							$('#msg_nick').removeClass('display_none');
						} else {
							$('#msg_nick').html('사용 불가능');
							$('#msg_nick').addClass('color_red');
							$('#msg_nick').removeClass('display_none');
							$('#memNick').val('');
						}
					}
				});
		} else {
			$('#msg_nick').text('');
			$('#nickcheck').text('2~6글자의 한글, 영어만 사용 가능합니다.');
			$('#nickcheck').css('color', 'red');
		}
	});	 
		
</script>

</html>





