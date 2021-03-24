package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.domain.TodoVO;

@Mapper
public interface TodoMapper {

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
	
	//public void addToDo(String todo_name, int getRecentTodoTypeId);

	
	
	//public void addToDo(TodoVO todoVO, int getRecentTodoTypeId);

	//public void addTodoType(int planner_id, String todo_title);

	




	//public void addToDoType(TodoTypeVO todoTypeVO);

	//public void addToDo(String todo_name, int todo_type_id);

	//public void addToDoType(TodoTypeVO todoTypeVO);

	//public void addToDo(@Param("todo_name") String todo_name, @Param("todo_type_id") int todo_type_id);





}