package com.gada.travelgada.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class TodoTypeDomain {
	private int todo_type_id;
	private String todo_title;
	private int planner_id;
}
   