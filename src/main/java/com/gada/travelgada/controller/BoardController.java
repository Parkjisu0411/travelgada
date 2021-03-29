package com.gada.travelgada.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class BoardController {

	private BoardService boardService;
	
	@GetMapping("/board/review")
	public ModelAndView reviewBoard(ModelAndView modelAndView) {
		//modelAndView.addObject("boardList", boardService.getReviewBoard());
		modelAndView.setViewName("/board/review");
		return modelAndView;
	}
	
	@GetMapping("/board/qna")
	public ModelAndView qnaBoard(ModelAndView modelAndView) {
		modelAndView.setViewName("/board/Q&A");
		return modelAndView;
	}
	
	@GetMapping("/board/accompany")
	public ModelAndView accompanyBoard(ModelAndView modelAndView) {
		modelAndView.setViewName("/board/accompany");
		return modelAndView;
	}
}
