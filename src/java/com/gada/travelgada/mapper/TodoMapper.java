package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.domain.TodoTypeVO;
import com.gada.travelgada.domain.TodoVO;

@Mapper
public interface TodoMapper {

	public List<TodoVO> todoList();

	public List<ProductVO> productList();

	public void addToDo(TodoVO todoVO);

	public List<PlannerVO> getPlanner();

	public List<TodoTypeVO> getTodoTitle(int planner_id);

	public List<TodoVO> getTodoName();

	public void delete_todoName(int todo_id);


}