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
public class MainVO {
	private long diary_Id;
	private String img_path;
	private String text;
	private String hashtag;
	private Date diary_date;
//	private long plannerId;
}
