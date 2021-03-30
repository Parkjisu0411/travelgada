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
}
