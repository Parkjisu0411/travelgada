package com.gada.travelgada.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@AutoConfigureMockMvc
@SpringBootTest
public class DiaryControllerTest {
	
	   @Setter(onMethod_ = { @Autowired })
	   private WebApplicationContext ctx;
	   
	   private MockMvc mockMvc;

	   @Before
	   public void setup() {
	      this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	   }
	   
		@Test
		@WithUserDetails("gada")
		public void diaryTest() throws Exception {
			
			mockMvc.perform(get("/diary"))
				.andReturn()
				.getModelAndView()
				.getViewName();
			
		}
		
		@Test
		@WithUserDetails("gada")
		public void selectOtherPlannerTest() throws Exception {
			
			mockMvc.perform(get("/diary/1"))
				.andExpect(status().isOk())
				.andDo(print());
			
		}

		@Test
		@WithUserDetails("gada")
		public void diaryOtherTest() throws Exception {
			
			mockMvc.perform(get("/diary_other"))
				.andReturn()
				.getModelAndView()
				.getViewName();
			
		}

	   @Test
		public void diary_write_viewTest() throws Exception {
		   
			mockMvc.perform(get("/diary_write_view"))
				.andExpect(status().isOk())
				.andDo(print())
				.andExpect(forwardedUrl("/WEB-INF/views/diary/diary_write_view.jsp"));

		}
	   
	   @Test
	   @WithUserDetails("gada")
		public void diary_writeTest() throws Exception {
		   
			mockMvc.perform(fileUpload("/diary_write")
					.file("uploadfile", "테스트".getBytes() )
					.param("planner_id","1")
					.param("img_path", "테스트")
					.param("text", "테스트")
					.param("hashtag", "테스트"))
			.andReturn()
			.getModelAndView()
			.getViewName();

		}
	   
		@Test
		public void diary_modify_viewTest() throws Exception {
			
			mockMvc.perform(get("/diary_modify_view/2/1"))
				.andExpect(status().isOk())
				.andDo(print())
				.andExpect(forwardedUrl("/WEB-INF/views/diary/diary_modify_view.jsp"));
			
		}
		
	   @Test
	   @WithUserDetails("gada")
		public void diary_modifyTest() throws Exception {
		   
			mockMvc.perform(fileUpload("/diary_modify")
					.file("uploadfile", "테스트".getBytes() )
					.param("currImg", "25")
					.param("img_path", "테스트")
					.param("text", "테스트")
					.param("hashtag", "테스트")
					.param("diary_id", "25"))
			.andReturn()
			.getModelAndView()
			.getViewName();

		}

		@Test
		@WithUserDetails("gada")
		public void diary_deleteTest() throws Exception {
			
			mockMvc.perform(delete("/diary/4"))
				.andExpect(status().isOk())
				.andDo(print());
			
		}
		
}