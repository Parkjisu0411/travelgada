package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.domain.TodoVO;

public interface TodoService {

	public List<TodoVO> todoList();

	public List<ProductVO> productList();

	public void addToDo(TodoVO todoVO);

	public List<PlannerVO> getPlanner();

	public List<TodoTypeVO> getTodoTitle(int planner_id);

	public List<TodoVO> getTodoName();

	public void delete_todoName(int todo_id);



  
}