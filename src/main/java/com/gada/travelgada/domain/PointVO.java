package com.gada.travelgada.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class PointVO {
	
	private int point_id;
	private String member_id;
	private int amount;
	private Date save_date;
	private int save_flag;
	
}