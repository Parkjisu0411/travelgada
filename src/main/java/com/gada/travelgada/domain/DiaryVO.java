package com.gada.travelgada.domain;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DiaryVO {
	
//	DIARY_ID   NOT NULL NUMBER         
//	IMG_PATH            VARCHAR2(2000) 
//	TEXT                VARCHAR2(1000) 
//	HASHTAG             VARCHAR2(2000) 
//	DIARY_DATE          DATE           
//	PLANNER_ID NOT NULL NUMBER   
	
	private int diary_id;
	private String img_path;
	private String text;
	private String hashtag;
	private Date diary_date;
	private int planner_id; 
	
}