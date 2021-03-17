package com.gada.travelgada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gada.travelgada.domain.ProductDomain;
import com.gada.travelgada.domain.TodoDomain;

@Mapper
public interface TodoMapper {

	public List<TodoDomain> todoList();

	public List<ProductDomain> productList();




}