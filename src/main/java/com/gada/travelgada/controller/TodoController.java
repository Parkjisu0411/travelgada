package com.gada.travelgada.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.domain.TodoVO;
import com.gada.travelgada.service.PlannerService;
import com.gada.travelgada.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class TodoController {
	
	@Autowired
	private TodoService service;
	private PlannerService plannerService;
	
	@GetMapping("/todo")
	public ModelAndView todo(ModelAndView mav, @AuthenticationPrincipal MemberDetails member, TodoTypeVO todoTypeVO) throws Exception{
		log.debug("todo()");
		log.info("todo()");
		
		if(member.getPlanner_id() == 0) {
			mav.setViewName("redirect:/planner");
			return mav;
		} else {
			mav.addObject("planner", plannerService.getPlannerById(member.getPlanner_id()));
			mav.addObject("todoTypeList", service.getTodoByPlanner(member.getPlanner_id()));
			mav.setViewName("todo/todo");
			return mav;
		}
	}
	
	
	@DeleteMapping("/todo/{todo_id}")
	public ResponseEntity<String> delete_todoName(TodoVO todoVO) {
		ResponseEntity<String> entity = null;
		log.info("delete_todoName");
		try {
		   service.delete_todoName(todoVO.getTodo_id());
		      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		  return entity;
	}
	
	
	@DeleteMapping("/todoTitle/{todo_type_id}")
	public ResponseEntity<String> delete_todoTitle(TodoTypeVO todoTypeVO) {
		ResponseEntity<String> entity = null;
		log.info("delete_todoTitle");
		try {
			service.delete_todoTitle(todoTypeVO.getTodo_type_id());
		   entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}   
	
	// TodoType(카테고리) 추가하기 
	@PostMapping("/todoTitle")
	public ResponseEntity<TodoTypeVO> addTodoType(@RequestBody TodoTypeVO todoTypeVO) {
		ResponseEntity<TodoTypeVO> entity = null;
		try {
			service.addTodoType(todoTypeVO);
			TodoTypeVO todoType = service.getRecentTodoType(todoTypeVO);
			entity = new ResponseEntity<TodoTypeVO>(todoType, HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<TodoTypeVO>(todoTypeVO, HttpStatus.BAD_REQUEST);
			log.info("ERROR Message : " + e.getMessage());
		}
		return entity;
	}
	
	@PostMapping("/todo")
	public ResponseEntity<TodoVO> addToDo(@RequestBody TodoVO todoVO) throws Exception {
		ResponseEntity<TodoVO> entity = null;
	   
	   log.info("addToDo");
	   
	   try {
		   
		   service.addToDo(todoVO);
		   TodoVO todo = service.getRecentTodo(todoVO);
		   entity = new ResponseEntity<TodoVO>(todo, HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<TodoVO>(todoVO, HttpStatus.BAD_REQUEST);
			log.info("ERROR Message : " + e.getMessage());
		}
	   
	   return entity;
	 }
	
	 @GetMapping("/todo_modify/{todo_id}")
	 public ModelAndView todo_modify_view(ModelAndView mav, TodoVO todoVO) {
	    log.info("todo_modify_view();");

	    mav.addObject("todo_view", service.todo_view(todoVO.getTodo_id()));
	    mav.setViewName("todo/todo_modify_view");

	    return mav;

	 }
	
	@PutMapping("/todo/{todo_id}")
	public ResponseEntity<String> todo_name_modify(@RequestBody TodoVO todoVO) {
		ResponseEntity<String> entity = null;
		
		log.info("todo_name_modify");
		
		try {
			service.todo_name_modify(todoVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	
}