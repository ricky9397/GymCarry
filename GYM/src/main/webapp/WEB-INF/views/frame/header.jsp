<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="google-signin-client_id"
	content="884370396168-lvivvhk8sibtnjq5ns48nug9qrgcuj6h.apps.googleusercontent.com">
<header class="header">
	<div class="logo">
		<a href="<c:url value="/index"/>">GymCarry</a>
	</div>
	<nav class="nav">
		<ul>
			<li><a href="<c:url value="/about"/>">ABOUT</a></li>
			<li><a href="<c:url value="/carry/allList"/>">1:1MATCHING</a></li>
			<li><a href="<c:url value="/place/all"/>">PLACE</a></li>
			<li><a href="<c:url value="/community/boardList"/>">COMMUNITY</a></li>
			<c:choose>
				<c:when test="${empty loginSession}">
					<li><a href="<c:url value="/member/login"/>">MY BODY</a></li>
				</c:when>
				<c:when test="${loginSession.cridx ne 0}">
					<li><a href="<c:url value="/mypage/carrymypage"/>">MY PAGE</a></li>
				</c:when>
				<c:when test="${loginSession.memidx ne 0}">
					<li><a href="<c:url value="/mypage/mypage"/>">MY BODY</a></li>
				</c:when>
			</c:choose>
		</ul>
	</nav>
	<div class="sub_nav">
		<div class="chatting">
			<a href="<c:url value="/chatting/chatList"/>"> <img
				src="<c:url value="/images/icon/chatting_icon.png"/>" alt="chatting">
			</a>
		</div>
		<c:if test="${loginSession eq null}">
			<a href="<c:url value="/member/login"/>" class="login"> LOGIN </a>
		</c:if>
		<c:if test="${loginSession ne null}">
			<a href="<c:url value="/member/logOut"/>" class="login"
				onclick="kakaoLogout(); signOut();"> LOGOUT </a>
		</c:if>
	</div>
</header>
<link rel="stylesheet" type="text/css"
	href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js ">
	
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>

<script>
	Kakao.init('0ecec0f1529ce019d44a9de3e0b3bb22');
	//카카오 로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
					window.location.href = '<c:url value="/index"/>';
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>

<script>
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('Google Logout');
		});
		auth2.disconnect();
	}
</script>


<script>
	/* 메세지 알림기능 */
	var session_memnick = '${loginSession.memnick}'
	var session_crnick = '${loginSession.crnick}'
	<c:if test="${loginSession ne null}">
	var socket = new SockJS("<c:url value='/echo'/>");
	socket.onmessage = function(message) {
		var data = message.data;
		var jsonData = JSON.parse(data);
		console.log(jsonData);
		if (jsonData.to == session_memnick) {
			toastr.options.escapeHtml = true;
			toastr.options.closeButton = true;
			toastr.options.newestOnTop = false;
			toastr.options.progressBar = true;
			toastr.options.onclick = function() {
				location.href = '<c:url value="/chatting/chatList"/>';
			}
			toastr.info('메시지를 보냈습니다.', jsonData.chatNick + '님이', {
				timeOut : 5000
			});
		} else if (jsonData.to == session_crnick) {
			toastr.options.escapeHtml = true;
			toastr.options.closeButton = true;
			toastr.options.newestOnTop = false;
			toastr.options.progressBar = true;
			toastr.options.onclick = function() {
				location.href = '<c:url value="/chatting/chatList"/>';
			}
			toastr.info('메시지를 보냈습니다.', jsonData.chatNick + '님이', {
				timeOut : 5000
			});
		}
	};
	</c:if>
</script>
