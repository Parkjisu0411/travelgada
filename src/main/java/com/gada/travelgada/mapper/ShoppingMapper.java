package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.ProductVO;

@Mapper
public interface ShoppingMapper {
	
	public List<ProductVO> selectProduct();
	
	public List<ProductVO> selectProductByType(int product_type_id);
	
}
