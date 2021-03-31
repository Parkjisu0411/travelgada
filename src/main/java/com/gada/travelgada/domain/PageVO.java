package com.gada.travelgada.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class PageVO {
	private int startPage, endPage, total;
	private CriteriaVO cri;
	private boolean prev, next;
	
	public PageVO(CriteriaVO cri, int total) {
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)(Math.ceil(cri.getNowPage() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if(realEnd <= endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = realEnd > this.endPage;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance().queryParam("nowPage", page).queryParam("amount", cri.getAmount()).build();

		return uriComponentsBuilder.toString();
	}
	
}
