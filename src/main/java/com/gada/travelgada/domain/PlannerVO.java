package com.gada.travelgada.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlannerVO {
	
//	PLANNER_ID   NOT NULL NUMBER       
//	START_DATE            DATE         
//	END_DATE              DATE         
//	PLANNER_NAME          VARCHAR2(50) 
//	SATISFACTION          NUMBER       
//	MEMBER_ID    NOT NULL VARCHAR2(20) 
	
	private int planner_id;
	private Timestamp start_date;
	private Timestamp end_date;
	private String planner_name;
	private int satisfaction ;
	private int member_id; 
	
}
