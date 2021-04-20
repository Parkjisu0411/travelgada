package com.gada.travelgada.domain;

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
public class CountryVO {
	
	private String country_code;
	private String country_name;
	private String capital;
	private double latitude;
	private double longitude;
	
}
