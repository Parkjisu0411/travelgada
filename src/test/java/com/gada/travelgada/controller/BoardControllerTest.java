package com.gada.travelgada.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.assertj.core.util.Arrays;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gada.travelgada.domain.AnswerVO;
import com.gada.travelgada.domain.BoardVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@AutoConfigureMockMvc
//@WebMvcTest

//@WebAppConfiguration
@SpringBootTest

//@SpringBootConfiguration
public class BoardControllerTest {


		  // GetMapping Test
		  @Autowired
	      @Setter(onMethod_ = { @Autowired })
	      private WebApplicationContext ctx;		// MockMvc ?????? ????????? ?????? context
	      ObjectMapper mapper; // ????????? json ???????????? ?????? ??? ??????
	      LocalDateTime now = LocalDateTime.now();
	      Timestamp timestamp = Timestamp.valueOf(now);
	      
	      @Autowired
	      BoardController boardController;
	      
	      private MockMvc mockMvc;

	      @Before//?????? ???????????? ???, ????????? ???????????? ????????????.
	      public void setupForBoardListTest() {
	         this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	      }//????????? ????????? ????????????

	      @Test
	      public void BoardListTest() throws Exception {	         
	         mockMvc.perform(get("/board/1"))//get ????????????
	          .andExpect(status().isOk())//?????? ??????
	          .andDo(print())
	            .andExpect(forwardedUrl("/WEB-INF/views//board/review.jsp"));
	      }

	      // PostMapping Test
	      @Before // @Test ????????? ??????
	      public void setupForwriteReplyTest() {
	          this.mockMvc = MockMvcBuilders.standaloneSetup(boardController).build();
	          mapper = new ObjectMapper();
	      }
	      
	      @Test
	      //@WithUserDetails("gada")
	      public void writeReplyTest() throws Exception {
	          mockMvc.perform(post("/board/reply")        // Controller??? /test URI??? Post???????????? ??????
	                  .contentType(MediaType.APPLICATION_JSON_VALUE)    // contentType??? json ??????
	                  .content(mapper.writeValueAsString(         // ????????? json??? ??????. content?????? post??? body??? ?????????.
	                          new AnswerVO(
	                                  125,
	                                  "gada",
	                                  "test",
	                                  timestamp,
	                                  0,
	                                  136
	                                  ))))
	                  .andExpect(status().isOk())                 // ???????????? OK??? ????????? ????????????
	                  .andDo(print());                            // ?????? ????????? ??????
	      }
	      
	      
	      // PutMapping Test

	      //List<AnswerVO> answerVO = Arrays.asList(125, "gada", "testNew", timestamp, 0, 136);
	      List<AnswerVO> answerVO = new ArrayList<>();

	      @Before // @Test ????????? ??????
	      public void setUp() {
	          this.mockMvc = MockMvcBuilders.standaloneSetup(boardController).build();
	          mapper = new ObjectMapper();
	      }
	      
	      @Test
	      //@WithUserDetails("gada")
	      public void writeBoardTest() throws Exception {
	          mockMvc.perform(put("/board")        // Controller??? /test URI??? Post???????????? ??????
	                  .contentType(MediaType.APPLICATION_JSON_VALUE)    // contentType??? json ??????
	                  .content(mapper.writeValueAsString(         // ????????? json??? ??????. content?????? post??? body??? ?????????.
	                          new BoardVO(
	                                  145,
	                                  "test",
	                                  "test",
	                                  timestamp,
	                                  0,
	                                  136,
	                                  0,
	                                  0,
	                                  4,
	                                  "gada",
	                                  1,
	                                  answerVO
	                                  ))))
	                  .andExpect(status().isOk())                 // ???????????? OK??? ????????? ????????????
	                  .andDo(print());                            // ?????? ????????? ??????
	      }
}

