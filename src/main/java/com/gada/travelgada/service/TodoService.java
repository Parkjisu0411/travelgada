package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.domain.TodoVO;

public interface TodoService {

	public List<TodoVO> todoList();

	public List<ProductVO> productList();

	public List<PlannerVO> getPlanner();

	public List<TodoTypeVO> getTodoTitle(int planner_id);

	public List<TodoVO> getTodoName();

	public void delete_todoName(int todo_id);

	public void delete_todoTitle(int todo_type_id);

	public int getRecentTodoTypeId();

	public void addTodoType(TodoTypeVO todoTypeVO);

	public void addToDo(TodoVO todoVO);

	//public void addTodoType(int planner_id, String todo_title);

	//public void addToDo(int getRecentTodoTypeId, String todo_name);



	//public void addToDo(TodoTypeVO todoTypeVO, TodoVO todoVO);

	//public void addToDo(TodoTypeVO todoTypeVO, TodoVO todoVO);
	
	



  
}