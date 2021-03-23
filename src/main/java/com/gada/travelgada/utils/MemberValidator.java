package com.gada.travelgada.utils;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.gada.travelgada.domain.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MemberValidator implements Validator{
	
	private static final String idPattern = "^[a-z0-9]{5,20}$"; // 영문, 숫자
	private static final String passwordPattern = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z[0-9]$@$!%*#?&]{8,16}$";
	private static final String emailPattern = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
	private static final String phonePattern = "^01(?:0|1|[6-9])(?:\\\\d{3}|\\\\d{4})\\\\d{4}$";

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("Validating Member =============");
		MemberVO member = (MemberVO) target;
		String id = member.getMember_id();
		String name = member.getMember_name();
		String email = member.getEmail();
		String phone_num = member.getPhone_num();
		
		if(!Pattern.matches(id, idPattern)) {
			log.info("ID is not match with pattern");
			errors.rejectValue("member_id", "member_id", "아이디는 영문, 숫자로 이루어진 5~20자로 입력해주세요.");
		}
		
		if(!Pattern.matches(email, emailPattern)) {
			log.info("Password is not match with pattern");
			errors.rejectValue("email", "email");
		}

		if(!Pattern.matches(phone_num, phonePattern)) {
			log.info("Phone_Num is not match with pattern");
			errors.rejectValue("phone_num", "phone_num");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "required");
	}

}
