<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>1:1Chatting</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/chat/user_chat.css">
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>



	<div id="chatwarp">
		<div id="chatlist_wrap">
			<!-- 유저가 보는 캐리 채팅방리스트 -->
			<c:if test="${loginSession.memnick ne null}">
				<div class="chatid">
					<h3>${loginSession.memnick}</h3>
				</div>
				<!-- 채팅방 리스트 시작 -->
				<div class="chatList_scr">
					<c:forEach items="${chatList}" var="list">
					<c:if test="${list.outcount ne 1}">
						<div class="chatlist">
							<button type="button" value="${list.chatidx}"
								onclick="getChat(${list.chatidx},${list.memidx},${list.cridx},'${list.memnick}','${list.crnick}',${list.outcount});
							location.href='javascript:chatList(${list.chatidx})'"
								class="on_btn">
								<div class="float_left">
									<%-- <img src="<c:url value="/images/icon/profile2.png"/>"> --%>
									<img src="<c:url value="/uploadfile/${list.crphoto}"/>">
								</div>
								<div class="float_left chat_name">
									<h3>${list.crnick}</h3>
								</div>
								<div class="chat_title">
									<span>${list.placename}</span>
								</div>
								<c:if test="${list.chatread == 1}">
								<div class="chat_title_img"></div>
								</c:if>
								<div class="chat_content">
								<c:if test="${list.chatdate > list.outdate}">
									<span class="chatMessage">${list.chatcontent}</span>
								</c:if>
								</div>
								<div class="chat_date">
								<c:if test="${list.chatdate > list.outdate}">
									<span>${list.chatdate}</span>
								</c:if>
								</div>
							</button>
						</div>
					</c:if>
					</c:forEach>
				</div>
			</c:if>
			<!-- 캐리가 보는 유저 채팅방리스트 -->
			<c:if test="${loginSession.crnick ne null}">
				<div class="chatid">
					<h3>${loginSession.crnick}</h3>
				</div>
				<div class="chatList_scr">
				<c:forEach items="${carryChatList}" var="list">
					<div class="chatlist">
						<button type="button" value="${list.crnick}"
							onclick="getChat(${list.chatidx},${list.memidx},${list.cridx},'${list.memnick}','${list.crnick}',${list.outcount}); 
							location.href='javascript:chatList(${list.chatidx})'"
							class="on_btn">
							<div class="float_left">
								<%-- <img src="<c:url value="/images/icon/profile2.png"/>"> --%>
								<img src="<c:url value="/uploadfile/${list.memphoto}"/>">
							</div>
							<div class="float_left chat_name">
								<h3>${list.memnick}</h3>
							</div>
							<div class="chat_title">
								<span></span>
							</div>
							<c:if test="${list.chatread == 0}">
								<div class="chat_title_img"></div>
							</c:if>
							<div class="chat_content">
								<span>
									${list.chatcontent}
								</span>
							</div>
							<div class="chat_date">
								<span> ${list.chatdate}
								</span>
							</div>
						</button>
					</div>
				</c:forEach>
				</div>
			</c:if>
		</div>
		<!-- 채팅방 리스트 끝 -->
		<div id="chatcontent_warp">
			<div id="chatcontent_off">
				<div class="not_message">
					<img src="<c:url value="/images/icon/chat.png"/>"
						style="width: 80px;">
					<h3>채팅할 상대를 선택해주세요</h3>
				</div>
			</div>
		</div>

	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
		$(document).ready(function() {
			$(".chatlist .on_btn").click(function() {
				$(".chatlist .on_btn").removeClass('active');
				$(this).addClass('active');
			});
		});
		
		function chatNav(num){
			var num = num;
			var htmlNav = '<ul>';
			htmlNav += '<li class="back_button"><a href="#" onclick="history.go(0)"><img src="<c:url value="/images/icon/arrow.png"/>"</a></li>';
			if(memsession != null && crsession == ''){
			htmlNav += '<li class="imgButton btn_li"><a href="<c:url value="/carry/detail?cridx='+num+'"/>"><img src="<c:url value="/images/icon/ellipsis-h-solid.svg"/>" class="dot"></a></li>'
			htmlNav += '<li><button class="likeBtn" onclick="chatLike()" value="0"><img src="<c:url value="/images/icon/heart02.png"/>" style="width: 30px;" class="onlike"></button></li>'
			htmlNav += '<li class="imgButton"><a href="#" onclick="chatdelete();" id="waste_btn"><img src="<c:url value="/images/icon/garbage.png"/>" class="waste"></a></li>'
			} else if(crsession != null && outcount == 1){
				htmlNav += '<li class="imgButton waste_li2"><a href="#" onclick="chatdelete();"><img src="<c:url value="/images/icon/garbage.png"/>" class="waste2"></a></li>'
			}
			
			if(memsession != null && crsession == ''){
			htmlNav += '<li class="order_button imgButton"><input type="button" value="결제하기" id="asd"></li>'
			}
			htmlNav += '</ul>'
			$('.message_warp').html(htmlNav);
			$("#asd").click(function(){
				 $(location).attr('href', '<c:url value="/carry/detail?cridx='+num+'"/>');
			});
		}
		
		var chatIdx, memidx, cridx, memnicks, crnicks, outcount;
		function getChat(num, mnum, crnum, memnick, crnick, count){
			chatIdx = num;
			memidx = mnum;
			cridx = crnum;
			memnicks = memnick;
			crnicks = crnick;
			outcount = count;
		}
		
		function notification(){
			new Notification("타이틀", {body:'메세지내용'});
		}
		
		
		function chattting(num){
			var num = num;
			var htmlStr = '<div>'
				htmlStr += '<div class="message_warp"></div>'
				htmlStr += '<div class="chat_null" id="output">'
				htmlStr += '	<div class="carry_message_warp">'
				htmlStr += '		<div class="carry_chat">'
				htmlStr += '		<div class="time_line"><span></span></div>'
				htmlStr += '		</div>'
				htmlStr += '	</div>'
				htmlStr += '</div>'
				htmlStr += '<div class="chatting_write">'
				htmlStr += '<input type="text" placeholder="메세지 입력.." id="msg">'
				htmlStr += '<input type="hidden" value="${chatSession}" id="messageId">'
				htmlStr += '<button type="button" class="btn" id="btnSend">'
				htmlStr += '<img src="<c:url value="/images/icon/icoin.png"/>">'
				htmlStr += '</button>'
				htmlStr += '</div>'					
				htmlStr += '</div>'
			$('#chatcontent_warp').html(htmlStr);			
			chatNav(num);
			
			// 처음 접속시, 메세지 입력창에 focus 시킴
			$('#msg').focus();
			
			$('#btnSend').click(function(event){
				if ($('input#msg').val().trim().length >= 1) {
					event.preventDefault();
					var send = '${chatSession}';
					if(send == memnicks){
						send = crnicks;
						sendMessage(send);
					} else if(send == crnicks){
						send = memnicks;
						sendMessage(send);
					}
					var msg = $('input#msg').val();
					// 메세지 입력창 내용 보내고 지우기.
					$('#msg').val('');
				}
			});	
			
			
			$('#msg').keypress(function(event){
				if (event.keyCode == 13 && $('input#msg').val().trim().length >= 1) {
					event.preventDefault();
					var send = '${chatSession}';
					if(send == memnicks){
						send = crnicks;
						sendMessage(send);
					} else if(send == crnicks){
						send = memnicks;
						sendMessage(send);
					}
					var msg = $('input#msg').val();
					// 메세지 입력창 내용 보내고 지우기.
					$('#msg').val('');
				}
			});	
		}
		
	</script>

	<script>
	
	var url;
	$(".on_btn").on("click", function(){
		url = $(this).find('.float_left img').attr("src");
	});
	
	var socket = new SockJS("<c:url value='/echo'/>");
	// open - 커넥션이 제대로 만들어졌을 때 호출
	socket.onopen = function(asd) {
		console.log(asd);
		// 방오픈 됫는지 확인 메세지
		console.log('connection opend.');
	};
	
	// onmessage - 커넥션이 메세지 호출
	socket.onmessage = function(message) {
		var data = message.data;
		var jsonData = JSON.parse(data);
		
		console.log(jsonData);
		var currentuser_session = $('#messageId').val();
		if(chatIdx == jsonData.chatidx){
			if (jsonData.chatNick == currentuser_session) {
				var htmlStr = '	<div class="user_message_warp">'
					htmlStr += '		<div class="user_chat">'
					htmlStr += '			<div class="user_message">'
					htmlStr += '				<div>'
					htmlStr += '					<span>'+jsonData.chatcontent+'</span>'
					htmlStr += '				</div>'
					htmlStr += '			</div>'
					htmlStr += '			<div class="time_line2">'
					htmlStr += '				<span>'+jsonData.chatdate+'</span>'
					htmlStr += '			</div>'
					htmlStr += '		</div>'
					htmlStr += '	</div>'
				$('.chat_null').append(htmlStr);
				$("#output").scrollTop($("#output")[0].scrollHeight);
				
			} else {
				var htmlSt = '<div class="carry_message_warp">'
					htmlSt += '<div class="carry_chat">'
					htmlSt += '<div class="carry_line"><img src="'+url+'"></div>'
					htmlSt += '<div class="message">'
					htmlSt += '<div class="message_color">'
					htmlSt += '<span>'+jsonData.chatcontent+'</span>'
					htmlSt += '</div>'
					htmlSt += '</div>'
					htmlSt += '<div class="time_line"><span>'+jsonData.chatdate+'</span></div>'
					htmlSt += '</div>'
					htmlSt += '</div>'
				$('.chat_null').append(htmlSt);
				$("#output").scrollTop($("#output")[0].scrollHeight);
			}
			$('.chatlist .active .chat_content').html('<span>'+ jsonData.chatcontent+'</span>');
			$('.chatlist .active .chat_date').html('<span>'+ jsonData.chatdate+'</span>');
		}
		
		if(jsonData.chatcontent == '상대방이 채팅방을 삭제하셨습니다.'){
			$('.message_warp .back_button').after('<li class="imgButton waste_li2"><a href="#" onclick="chatdelete();"><img src="<c:url value="/images/icon/garbage.png"/>" class="waste2"></a></li>')
		}
	};
	
	
	var memsession = '${loginSession.memnick}';
	var crsession = '${loginSession.crnick}';
	
	
	// close - 커넥션이 종료되었을 때 호출
	socket.onclose = function(event) {
		console.log('connection closed.');
		console.log(event);
	};

	// error - 에러가 생겼을 때 호출
	socket.onerror = function(error) {
		console.log('connection Error.')
	};
	
	
	// 객체를 json형태로 담아 보냄
	function sendMessage(send) {
		var msg = {
			chatNick : '${chatSession}',
			to : send,
			cridx : cridx,
			memidx : memidx,
			chatidx : chatIdx,
			crnick : crnicks,
			chatcontent : $('#msg').val()
		};
		// 사용자닉네임, 캐리닉네임, 메세지 send 보낸다.
		socket.send(JSON.stringify(msg));
	}; 
	
	function deleteMessage(send){
		var msg = {
			chatNick : '${chatSession}',
			to : send,
			cridx : cridx,
			memidx : memidx,
			chatidx : chatIdx,
			crnick : crnicks,
			chatcontent : '상대방이 채팅방을 삭제하셨습니다.'
		}
		socket.send(JSON.stringify(msg));
	};
	</script>

	<script>
	// 하트~ 조아요
	function chatLike(){
		$.ajax({
			type : 'GET',
			url : '<c:url value="/chatting/like"/>',
			dataType : 'json',
			data : {
				cridx : cridx
			},
			success : function(data){
				if(data == 0){
					$('.onlike').attr('src','<c:url value="/images/icon/heart02.png"/>');
				} else {
					$('.onlike').attr('src','<c:url value="/images/icon/heart01.png"/>');
				}
			}
		});
	};
	
	
	// 채팅방 나가기~
	function chatdelete(){
		Swal.fire({
		  title: '나가시겠습니까?',
		  text: "채팅방을 나가시면 메세지가 모두 삭제 됩니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: 'red',
		  cancelButtonColor: 'cornflowerblue',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
			  
		  var send = '${chatSession}';
			if(send == memnicks){
			send = crnicks;
			deleteMessage(send);
		} 
			
		  $.ajax({
				type : 'GET',
				url : '<c:url value="/chatting/delete"/>',
				dataType : 'json',
				data : {
					chatidx : chatIdx
				},
				success : function(data){
					location.reload(true);
				}
			});
		  }
		})
	};	
	
	// 채팅방 대화내용 리스트
	function chatList(num) {
		$.ajax({
			type : 'POST',
			url : '<c:url value="/chatting/dochat"/>',
			dataType : 'json',
			data : {
				chatidx : num
			},
			success : function(data) {
				$('.chatlist .active .chat_title_img').removeClass();
				if (data.memList == 0 || data.crList == 0) {
					chattting(cridx);
					$.each(data.memList, function(index, item) {
						if(item.likecheck == 1){
							$('.onlike').attr('src','<c:url value="/images/icon/heart01.png"/>');
						} else if(item.likecheck == 0){
							$('.onlike').attr('src','<c:url value="/images/icon/heart02.png"/>');
						}
					});
				} else {
					var htmlStr = '<div class="carry_message_warp">';
					$.each(data.memList, function(index, item) {
						if(item.contenttype == 1 && item.chatcontent != null){
							htmlStr += '<div class="carry_chat">';
							htmlStr += '	<div class="carry_line"><img src="'+url+'"></div>';
							htmlStr += '	<div class="message">';
							htmlStr += '		<div class="message_color">';
							htmlStr += '			<span>'+item.chatcontent+'</span>';
							htmlStr += '		</div>';
							htmlStr += '	</div>';
							htmlStr += '	<div class="time_line"><span>'+item.chatdate+'</span></div>';
							htmlStr += '	</div>';
							htmlStr += '</div>';
							
						} else if (item.contenttype == 0 && item.chatcontent != null){
							htmlStr += '	<div class="user_message_warp">';
							htmlStr += '		<div class="user_chat">';
							htmlStr += '			<div class="user_message">';
							htmlStr += '				<div>';
							htmlStr += '					<span>'+item.chatcontent+'</span>';
							htmlStr += '				</div>';
							htmlStr += '			</div>';
							htmlStr += '			<div class="time_line2">';
							htmlStr += '				<span>'+item.chatdate+'</span>';
							htmlStr += '			</div>';
							htmlStr += '		</div>';
							htmlStr += '	</div>';
						}
						chattting(item.cridx); 
						$('.chat_null').html(htmlStr);
						if(item.likecheck == 1){
							$('.onlike').attr('src','<c:url value="/images/icon/heart01.png"/>');
						} else if(item.likecheck == 0){
							$('.onlike').attr('src','<c:url value="/images/icon/heart02.png"/>');
						}
					});
					
					$.each(data.crList, function(index, item) {
						if(item.contenttype == 1 && item.chatcontent != null){
							htmlStr += '	<div class="user_message_warp">';
							htmlStr += '		<div class="user_chat">';
							htmlStr += '			<div class="user_message">';
							htmlStr += '				<div>';
							htmlStr += '					<span>'+item.chatcontent+'</span>';
							htmlStr += '				</div>';
							htmlStr += '			</div>';
							htmlStr += '			<div class="time_line2">';
							htmlStr += '				<span>'+item.chatdate+'</span>';
							htmlStr += '			</div>';
							htmlStr += '		</div>';
							htmlStr += '	</div>';
						} else if (item.contenttype == 0 && item.chatcontent != null){
							htmlStr += '<div class="carry_chat">';
							htmlStr += '	<div class="carry_line"><img src="'+url+'"></div>';
							htmlStr += '	<div class="message">';
							htmlStr += '		<div class="message_color">';
							htmlStr += '			<span>'+item.chatcontent+'</span>';
							htmlStr += '		</div>';
							htmlStr += '	</div>';
							htmlStr += '	<div class="time_line"><span>'+item.chatdate+'</span></div>';
							htmlStr += '	</div>';
							htmlStr += '</div>';
						} 
						chattting();
						$('.chat_null').html(htmlStr);
					});
					$('#output').scrollTop($('#output')[0].scrollHeight);
				}
			}
		})
	}
	</script>
	
	

		


