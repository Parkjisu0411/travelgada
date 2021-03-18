package com.gada.travelgada.service;

import java.util.List;

import com.gada.travelgada.domain.ProductDomain;
import com.gada.travelgada.domain.TodoDomain;

public interface TodoService {

	public List<TodoDomain> todoList();

	public List<ProductDomain> productList();

	public void addToDo(TodoDomain todoDomain);



  
}