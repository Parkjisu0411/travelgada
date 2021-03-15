package com.gada.travelgada.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	private String member_id;
	private String pw;
	private String member_name;
	private String email;
	private String phone_num;
	private String profile_img_path;
	private int withdrawal_code;
	private int withdrqwal_flag;
	private String sns_type;
	private List<AuthVO> authList;
}
