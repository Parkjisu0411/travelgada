package com.gada.travelgada.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.ShippingLocVO;

@Mapper
public interface ShippingLocMapper {

	public void deleteShippingLoc(ShippingLocVO shippingLocVO);
	
	public ShippingLocVO selectShippingLoc(@Param("member_id") String member_id, @Param("shipping_loc_name") String shipping_loc_name);
	
	public void insertShippingLoc(ShippingLocVO shippingLocVO);
	
	public void updateShippingLoc(ShippingLocVO shippingLocVO);
	
}
