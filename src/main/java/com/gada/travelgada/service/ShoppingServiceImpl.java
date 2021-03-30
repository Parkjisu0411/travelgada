package com.gada.travelgada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.mapper.ShoppingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ShoppingServiceImpl {
	
	@Autowired
	private ShoppingMapper shoppingMapper;
	
	public List<ProductVO> getProduct() {
		return shoppingMapper.selectProduct();
	}

}
