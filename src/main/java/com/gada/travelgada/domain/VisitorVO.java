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
public class VisitorVO {
	
	private int visitor_id;
	private Date visit_dat;
	
}
