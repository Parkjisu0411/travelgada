package com.gada.travelgada.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CriteriaVO {
	private int nowPage;
	private int amount;
	private String dateFilter;
	
	public CriteriaVO() {
		this(1, 10);
	}

	public CriteriaVO(int nowPage, int amount) {
		this.nowPage = nowPage;
		this.amount = amount;
	}
	
	public CriteriaVO(int nowPage, int amount, String dateFilter) {
		this.nowPage = nowPage;
		this.amount = amount;
		this.dateFilter = dateFilter;
	}
	
}
