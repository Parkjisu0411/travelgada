package com.gada.travelgada.domain;

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
public class BuyDetailVO {
	
	private int buy_detail_id;
	private String product_name;
	private int price;
	private int quantity;
	private String buy_id;
	private int product_id;
	
}