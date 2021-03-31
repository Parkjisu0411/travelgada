package com.gada.travelgada.domain;

public class TodoListVO {
	private TodoTypeVO todoTypeVO = new TodoTypeVO();
	private TodoVO todoVO = new TodoVO();
	
	public TodoListVO() {
		super();
	}

	public TodoListVO(TodoTypeVO todoTypeVO, TodoVO todoVO) {
		super();
		this.todoTypeVO = todoTypeVO;
		this.todoVO = todoVO;
	}

	public TodoTypeVO getTodoTypeVO() {
		return todoTypeVO;
	}

	public void setTodoTypeVO(TodoTypeVO todoTypeVO) {
		this.todoTypeVO = todoTypeVO;
	}

	public TodoVO getTodoVO() {
		return todoVO;
	}

	public void setTodoVO(TodoVO todoVO) {
		this.todoVO = todoVO;
	}

	@Override
	public String toString() {
		return "TodoListVO [todoTypeVO=" + todoTypeVO + ", todoVO=" + todoVO + "]";
	}
	
	
}