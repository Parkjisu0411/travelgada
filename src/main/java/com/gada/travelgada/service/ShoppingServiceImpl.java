package com.gada.travelgada.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.mapper.ShoppingMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ShoppingServiceImpl {
	
	@Autowired
	private ShoppingMapper shoppingMapper;
	
	public ProductVO getProduct(int proudct_id) {
		return shoppingMapper.selectProduct(proudct_id);
	}
	
	public List<ProductVO> getProductList() {
		return shoppingMapper.selectProductList();
	}

	public List<ProductVO> getProductByTypeWithSorting(int product_type_id, String sorter) {
		//sorter 종류 = salePriceAsc, salePriceDesc, saleCountDesc, latestAsc
		String order = null;
		switch(sorter) {
			case("salePriceAsc") :
				order = "price asc";
				break;
			case("salePriceDesc") :
				order = "price desc";
				break;
			case("saleCountDesc") :
				order = "count desc";
				break;
			case("latestAsc") :
				order = "added_date desc";
				break;
			default : 
					order = "product_name asc";
		}
		return shoppingMapper.selectProductByTypeWithSorting(product_type_id, order);
	}
	
	public List<ProductVO> getProductByTypeWithSortingAndPaging(int product_type_id, String sorter, int page) {
		String order = null;
		page = page * 9;
		switch(sorter) {
			case("salePriceAsc") :
				order = "price asc";
				break;
			case("salePriceDesc") :
				order = "price desc";
				break;
			case("saleCountDesc") :
				order = "count desc";
				break;
			case("latestAsc") :
				order = "added_date desc";
				break;
			default : 
				order = "product_name asc";
		}
		return shoppingMapper.selectProductByTypeWithSortingAndPaging(product_type_id, order, page);
	}

	public String getProductType(int product_type_id) {
		Map<Integer, String> typeMap = new HashMap<>();
		typeMap.put(1, "backpacks");
		typeMap.put(2, "luggage");
		typeMap.put(3, "bags");
		typeMap.put(4, "accessories");
		return typeMap.get(product_type_id);
	}
	
	public List<BuyVO> getBuyList(String member_id) {
		return shoppingMapper.selectBuyById(member_id);
	}
	
	public List<BuyDetailVO> getBuyDetailList(String buy_id) {
		return shoppingMapper.selectBuyDetailById(buy_id);
	}
	
	public BuyVO getBuyByDetail(BuyDetailVO buyDetailVO) {
		return shoppingMapper.selectBuy(buyDetailVO.getBuy_id());
	}
	
	public ProductVO getProductByDetail(BuyDetailVO buyDetailVO) {
		return shoppingMapper.selectProduct(buyDetailVO.getProduct_id());
	}
	
	public BuyVO getBuy(String buy_id) {
		return shoppingMapper.selectBuy(buy_id);
	}
	
	public void insertPaymentResult(BuyVO buyVO) {
		shoppingMapper.insertPaymentResult(buyVO);
	}
	
	public void insertPaymentResultDetail(BuyDetailVO buyDetailVO) {
		shoppingMapper.insertPaymentResultDetail(buyDetailVO);
	}
}
