package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.ProductVO;
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
	public void addToDo(TodoVO todoVO) {
		log.info("addToDo()");
		mapper.addToDo(todoVO);
	}

  
}