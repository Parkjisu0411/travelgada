package com.gada.travelgada.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlannerVO {

	private int planner_id;
	private Date start_date;
	private Date end_date;
	private String planner_name;
	private int satisfaction;
	private String member_id;

	private List<ScheduleVO> scheduleVO;
}