package com.project.gymcarry.chatting.service;

import java.util.List;

import com.project.gymcarry.carrylike.CarryLikeDto;
import com.project.gymcarry.chatting.ChatListDto;
import com.project.gymcarry.chatting.ChatRoomDto;

public interface MatchingChatRoomService {

	ChatListDto getByChatRoom(int cridx, int memidx);

	int getByChatIdx(int chatidx);

	int getInChatRoom(int chatidx);

	int getAddChatRoom(int cridx, int memidx);

	List<ChatListDto> getChatList(int memidx);

	List<ChatListDto> getChatLists(int cridx);

	List<ChatRoomDto> getChatIdx(int chatidx);

	int getChatRead(int chatidx);

	CarryLikeDto getCheckLike(int memidx, int cridx);

	int getChatLike(int memidx, int cridx, int likecheck);

	int updateChatLike(int likecheck, int memidx, int cridx);

	int getOutChatRoom(int chatidx);

	int getOutCarryChatRoom(int chatidx);

	int deleteChatRoom(int chatidx);

	List<ChatRoomDto> getMemberMessage(int chatidx);

}
