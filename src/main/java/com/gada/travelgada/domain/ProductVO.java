package com.gada.travelgada.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ProductVO {
	private int product_id;
	private String product_name;
	private int price;
	private Date added_date;
	private String img_path;
	private int amount;
	private int product_type_id;
}