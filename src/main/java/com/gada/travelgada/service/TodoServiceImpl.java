package com.gada.travelgada.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
	public List<TodoDomain> todolist() {
		log.info("todolist()");
		return mapper.todolist();
	}

  
}