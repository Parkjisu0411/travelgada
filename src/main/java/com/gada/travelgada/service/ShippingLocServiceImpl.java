package com.gada.travelgada.service;

import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.mapper.ShippingLocMapper;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
@Service
public class ShippingLocServiceImpl {
	
	private ShippingLocMapper shippingLocMapper;
	
	public void deleteShippingLoc(ShippingLocVO shippingLocVO) {
		
	}

}