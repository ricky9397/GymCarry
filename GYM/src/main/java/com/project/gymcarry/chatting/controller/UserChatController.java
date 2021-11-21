package com.project.gymcarry.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.gymcarry.carrylike.CarryLikeDto;
import com.project.gymcarry.chatting.ChatListDto;
import com.project.gymcarry.chatting.ChatRoomDto;
import com.project.gymcarry.chatting.service.MatchingChatRoomService;
import com.project.gymcarry.member.SessionDto;

@Controller
public class UserChatController {

	@Autowired
	private MatchingChatRoomService matchingChatRoomService;

	// 채팅 룸 생성 및 중복
	@GetMapping("chatting/chatInquire")
	public String chatInquire(@RequestParam("cridx") int cridx, @RequestParam("memidx") int memidx,
			RedirectAttributes redirectAttributes) {
		// 방번호 가져오기
		ChatListDto chatDto = matchingChatRoomService.getByChatRoom(cridx, memidx);
		if (chatDto != null) {
			// 방이 있으면 생성하지않고 채팅으로 이동
			int chatidx = matchingChatRoomService.getByChatIdx(chatDto.getChatidx());
			if (chatidx == 1) {
				if (chatDto.getOutcount() == 1) {
					// 나간채팅방 다시들어가기
					matchingChatRoomService.getInChatRoom(chatDto.getChatidx());
				}
				redirectAttributes.addAttribute("chatidx", chatDto.getChatidx());
				return "redirect:/chatting/chatList";
			}
		}
		
		// 캐리와의 중복 방이없을경우 채팅방생성
		matchingChatRoomService.getAddChatRoom(cridx, memidx);
		return "redirect:/chatting/chatList";
	}

	// 채팅룸 리스트
	@GetMapping("chatting/chatList")
	public String matching(Model model, HttpSession session) {
		SessionDto dto = (SessionDto) session.getAttribute("loginSession");
		List<ChatListDto> list = null;
		if (dto.getMemidx() != 0) {
			// 맴버가 접속했을때 채팅방
			list = matchingChatRoomService.getChatList(dto.getMemidx());
			model.addAttribute("chatList", list);
		} else if (dto.getCridx() != 0) {
			// 캐리가 접속했을때 채팅방
			list = matchingChatRoomService.getChatLists(dto.getCridx());
			model.addAttribute("carryChatList", list);
		}
		return "chatting/userChat";
	}

	// 채팅 대화리스트
	@PostMapping("chatting/dochat")
	@ResponseBody
	public Map<String, Object> chatList(@RequestParam("chatidx") int chatidx,HttpSession session) {
		SessionDto dto = (SessionDto) session.getAttribute("loginSession");
		
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<ChatRoomDto> chatList = null; 
		if(dto.getMemidx() != 0) {
			chatList = matchingChatRoomService.getMemberMessage(chatidx);
			mapList.put("memList", chatList);
		} else if(dto.getCridx() != 0) {
			chatList = matchingChatRoomService.getChatIdx(chatidx);
			mapList.put("crList", chatList);
		}
		matchingChatRoomService.getChatRead(chatidx);
		return mapList;
	}

	@GetMapping("chatting/like")
	@ResponseBody
	public int chatLike(@RequestParam("cridx") int cridx, HttpSession session) {

		SessionDto dto = (SessionDto) session.getAttribute("loginSession");
		int result = 0;
		int likecheck = 0;
		CarryLikeDto check = matchingChatRoomService.getCheckLike(dto.getMemidx(), cridx);
		if (check == null) {
			++likecheck;
			result = matchingChatRoomService.getChatLike(dto.getMemidx(), cridx, likecheck);
		} else if (check.getLikecheck() == 0) {
			++likecheck;
			result = matchingChatRoomService.updateChatLike(likecheck, dto.getMemidx(), cridx);
		} else if (check.getLikecheck() == 1) {
			matchingChatRoomService.updateChatLike(likecheck, dto.getMemidx(), cridx);
		}
		return result;
	}

	@GetMapping("chatting/delete")
	@ResponseBody
	public int chatDelete(@RequestParam("chatidx") int chatidx, HttpSession session) {
		SessionDto dto = (SessionDto) session.getAttribute("loginSession");
		int result = 0;
		if(dto.getMemidx() != 0) {
			result = matchingChatRoomService.getOutChatRoom(chatidx);
		} else {
			result = matchingChatRoomService.getOutCarryChatRoom(chatidx);
		}
		// 방인원수 0 되면 삭제
		result = matchingChatRoomService.deleteChatRoom(chatidx);
		return result;
	}
	
}
