package com.gada.travelgada.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.domain.TodoVO;
import com.gada.travelgada.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class BoardController {
	private BoardService boardService;
	
	@GetMapping("/board/review")
	public ModelAndView reviewBoard(ModelAndView modelAndView, CriteriaVO cri, @AuthenticationPrincipal MemberDetails member) {
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		
		log.info("reviewBoard");
		modelAndView.setViewName("/board/review");
		//modelAndView.addObject("boardReviewList", boardService.getReviewBoard(cri.getNowPage(), cri.getAmount()));
		//modelAndView.addObject("boardNoticeList", boardService.getNotice(cri.getNowPage(), cri.getAmount()));
		modelAndView.addObject("boardReviewList", boardService.getReviewBoard(nowPage, cri.getAmount()));
		modelAndView.addObject("boardNoticeList", boardService.getNotice());
		modelAndView.addObject("userName", member.getUsername());
		
		int total = boardService.getTotalReviewBoard(cri);
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
	@GetMapping("/board/qna")
	public ModelAndView qnaBoard(ModelAndView modelAndView, CriteriaVO cri) {
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		
		log.info("qnaBoard");
		modelAndView.setViewName("/board/Q&A");
		modelAndView.addObject("boardQnAList", boardService.getQnABoard(nowPage, cri.getAmount()));
		modelAndView.addObject("boardNoticeList", boardService.getNotice());
		
		int total = boardService.getTotalQnABoard(cri);
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
	@GetMapping("/board/accompany")
	public ModelAndView accompanyBoard(ModelAndView modelAndView, CriteriaVO cri) {
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		
		log.info("accompanyBoard");
		modelAndView.setViewName("/board/accompany");
		modelAndView.addObject("boardAccompanyList", boardService.getAccompanyBoard(nowPage, cri.getAmount()));
		modelAndView.addObject("boardNoticeList", boardService.getNotice());
		
		int total = boardService.getTotalAccompanyBoard(cri);
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
	
	@GetMapping("/board/{board_id}&{member_id}")
	public ModelAndView boardContentView(ModelAndView modelAndView, MemberVO memberVO, BoardVO boardVO) {

		log.info("boardContentView");
		log.info("확인!!!!!!" + memberVO.getProfile_img_path());
		
	
		modelAndView.setViewName("/board/board_content_view");
		//modelAndView.addObject("bContentView", boardService.boardContentView(boardVO.getBoard_id(), memberVO.getMember_id()));
		//modelAndView.addObject("bContentView", boardService.boardContentView(memberVO));
		modelAndView.addObject("bContentView", boardService.boardContentView(boardVO));
		modelAndView.addObject("bImgPath", boardService.boardImgPath(memberVO));
		
		return modelAndView;
	}
	
	
	@GetMapping("/board")
	//@GetMapping("/board/{board_type_id}")
	public ModelAndView boardWriteView(ModelAndView modelAndView) {

		log.info("boardWriteView");
		//log.info(member.getName());
		//log.info("" + boardVO.getBoard_type_id());
		
		//String member_id = member.getName();
		//Integer board_type_id = (Integer)boardVO.getBoard_type_id();

		modelAndView.setViewName("/board/board_write_view");
		//modelAndView.addObject("bWriteView", member_id);
		//modelAndView.addObject("bWriteView", board_type_id);
		
		return modelAndView;
	}
	
	
	@PostMapping("/board")
	public ModelAndView writeBoard(ModelAndView modelAndView, BoardVO boardVO, @AuthenticationPrincipal MemberDetails member) {
		
		log.info("boardWrite");
		//log.info(member.getUsername());
		
		try {
			//boardService.writeBoard(boardVO, member.getUsername());
			boardService.writeBoard(boardVO);
			modelAndView.setViewName("/board/review");
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return modelAndView;
	}
	
	
	
	
}
