package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.domain.TodoVO;
import com.gada.travelgada.mapper.TodoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class TodoServiceImpl implements TodoService {
	private TodoMapper mapper;
	
	@Override
	public List<TodoVO> todoList() {
		log.info("todoList()");
		return mapper.todoList();
	}

	@Override
	public List<ProductVO> productList() {
		log.info("productList()");
		return mapper.productList();
	}

	@Override
	public List<PlannerVO> getPlanner() {
		log.info("getPlanner()");
		return mapper.getPlanner();
	}

	@Override
	public List<TodoTypeVO> getTodoTitle(int planner_id) {
		log.info("getTodoTitle()");
		return mapper.getTodoTitle(planner_id);
	}

	@Override
	public List<TodoVO> getTodoName() {
		log.info("getTodoName()");
		return mapper.getTodoName();
	}

	@Override
	public void delete_todoName(int todo_id) {
		log.info("delete_todoName()");
		mapper.delete_todoName(todo_id);
	}


	@Override
	public void delete_todoTitle(int todo_type_id) {
		log.info("delete_todoTitle()");
		mapper.delete_allTodoName(todo_type_id);
		mapper.delete_todoTitle(todo_type_id);
	}



//	@Override
//	public List<TodoTypeVO> getRecentTodoTypeId() {
//		log.info("getRecentTodoTypeId()");
//		return mapper.getRecentTodoTypeId();
//	}

	@Override
	public void addTodoType(TodoTypeVO todoTypeVO) {
		log.info("addTodoType()");
		mapper.addTodoType(todoTypeVO);
	}

	@Override
	public void addToDo(TodoVO todoVO) {
		log.info("addToDo()");
		mapper.addToDo(todoVO);		
	}
	
	@Override
	public TodoVO getRecentTodo(TodoVO todoVO) {
		log.info("getRecentTodo()");
		return mapper.getRecentTodo(todoVO);		
	}

	@Override
	public void todo_name_modify(TodoVO todoVO) {
		log.info("todo_name_modify()");
		mapper.todo_name_modify(todoVO);				
	}

	@Override
	public TodoVO todo_view(int todo_id) {
		log.info("todo_view()");
		return mapper.todo_view(todo_id);
	}

	
	@Override
	public int getRecentTodoTypeId() {
		log.info("getRecentTodoTypeId()");
		return mapper.getRecentTodoTypeId();
	}
	
	@Override
	public TodoTypeVO getRecentTodoType(TodoTypeVO todoTypeVO) {
		return mapper.getRecentTodoType(todoTypeVO);
	}

	@Override
	public List<TodoTypeVO> getTodoByPlanner(int planner_id) {
		return mapper.getTodoByPlanner(planner_id);
	}
	
}