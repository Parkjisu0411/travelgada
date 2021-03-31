package com.gada.travelgada.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.ShippingLocVO;
import com.gada.travelgada.mapper.ShippingLocMapper;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
@Service
public class ShippingLocServiceImpl {
	
	@Autowired
	private ShippingLocMapper shippingLocMapper;
	
	public ShippingLocVO getShippingLoc(String member_id, String shipping_loc_name) {
		return shippingLocMapper.selectShippingLoc(member_id, shipping_loc_name);
	}
	
	public void deleteShippingLoc(ShippingLocVO shippingLocVO) {
		shippingLocMapper.deleteShippingLoc(shippingLocVO);
	}

	public void saveShippingLoc(ShippingLocVO shippingLocVO) {
		ShippingLocVO shipping = shippingLocMapper.selectShippingLoc(shippingLocVO.getMember_id(), shippingLocVO.getShipping_loc_name());
		if(shipping == null) {
			shippingLocMapper.insertShippingLoc(shippingLocVO);
		} else {
			shippingLocMapper.updateShippingLoc(shippingLocVO);
		}
	}

}