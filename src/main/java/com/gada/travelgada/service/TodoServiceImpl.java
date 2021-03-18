package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.ProductDomain;
import com.gada.travelgada.domain.TodoDomain;
import com.gada.travelgada.mapper.TodoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class TodoServiceImpl implements TodoService {
	private TodoMapper mapper;
	
	@Override
	public List<TodoDomain> todoList() {
		log.info("todoList()");
		return mapper.todoList();
	}

	@Override
	public List<ProductDomain> productList() {
		log.info("productList()");
		return mapper.productList();
	}

	@Override
	public void addToDo(TodoDomain todoDomain) {
		log.info("addToDo()");
		mapper.addToDo(todoDomain);
	}

  
}