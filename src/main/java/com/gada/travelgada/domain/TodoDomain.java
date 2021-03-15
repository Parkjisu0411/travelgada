package com.gada.travelgada.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class TodoDomain {
	private int todo_id;
	private String todo_name;
	private int complete_flag;
	private int todo_type_id;
}
