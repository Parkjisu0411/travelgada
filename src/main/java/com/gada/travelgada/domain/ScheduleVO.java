package com.gada.travelgada.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleVO {

	private int budget;
	private int planner_id;
	private Date schedule_date;
	private int schedule_id;
	private int schedule_type_id;
	private String schedule_content;

}