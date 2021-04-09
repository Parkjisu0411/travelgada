package com.gada.travelgada.handler;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatBot {
	
	private final Map<String, String> BASIC_QUESTION = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			put("1.여행 문의","관리자의 여행 문의 응답");
			put("2.상품 문의","관리자의 상품 문의 응답");
			put("3.상담원 연결","상담원 연결 중입니다.");
		}
	});
	
	public boolean isBasicQuestion(String msg) {
		if(BASIC_QUESTION.get(msg) != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public String basicAnswer(String msg) {
		String answer = BASIC_QUESTION.get(msg);
		String response = "{\"type\":\"message\",\"sessionId\":\"7a01e84c-6479-78af-97fc-5e5f81047825\",\"username\":\"가다\",\"msg\":\"" + answer + "\"}";
		log.info(answer);
		log.info(response);
		return response;
	}
}
