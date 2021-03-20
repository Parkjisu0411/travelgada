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
public class TodoTypeVO {
	private int todo_type_id;
	private String todo_title;
	private int planner_id;
	
	// private List<TodoDomain> todoType;
}
   