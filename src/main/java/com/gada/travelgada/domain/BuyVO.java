package com.gada.travelgada.domain;

import java.util.Date;
import java.util.List;

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
public class BuyVO {
	
	private String buy_id;
	private Date buy_date;
	private String waybill_num;
	private String member_id;
	private String shipping_loc_name;
	private int paid_amount;
	private List<BuyDetailVO> details;
	
}