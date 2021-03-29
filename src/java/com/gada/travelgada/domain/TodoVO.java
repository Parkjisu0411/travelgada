package com.gada.travelgada.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class TodoVO {
	private int todo_id;
	private String todo_name;
	private int complete_flag;
	private int todo_type_id;
	
	private String todo_title;
	private int planner_id;
	
//	private List<TodoTypeVO> todoType;
//	
//	
//
//	public TodoDomain() {
//		super();
//	}
//
//	public TodoDomain(int todo_id, String todo_name, int complete_flag, int todo_type_id,
//			List<TodoTypeDomain> todoType) {
//		super();
//		this.todo_id = todo_id;
//		this.todo_name = todo_name;
//		this.complete_flag = complete_flag;
//		this.todo_type_id = todo_type_id;
//		this.todoType = todoType;
//	}
//
//	public int getTodo_id() {
//		return todo_id;
//	}
//
//	public void setTodo_id(int todo_id) {
//		this.todo_id = todo_id;
//	}
//
//	public String getTodo_name() {
//		return todo_name;
//	}
//
//	public void setTodo_name(String todo_name) {
//		this.todo_name = todo_name;
//	}
//
//	public int getComplete_flag() {
//		return complete_flag;
//	}
//
//	public void setComplete_flag(int complete_flag) {
//		this.complete_flag = complete_flag;
//	}
//
//	public int getTodo_type_id() {
//		return todo_type_id;
//	}
//
//	public void setTodo_type_id(int todo_type_id) {
//		this.todo_type_id = todo_type_id;
//	}
//
//	public List<TodoTypeDomain> getTodoType() {
//		return todoType;
//	}
//
//	public void setTodoType(List<TodoTypeDomain> todoType) {
//		this.todoType = todoType;
//	}
//
//	@Override
//	public String toString() {
//		return "TodoDomain [todo_id=" + todo_id + ", todo_name=" + todo_name + ", complete_flag=" + complete_flag
//				+ ", todo_type_id=" + todo_type_id + ", todoType=" + todoType + "]";
//	}
	
	
	
	
}
