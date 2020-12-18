package com.ch.s1.member;

import lombok.Data;

@Data
public class MemberVO {
	
	private long mem_num;
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_email;
}
