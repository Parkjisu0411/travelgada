package com.gada.travelgada.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.TodoListVO;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.domain.TodoVO;
import com.gada.travelgada.service.ScheduleService;
import com.gada.travelgada.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class TodoController {
	@Autowired
	private TodoService service;
	private ScheduleService scheduleService;
	
	@GetMapping("/todo")
	public ModelAndView todo(ModelAndView mav, @AuthenticationPrincipal MemberDetails member, TodoTypeVO todoTypeVO) throws Exception{
		log.debug("todo()");
		log.info("todo()");
		
		List<PlannerVO> plannerList = scheduleService.selectPlanner(member.getUsername());
		PlannerVO planner = plannerList.get(0);
		
		mav.setViewName("todo");
		//mav.addObject("todolist", service.todoList());
		mav.addObject("productList", service.productList());
		
		mav.addObject("plannerList", plannerList);
		mav.addObject("todoTitle", service.getTodoTitle(planner.getPlanner_id()));
		mav.addObject("todoName", service.getTodoName());
		mav.addObject("getPlannerId", planner.getPlanner_id());
		mav.addObject("getTodoTypeId", todoTypeVO.getTodo_type_id());
		mav.addObject("getRecentTodoTypeId", service.getRecentTodoTypeId());
		
		return mav;
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
	
	
	// TodoTypeVO todoTypeVO, TodoVO todoVO
	// TodoListVO todoListVO
	
	@PostMapping("/addTodoType")
	public ResponseEntity<String> addTodoType(@RequestBody TodoTypeVO todoTypeVO) throws Exception{
		ResponseEntity<String> entity = null;
		
		log.info("addTodoType");
		
		try {
			service.addTodoType(todoTypeVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
//	@PostMapping("/addToDo")
//	public ResponseEntity<String> addToDo(@RequestBody TodoVO todoVO, @RequestParam("todo_name") String todo_name, @RequestParam("getRecentTodoTypeId") int getRecentTodoTypeId) throws Exception{
//		ResponseEntity<String> entity = null;
//		
//		log.info("addToDo");
//		log.info("" + service.getRecentTodoTypeId());
//		
//		try {
//			//service.addToDo(todoTypeVO, todoVO);
//			//service.addToDo(todoVO, getRecentTodoTypeId);
//			//service.addToDo(todo_name, getRecentTodoTypeId);
//		      todoVO.setTodo_name(todo_name);
//		      todoVO.setTodo_type_id(getRecentTodoTypeId);
//		     service.addToDo(todoVO);
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		}catch(Exception e){
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
	
//	   @PostMapping("addToDo")
//	   public ModelAndView addToDo(ModelAndView mav, @RequestParam("todo_name") String todo_name, @RequestParam("getRecentTodoTypeId") int getRecentTodoTypeId, TodoVO todoVO) throws Exception {
//	      log.info("addToDo");
//
//	      todoVO.setTodo_name(todo_name);
//	      todoVO.setTodo_type_id(getRecentTodoTypeId);
//	     service.addToDo(todoVO);
//	     mav.setViewName("redirect:todo");
//
//	      return mav;
//	   }
	
	   @PostMapping("addToDo")
	   public ModelAndView addToDo(ModelAndView mav, TodoVO todoVO, TodoTypeVO todoTypeVO) throws Exception {
	      log.info("addToDo");
	      
//	      String tn = service.getCategoryId;
//	      log.info(tn);
//
	     todoVO.setTodo_name(todoVO.getTodo_name());
	     todoVO.setTodo_type_id(todoTypeVO.getTodo_type_id());
	     service.addToDo(todoVO);
	     mav.setViewName("redirect:todo");

	      return mav;
	   }
}