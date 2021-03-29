<<<<<<< HEAD
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
=======
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
	private double latitude;
	private double longitude;
	private int schedule_order;

}
>>>>>>> 39e5e13d84f1493bfbeed7085aa1bac272a136a9
