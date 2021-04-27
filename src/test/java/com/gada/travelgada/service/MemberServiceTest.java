package com.gada.travelgada.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.gada.travelgada.domain.MemberVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MemberServiceTest {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Test
	public void testExist() {
		assertNotNull(memberService);
	}
	
	@Test
	public void addMemberTest() {
		MemberVO member = new MemberVO();
		member.setMember_id("testId4");
		member.setPw(passEncoder.encode("testPassword"));
		member.setMember_name("testName");
		member.setPhone_num("testPhone");
		member.setEmail("testEmail");
		member.setProfile_img_path("testImgPath");
		
		memberService.addMember(member);
	}
	
	@Test
	public void getMemberTest() {
		memberService.getMember("testId");
	}
	
	@Test
	public void getPointTest() {
		memberService.getPoint("testId");
	}
	
	@Test
	public void getShippingLocTest() {
		memberService.getShippingLoc("testId");
	}
	
	@Test
	public void isExistTest() {
		memberService.isExist("testId");
	}
	
	@Test
	public void isCorrectTest() {
		memberService.isCorrect("testId", "testPassword");
	}
	
	@Test
	public void updateMemberTest() {
		MemberVO member = new MemberVO();
		member.setMember_id("testId");
		member.setPw("testPassword");
		member.setMember_name("updateTest");
		member.setPhone_num("updateTest");
		member.setEmail("updateTest");
		member.setProfile_img_path("updateTest");
		
		memberService.updateMember(member);
	}
}
