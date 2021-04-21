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
public class BuyListVO {
	
	private int buy_detail_id;
	private String product_name;
	private int price;
	private int quantity;
	
	private BuyVO buy;
	private ProductVO product;
	
}