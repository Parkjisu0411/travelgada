package com.gada.travelgada.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.gada.travelgada.domain.TodoVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TodoServiceTest {
	
	@Autowired
	private TodoService todoService;
	
	@Test
	public void writeTodoTest() {
		TodoVO todoVO = new TodoVO();
		
		todoVO.setTodo_id(228);
		todoVO.setTodo_name("TEST");
		todoVO.setComplete_flag(0);
		todoVO.setTodo_type_id(199);
		
		todoService.addToDo(todoVO);
	}
}
