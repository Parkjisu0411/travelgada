package com.gada.travelgada.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class ShoppingControllerTest {
	
    @Setter(onMethod_ = { @Autowired })
    private WebApplicationContext ctx;
    
    @Autowired
    private MockMvc mockMvc;

    @Before
    public void setup() {
       this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

	@Test
	@WithUserDetails("gada")
	public void testShoppingResult() throws Exception {
		String shoppingResult = mockMvc.perform(MockMvcRequestBuilders.post("/shopping/order/result")
				.param("buy_id", "imp_1234567890")
				.param("shipping_loc_name", "집")
				.param("paid_amount", "1900")
				.param("product_name", "컴포트 에어목베개")
				.param("price", "1900")
				.param("quantity", "1")
				.param("product_id", "117")
				.param("accumulate_point", "95")
				.param("used_point", "0")
				).andReturn().getModelAndView().getViewName();
		log.info(shoppingResult);
	}
}