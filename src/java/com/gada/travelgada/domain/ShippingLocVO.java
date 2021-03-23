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
public class ShippingLocVO {
	
	private String shipping_loc_name;
	private String member_id;
	private String receiver;
	private String receiver_phone_num;
	private String address;
	private String ziq_code;
	
}