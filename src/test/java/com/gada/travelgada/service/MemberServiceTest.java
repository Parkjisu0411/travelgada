package com.gada.travelgada.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.gada.travelgada.domain.MemberVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MemberServiceTest {
	
	@Autowired
	private MemberVO memberVO;
	
	@Test
	public void addMember(MemberVO member) {
		
	}
}
