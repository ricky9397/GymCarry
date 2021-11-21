package com.project.gymcarry.chatting.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gymcarry.carrylike.CarryLikeDto;
import com.project.gymcarry.chatting.ChatListDto;
import com.project.gymcarry.chatting.ChatRoomDto;
import com.project.gymcarry.chatting.MessageDto;
import com.project.gymcarry.dao.MatchingDao;
import com.project.gymcarry.member.SessionDto;

@Service
public class MatchingChatRoomServiceImpl implements MatchingChatRoomService {

	@Autowired
	private SqlSessionTemplate template;

	private MatchingDao dao;

	// 멤버 채팅방 리스트
	@Override
	public List<ChatListDto> getChatList(int memIdx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectChatList(memIdx);
	}

	// 캐리 채팅방 리스트
	@Override
	public List<ChatListDto> getChatLists(int cridx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectCarryChatList(cridx);
	}

	// 대화 리스트
	@Override
	public List<ChatRoomDto> getChatIdx(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectChattingList(chatidx);
	}

	// 멤버 대화 리스트
	@Override
	public List<ChatRoomDto> getMemberMessage(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectMemberMessageList(chatidx);
	}

	// 채팅방 생성
	@Override
	public int getAddChatRoom(int cridx, int memidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.insertAddChatRoom(cridx, memidx);
	}

	// 사용자 아이디로 채팅룸 가져오기
	@Override
	public ChatListDto getByChatRoom(int cridx, int memidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectByChatRoom(cridx, memidx);
	}

	// 채팅룸 중복확인
	@Override
	public int getByChatIdx(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectByChatIdx(chatidx);
	}

	// 대화내용 저장
	public int insertChatContent(MessageDto messageDto) {
		dao = template.getMapper(MatchingDao.class);
		return dao.insertChatContent(messageDto);
	}

	// 읽음 안읽음 여부
	@Override
	public int getChatRead(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.updateChatRead(chatidx);
	}

	// 하트체크
	@Override
	public CarryLikeDto getCheckLike(int memidx, int cridx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectLike(memidx, cridx);
	}

	// 하트최초생성
	@Override
	public int getChatLike(int memidx, int cridx, int likecheck) {
		dao = template.getMapper(MatchingDao.class);
		return dao.insertLike(memidx, cridx, likecheck);
	}

	// 하트생성 & 취소
	@Override
	public int updateChatLike(int likecheck, int memidx, int cridx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.updateLike(likecheck, memidx, cridx);
	}

	// 멤버 방나가기
	@Override
	public int getOutChatRoom(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.updateOutChat(chatidx);
	}

	// 멤버 나간방 다시 들어가기
	@Override
	public int getInChatRoom(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.updateInChat(chatidx);
	}

	// 캐리 방나가기
	@Override
	public int getOutCarryChatRoom(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.updateCarryOutChat(chatidx);
	}

	// 방인원수 0 되면 삭제
	@Override
	public int deleteChatRoom(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		ChatListDto dto = dao.selectRoomCount(chatidx);
		int result = 0;
		if (chatidx == dto.getChatidx() && dto.getOutcount() == 0) {
			result = dao.deleteChatRoom(chatidx);
		}
		return result;
	}

	// 방count 가져옴
	public ChatListDto selectRoomCount(int chatidx) {
		dao = template.getMapper(MatchingDao.class);
		return dao.selectRoomCount(chatidx);
	}

}
