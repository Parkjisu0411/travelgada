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

	//public List<TodoTypeVO> getRecentTodoTypeId();
	public int getRecentTodoTypeId();
	
	
	public void addTodoType(TodoTypeVO todoTypeVO);

	public void addToDo(TodoVO todoVO);
	public TodoVO getRecentTodo(TodoVO todoVO);

	public void delete_allTodoName(int todo_type_id);

	public void todo_name_modify(TodoVO todoVO);

	public TodoVO todo_view(int todo_id);
	
	public void deleteTodoByPlannerId(int planner_id);
	
	public void deleteTodoTypeByPlannerId(int planner_id);

	public TodoTypeVO getRecentTodoType(TodoTypeVO todoTypeVO);

	public List<TodoTypeVO> getTodoByPlanner(int planner_id);
}