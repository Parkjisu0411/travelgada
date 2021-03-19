package com.gada.travelgada.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.TodoVO;
import com.gada.travelgada.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
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
		mav.addObject("planner", service.getPlanner());

		return mav;
	}
	
	@PostMapping("/addToDo")
	public ResponseEntity<String> addToDo(@RequestBody TodoVO todoVO) throws Exception{
		ResponseEntity<String> entity = null;
		
		log.info("addToDo");
		
		try {
			service.addToDo(todoVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}