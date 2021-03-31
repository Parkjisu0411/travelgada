package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.ProductVO;

@Mapper
public interface ShoppingMapper {
	
	public ProductVO selectProduct(int product_id);
	
	public List<ProductVO> selectProductByTypeWithSorting(@Param("product_type_id") int product_type_id, @Param("order") String order);
	
	public List<ProductVO> selectProductList();
	
}
