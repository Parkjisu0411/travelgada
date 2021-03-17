package com.gada.travelgada.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
public class TodoController {
	@Autowired
	private TodoService service;
	
	@GetMapping("/todo")
	public ModelAndView todo(ModelAndView mav) throws Exception{
		log.debug("todo()");
		log.info("todo()");
		
		mav.setViewName("todo");
		mav.addObject("todolist", service.todoList());
		
		mav.addObject("productList", service.productList());
		
		return mav;
	}
}