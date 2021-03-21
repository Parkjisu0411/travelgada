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

	public void addToDoType(TodoTypeVO todoTypeVO);

	public void addToDo(@Param("todo_name") String todo_name, @Param("todo_type_id") int todo_type_id);

	public void delete_todoTitle(int todo_type_id);


}