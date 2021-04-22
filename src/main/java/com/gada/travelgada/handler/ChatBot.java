package com.gada.travelgada.handler;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatBot {
	
	private final Map<String, String> BASIC_QUESTION = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			put("1.여행 문의","<strong>[단게별 여행 경보]</strong><br>"
					+ "출국 전 각국의 단계별 여행 경보를 확인하세요.<br>"
					+ "<a href='https://www.0404.go.kr/dev/issue_current.mofa' target='_blank'>여행 경보 확인하기</a>");
			put("2.상품 문의","<strong>[택배배송]</strong><br>"
					+ "택배 배송의 경우, 운송 산업 특성상 상품이 매장이나 물류 창고를 떠나면 취소나 변경이 불가합니다.<br><br>"
					+ "<strong>[제품목록 변경]</strong><br>"
					+ "주문 내용의 일부를 변경 또는 취소하고 싶다면 가다 고객지원센터로 연락주시면 주문서 수정을 도와드립니다.<br>"
					+ "단, 제품 준비가 시작 되면 주문서 변경이 어려운 점을 참고해 주세요.<br><br>"
					+ "<strong>[주문취소]</strong><br>"
					+ "주문서 전체에 대한 취소 신청은 가다 고객지원센터로 연락주시기 바라며, 배송 진행 상태에 따라 반품비가 부과될 수 있습니다.");
			put("3.상담원 연결","<strong>[상담원 연결]</strong><br>"
					+ "상담원 연결 중입니다.<br>"
					+ "상담원 연결까지 약간의 시간이 소요될 수 있습니다.");
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
