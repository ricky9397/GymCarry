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

	<!-- header -->s
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<!-- Contents -->
	<div class="wrap wd668">
		<div class="form_txtInput">

			<form>
				<h1 class="sub_tit_txt">회원 로그인</h1>
				<div class="login_form">
				
				
					<div class="tb">
						<div id="catebox">
							<label id="cate"><grid>이메일</grid></label>
						</div>
						
						<input type="text" id="memEmail" name="memEmail">
						<div class="check_font" id="emailcheck" style=float:left></div>
					</div>

					<div class="tb">
						<div id="catebox">
							<label id="cate"><grid>비밀번호</grid></label>
						</div>
						
						<input type="password" id="memPw" name="memPw">
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
			<div class="g-signin2 google_btn" onclick="googleLogin()" data-width="297" data-height="45"></div>
			
		</div>
	</div>
	<!-- content E-->

<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>

<script>
	// 로그인 submit 버튼 클릭 이벤트
	$('#loginbtn').click(function(){
		/* 이벤트막음 */
		event.preventDefault();
		var data = {
				memEmail : $('#memEmail').val(),
				memPw : $('#memPw').val()
		}
		/* 로그인 아이디 비밀번호 체크 ajax */
		$.ajax({
			type : 'POST' ,
			url : '<c:url value="/member/memberLogin"/>',
			data : data,
			success : function(data){
				if(data == 0){
					alert('아이디 또는 비밀번호가 다릅니다.');
				} else {
					window.location.href = '<c:url value="/index"/>';
				}
			}
		});
	});
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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>

function googleLogin() {
   var auth2 = gapi.auth2.getAuthInstance();

   if(auth2.isSignedIn.get()) {
      var profile = auth2.currentUser.get().getBasicProfile();
      var nick = profile.Re;
      var email = profile.Tt;
      var id = profile.sT;
      
      // The ID token you need to pass to your backend:
   /*    var id_token = googleUser.getAuthResponse().id_token;
      console.log("ID Token: " + id_token); */
      
     $.ajax({
         type : 'POST',
         url : '<c:url value="/member/kakaologin"/>',
         data : { 
               snsjoinid : id,
               mememail : email,
               memnick : name
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
}
   
</script>

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




</html>