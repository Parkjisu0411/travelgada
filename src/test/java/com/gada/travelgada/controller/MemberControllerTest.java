package com.gada.travelgada.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gada.travelgada.domain.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class MemberControllerTest {

    @Setter(onMethod_ = { @Autowired })
    private WebApplicationContext ctx;
    
    @Autowired
    private ObjectMapper objectMapper; 
    
    private MockMvc mockMvc;

    @Before//미리 실행하는 것, 테스트 초기화를 의미한다.
    public void setup() {
       this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
       //SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken("username", "password", (Collection<? extends GrantedAuthority>) Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"))));
    }//이렇게 객체를 생성한대
    
    @Test
    public void signUpFormTest() throws Exception {
    	mockMvc.perform(get("/member"))
    	.andExpect(status().isOk())
    	.andDo(print())
    	.andExpect(forwardedUrl("/WEB-INF/views/member/signUpForm.jsp"));
    }
    
    @Test
    public void signUpTest() throws Exception {
    	MemberVO member = new MemberVO();
    	member.setMember_id("signuptest");
    	member.setPw("testPassword");
    	member.setEmail("test@email.com");
    	member.setPhone_num("01012341234");
    	member.setMember_name("가다");
    	String content = objectMapper.writeValueAsString(member);
    	
    	mockMvc.perform(post("/member").content(content).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andDo(print());
    }
    
    @Test
    public void updateMemberTest() throws Exception {
    	MemberVO member = new MemberVO();
    	member.setMember_id("signuptest");
    	member.setMember_name("updateTest");
    	String content = objectMapper.writeValueAsString(member);
    	
    	mockMvc.perform(put("/member/" + member.getMember_id()).content(content).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andDo(print());
    }
    
    @Test
    @WithUserDetails("gada")
    public void mypageTest() throws Exception {
    	mockMvc.perform(get("/member/mypage").accept(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andDo(print());
    }
    
}
