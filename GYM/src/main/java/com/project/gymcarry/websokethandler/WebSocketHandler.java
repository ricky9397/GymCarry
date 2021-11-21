package com.project.gymcarry.websokethandler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.project.gymcarry.chatting.ChatAlarmDto;
import com.project.gymcarry.chatting.MessageDto;
import com.project.gymcarry.chatting.service.MatchingChatRoomServiceImpl;

public class WebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private MatchingChatRoomServiceImpl matchingChatRoomService;

	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	// 웹 소켓 세션을 저장할 리스트
	private List<WebSocketSession> list = new ArrayList<>();

	// 사용자와 세션 저장할 맵
	private Map<String, WebSocketSession> mapList = new HashMap<String, WebSocketSession>();
	// room session 알람 및 상대방 나감여부
	private Map<WebSocketSession, String> roomList = new HashMap<WebSocketSession, String>();

	// 커넥션이 연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 회원, 캐리 세션 정보 가져오기
		String chatNick = (String) session.getAttributes().get("chatSession");
		// 로그인햇으면 닉네임이고 - 로그인이안되있으면 세션아이디
		// chatNick:닉네임저장 - session:웹소켓세션저장
		mapList.put(chatNick, session);
		roomList.put(session, chatNick);

		// 웹소켓 세션을 저장
		// map, list 둘중 하나만 해도된다.
		list.add(session);
		// 세션값을 불러온 0번째 중괄호에 session.getId()을 넣으라는 뜻 : 세션 닉네임 값
		logger.info("세션추가 : " + session.getId() + " 접속자닉네임 : " + chatNick);
	}

	// 사용자로 부터 받은 메세지 보내기
	// TextMessage message : 누가 보냈는지에 대한 정보 저장.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 누가보냇는지 메세지타입 (mem=0 , carry=1)
		int contenttype = 0;
		// 유저가 보낸메세지 0, 캐리가보낸메세지 1 (읽음 안읽음 처리)
		int chatRead = 0;
		// 자기가보낸 메세지 읽음 처리
		String chatNick = (String) session.getAttributes().get("chatSession");
		logger.info("{}로 부터 {}를 전달 받았습니다.", chatNick, message.getPayload());

		TimeZone timeZone = TimeZone.getTimeZone("Asia/Seoul");
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("h:mm a");
		format.setTimeZone(timeZone);
		String date = format.format(time);

		// json객체 -> java객체
		Gson gson = new Gson();
		MessageDto messageDto = gson.fromJson(message.getPayload(), MessageDto.class);
		messageDto.setChatdate(date);
		if (chatNick.equals(messageDto.getCrnick())) {
			messageDto.setContenttype(++contenttype);
			messageDto.setChatread(++chatRead);
		}

		// 뷰딴에 보낼 메세지
		TextMessage sendMsg = new TextMessage(gson.toJson(messageDto));

		String to = messageDto.getTo();
		WebSocketSession toSession = mapList.get(to);
		if (toSession != null && roomList.size() >= 4) {
			toSession.sendMessage(sendMsg);
			session.sendMessage(sendMsg);
			matchingChatRoomService.insertChatContent(messageDto);
			matchingChatRoomService.getChatRead(messageDto.getChatidx());
		} else {
			session.sendMessage(sendMsg);
			matchingChatRoomService.insertChatContent(messageDto);
		}

		// 메세지 알람 전용 세션
		ChatAlarmDto chatAlarmDto = gson.fromJson(message.getPayload(), ChatAlarmDto.class);
		Iterator<WebSocketSession> itr = roomList.keySet().iterator();
		while (itr.hasNext()) {
			WebSocketSession memberSession = (WebSocketSession) itr.next();
			if (roomList.size() == 3) {
				chatAlarmDto.setAlarm("알람");
				TextMessage sendMsgs = new TextMessage(gson.toJson(chatAlarmDto));
				memberSession.sendMessage(sendMsgs);
			}
		}
	}

	// 클로즈 될때.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String chatNick = (String) session.getAttributes().get("chatSession");

		list.remove(session);
		mapList.remove(session.getId());
		roomList.remove(session);
		logger.info("{}연결 끊김", session.getId() + chatNick);
	}

}
