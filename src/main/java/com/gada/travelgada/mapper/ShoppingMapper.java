package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.domain.ProductVO;

@Mapper
public interface ShoppingMapper {
	
	public ProductVO selectProduct(int product_id);
	
	public BuyVO selectBuy(String buy_id);
	
	public List<ProductVO> selectProductByTypeWithSorting(@Param("product_type_id") int product_type_id, @Param("order") String order);
	
	public List<ProductVO> selectProductByTypeWithSortingAndPaging(@Param("product_type_id") int product_type_id, @Param("order") String order, @Param("page") int page);
	
	public List<ProductVO> selectProductList();
	
	public List<BuyVO> selectBuyById(String member_id);
	
	public List<BuyDetailVO> selectBuyDetailById(String buy_id);

	
}
