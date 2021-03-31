package com.gada.travelgada.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class BoardController {
	private BoardService boardService;
	
//	@GetMapping("/board/review")
//	public ModelAndView reviewBoard(ModelAndView modelAndView) {
//		modelAndView.addObject("boardReviewList", boardService.getReviewBoard());
//		modelAndView.setViewName("/board/review");
//		return modelAndView;
//	}
//	
//	@GetMapping("/board/qna")
//	public ModelAndView qnaBoard(ModelAndView modelAndView) {
//		modelAndView.addObject("boardQnAList", boardService.getQnABoard());
//		modelAndView.setViewName("/board/Q&A");
//		return modelAndView;
//	}
//	
//	@GetMapping("/board/accompany")
//	public ModelAndView accompanyBoard(ModelAndView modelAndView) {
//		modelAndView.addObject("boardAccompanyList", boardService.getAccompanyBoard());
//		modelAndView.setViewName("/board/accompany");
//		return modelAndView;
//	}
	
	@GetMapping("/board/review")
	public ModelAndView reviewBoard(ModelAndView modelAndView, CriteriaVO cri) {
		int nowPage = cri.getNowPage() - 1;
		
		log.info("reviewBoard");
		modelAndView.setViewName("/board/review");
		modelAndView.addObject("boardReviewList", boardService.getReviewBoard(nowPage, cri.getAmount()));
		
		int total = boardService.getTotalReviewBoard(cri);
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
	@GetMapping("/board/qna")
	public ModelAndView qnaBoard(ModelAndView modelAndView, CriteriaVO cri) {
		int nowPage = cri.getNowPage() - 1;
		
		log.info("qnaBoard");
		modelAndView.setViewName("/board/Q&A");
		modelAndView.addObject("boardQnAList", boardService.getQnABoard(nowPage, cri.getAmount()));
		
		int total = boardService.getTotalQnABoard(cri);
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
	@GetMapping("/board/accompany")
	public ModelAndView accompanyBoard(ModelAndView modelAndView, CriteriaVO cri) {
		int nowPage = cri.getNowPage() - 1;
		
		log.info("accompanyBoard");
		modelAndView.setViewName("/board/accompany");
		modelAndView.addObject("boardAccompanyList", boardService.getAccompanyBoard(nowPage, cri.getAmount()));
		
		int total = boardService.getTotalAccompanyBoard(cri);
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
	@GetMapping("/board/{board_id}")
	public ModelAndView boardContentView(ModelAndView modelAndView, BoardVO boardVO) {
		
		log.info("boardContentView");
		modelAndView.setViewName("/board/board_content_view");
		modelAndView.addObject("bContentView", boardService.boardContentView(boardVO.getBoard_id()));
		
		return modelAndView;
	}
	
	
}
