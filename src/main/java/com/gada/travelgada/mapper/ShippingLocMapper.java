package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.ShippingLocVO;

@Mapper
public interface ShippingLocMapper {

	public void deleteShippingLoc(ShippingLocVO shippingLocVO);
	
}
