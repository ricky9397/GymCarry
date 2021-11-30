<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<meta name="google-signin-client_id" content="884370396168-lvivvhk8sibtnjq5ns48nug9qrgcuj6h.apps.googleusercontent.com">
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>
<script src="https://apis.google.com/js/platform.js?onload=init" asyncdefer></script>
<link rel="stylesheet" href="/gym/css/index.css">
<script src="/js/index.js"></script>

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
	var session_memnick = '${loginSession.memNick}';
	
	<c:if test="${loginSession ne null}">
	var socket = new SockJS("<c:url value='/echo'/>");
	socket.onmessage = function(message) {
		var data = message.data;
		var jsonData = JSON.parse(data);
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
