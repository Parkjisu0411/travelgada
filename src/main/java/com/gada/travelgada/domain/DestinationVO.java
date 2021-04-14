package com.gada.travelgada.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DestinationVO {
	private int month;
	private long total;
	private String city;
	private double latitude;
	private double longitude;
}
