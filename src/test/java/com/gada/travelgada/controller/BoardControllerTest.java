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
	      private WebApplicationContext ctx;		// MockMvc 객체 생성을 위한 context
	      ObjectMapper mapper; // 객체를 json 형식으로 변경 시 사용
	      LocalDateTime now = LocalDateTime.now();
	      Timestamp timestamp = Timestamp.valueOf(now);
	      
	      @Autowired
	      BoardController boardController;
	      
	      private MockMvc mockMvc;

	      @Before//미리 실행하는 것, 테스트 초기화를 의미한다.
	      public void setupForBoardListTest() {
	         this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	      }//이렇게 객체를 생성한대

	      @Test
	      public void BoardListTest() throws Exception {	         
	         mockMvc.perform(get("/board/1"))//get 방식으로
	          .andExpect(status().isOk())//응답 검증
	          .andDo(print())
	            .andExpect(forwardedUrl("/WEB-INF/views//board/review.jsp"));
	      }

	      // PostMapping Test
	      @Before // @Test 이전에 실행
	      public void setupForwriteReplyTest() {
	          this.mockMvc = MockMvcBuilders.standaloneSetup(boardController).build();
	          mapper = new ObjectMapper();
	      }
	      
	      @Test
	      //@WithUserDetails("gada")
	      public void writeReplyTest() throws Exception {
	          mockMvc.perform(post("/board/reply")        // Controller의 /test URI를 Post방식으로 호출
	                  .contentType(MediaType.APPLICATION_JSON_VALUE)    // contentType은 json 형식
	                  .content(mapper.writeValueAsString(         // 객체를 json로 변경. content에는 post의 body가 들어감.
	                          new AnswerVO(
	                                  125,
	                                  "gada",
	                                  "test",
	                                  timestamp,
	                                  0,
	                                  136
	                                  ))))
	                  .andExpect(status().isOk())                 // 상태값은 OK가 나오면 정상처리
	                  .andDo(print());                            // 처리 내용을 출력
	      }
	      
	      
	      // PutMapping Test

	      //List<AnswerVO> answerVO = Arrays.asList(125, "gada", "testNew", timestamp, 0, 136);
	      List<AnswerVO> answerVO = new ArrayList<>();

	      @Before // @Test 이전에 실행
	      public void setUp() {
	          this.mockMvc = MockMvcBuilders.standaloneSetup(boardController).build();
	          mapper = new ObjectMapper();
	      }
	      
	      @Test
	      //@WithUserDetails("gada")
	      public void writeBoardTest() throws Exception {
	          mockMvc.perform(put("/board")        // Controller의 /test URI를 Post방식으로 호출
	                  .contentType(MediaType.APPLICATION_JSON_VALUE)    // contentType은 json 형식
	                  .content(mapper.writeValueAsString(         // 객체를 json로 변경. content에는 post의 body가 들어감.
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
	                  .andExpect(status().isOk())                 // 상태값은 OK가 나오면 정상처리
	                  .andDo(print());                            // 처리 내용을 출력
	      }
}

