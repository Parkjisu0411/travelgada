package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gada.travelgada.domain.ProductCountVO;

@Mapper
public interface AdminMapper_sales {
	
	public int selectBuyByMonth(@Param("year") String year, @Param("month") String month);
	
	public int selectBuyByDay(@Param("year") String year, @Param("month") String month, @Param("day") String day);
	
	public List<ProductCountVO> selectProductCount();

	public List<ProductCountVO> selectProductCountByMonth(@Param("year") String year, @Param("month") String month);
}
