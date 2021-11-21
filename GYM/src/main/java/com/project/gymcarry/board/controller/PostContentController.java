package com.project.gymcarry.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.gymcarry.board.BoardLikeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.gymcarry.board.BoardDto;
import com.project.gymcarry.board.comment.CommentDto;
import com.project.gymcarry.board.comment.service.CommentService;
import com.project.gymcarry.board.service.BoardService;
import com.project.gymcarry.member.SessionDto;

@Controller
@RequestMapping
public class PostContentController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private CommentService commentService;

	// 게시판 상세 페이지
	@GetMapping("community/postContent")
	public String boardDetail(@RequestParam("postidx") int postidx, Model model, HttpSession session) throws Exception {
		// 게시물 내용 출력
		BoardDto boardDetail = boardService.getBoardDetail(postidx);
		model.addAttribute("boardDetail", boardDetail);

		// 조회수 증가
		boardService.updateViewCnt(postidx);

		// 댓글 리스트 출력
		List<CommentDto> commList = commentService.getCommList(postidx);
		model.addAttribute("commList", commList);

		// 게시물 좋아요
		SessionDto dto = (SessionDto) session.getAttribute("loginSession");

		int checkResult = 0;
		// 로그인 된 상태
		if (dto != null) {
			int memidx = dto.getMemidx();

			System.out.println("memidx = " + memidx);
			System.out.println("postidx = " + postidx);

			// 로그인 한 아이디가 해당 게시물 좋아요 여부 확인
			BoardLikeDto myCheck = boardService.getBoardLike(postidx, memidx);

			// null이 아니면 좋아요 체크한 상태
			if (myCheck != null) {
				checkResult = 1;
			}
		}

		model.addAttribute("checkResult", checkResult);

		// 게시물 좋아요 갯수 출력
		List<BoardLikeDto> likeLength = boardService.getBoardLikeLength(postidx);
		model.addAttribute("likeLength", likeLength.size());

		return "community/postContent";
	}

	// 게시물 삭제
	@GetMapping("community/delete")
	public String deleteBoard(@RequestParam("postidx") int postidx) throws Exception {

		boardService.getDeleteBoard(postidx);

		return "redirect:/community/boardList";
	}

	// 댓글 등록
	@PostMapping("/insertComm")
	@ResponseBody
	public int insertComm(HttpServletRequest request) {
		int result = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postidx", request.getParameter("postidx"));
		map.put("commentnick", request.getParameter("membernick"));
		map.put("commentcontent", request.getParameter("commContent"));

		try {
			result = commentService.insertComm(map);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}

	// 댓글 리스트 ajax
	@ResponseBody
	@RequestMapping(value = "/selectReplyList", produces = "application/json; charset=utf-8")
	public String selectReplyList(int postidx, Model model) {

		// ajax에서 에러를 처리해줌으로
		// try catch를 안해줘도됨(다른방법도 있음)
		List<CommentDto> commList = commentService.getCommList(postidx);

		model.addAttribute("commCount", commList.size());

		// JSON으로 담아도 되지만 편한 방법인 GSON으로 사용

		// yyyy-MM-dd hh:mm:ss
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm").create();

		return gson.toJson(commList);
	}

	// 게시물 좋아요 off
	@PostMapping("/likeOff")
	@ResponseBody
	public int deleteLike(HttpServletRequest request, Model model) throws Exception {

		int result = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postidx", request.getParameter("postidx"));
		map.put("memidx", request.getParameter("memidx"));

		result = boardService.getBoardLikeOff(map);

		return result;
	}

	// 게시물 좋아요 on
	@PostMapping("/likeOn")
	@ResponseBody
	public int insertLike(HttpServletRequest request, Model model) throws Exception {

		int result = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postidx", request.getParameter("postidx"));
		map.put("memidx", request.getParameter("memidx"));

		result = boardService.getBoardLikeOn(map);

		return result;
	}

	// 게시물 좋아요 갯수 조회 ajax
	@PostMapping("/likeIdx")
	@ResponseBody
	public int selectLikeLength(int postidx) throws Exception {

		List<BoardLikeDto> likeLength = boardService.getBoardLikeLength(postidx);

		return likeLength.size();
	}

}