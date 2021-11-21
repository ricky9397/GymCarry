<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="google-signin-client_id" content="549594592719-njuj9rmfspj9asuoqd7e87ecpcr4t8vn.apps.googleusercontent.com">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<link rel="stylesheet" href="/gym/css/joinlogin/loginform.css">

</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<!-- Contents -->
	<div class="wrap wd668">
		<div class="form_txtInput">

			<form action="<c:url value="/member/memberLogin"/>" method="post">
				<h1 class="sub_tit_txt">회원 로그인</h1>
				<div class="login_form">
				
				
					<div class="tb">
						<div id="catebox">
							<label id="cate"><grid>이메일</grid></label>
						</div>
						
						<input type="text" id="into" name="mememail">
						<div class="check_font" id="emailcheck" style=float:left></div>
					</div>

					<div class="tb">
						<div id="catebox">
							<label id="cate"><grid>비밀번호</grid></label>
						</div>
						
						<input type="password" id="into" name="mempw">
						<div class="check_font" id="pwcheck"></div>
					</div>

					<div class="selectbox">
						<input type="checkbox" value="on" id="reemail"> 이메일 기억하기 <input
							type="hidden" name="redirectUri">
					</div>

					<div id="btnbox">
						<div class="btn_wrap">
							<input type="submit" id="loginbtn" value="로그인">
						</div>
						<a id="alter" href="<c:url value="/carry/login"/>">캐리로그인</a><br>
					</div>
				</div>
				<!-- join_form E  -->
			</form>

			<hr>
			<div class="change">
				<ul>
					<li><a href="<c:url value="/member/join"/>">일반 회원가입</a></li>
					<li class="tab2"><a href="<c:url value="/find/findid"/>">회원 아이디
							찾기</a></li>
					<li class="tab2"><a href="<c:url value="/find/findpassword"/>">회원 비밀번호
							찾기</a></li>
				</ul>
			</div>


			<!-- 카카오 로그인 -->
			<ul class="apiLogin">
				<li class="kakao">
					<button  onclick="kakaoLogin()" class="kakao_btn">
					<img src="<c:url value="/images/icon/kakao_login_medium_btn.png"/>">
					</button>
				</li>
			</ul>



			<!-- 구글  로그인 -->
			<ul class = "apiLogin">
				<li id="GgCustomLogin"><a href="javascript:void(0)"> <span>
				<img src="<c:url value="/images/icon/google_login_medium_btn.png"/>" class="google_btn"></span>
				</a></li>
			</ul>



		</div>
	</div>
	<!-- content E-->


<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- 카카오 로그인 API -->
<script>
	Kakao.init('63464a41c4be0b7873f01ff2d392291a'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오 로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			/* scope: 'profile, account_email,  gender',  */
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response);
						var nick = response.properties.nickname;
						var email = response.kakao_account.email;
						var id = response.id;
						
						$.ajax({
							type : 'POST',
							url : '<c:url value="/member/kakaologin"/>',
							data : { 
									snsjoinid : id,
									mememail : email,
									memnick : nick
								},
							dataType : 'json',
							success : function(data){
								console.log(data);
								if(data == 0){
									window.location.href = "<c:url value='/member/kakaojoin?snsjoinid="+id+"'/>";
								} else if(data == 1){
									window.location.href = "<c:url value='/member/kakaojoin?snsjoinid="+id+"'/>";
								} else if(data == 2){
									window.location.href = "<c:url value='/index'/>";
								}
							}
						});
								
						
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	
</script>

<script>
$(document).ready(function(){
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#into").val(key); 
     
    if($("#into").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#reemail").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#reemail").change(function(){ // 체크박스에 변화가 있다면,
        if($("#reemail").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#into").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#into").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#reemail").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#into").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>


<!-- 구글 로그인 API -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script>
//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	var profile = googleUser.getBasicProfile();
	console.log('ID: ' + profile.getId());
	console.log('Name: ' + profile.getName());
	console.log('Email: ' + profile.getEmail());
	
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me',
		data: {
			key:'AIzaSyAll5bRKLODhoRHI0iRJK5o9k4CIjcX4Xk',
			'access_token': access_token
			},
		method:'GET',
		success : function(response) {
			var nick = profile.name;
			var email = profile.email;
			var id = profile.id;
			
			$.ajax({
				type : 'POST',
				url : '<c:url value="/member/kakaologin"/>',
				data : { 
						snsjoinid : id,
						mememail : email,
						memnick : nick
					},
				dataType : 'json',
				success : function(data){
					console.log(data);
					if(data == 0){
						window.location.href = "<c:url value='/member/kakaojoin?snsjoinid="+id+"'/>";
					} else if(data == 1){
						window.location.href = "<c:url value='/member/kakaojoin?snsjoinid="+id+"'/>";
					} else if(data == 2){
						window.location.href = "<c:url value='/index'/>";
					}
				}
			});
			
			
		}
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile);
	
	
	
	
	
	
	
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}

</script>



</html>