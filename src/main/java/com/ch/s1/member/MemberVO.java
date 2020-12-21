package com.ch.s1.member;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class MemberVO {
	
	private long mem_num;
	
	@NotEmpty
	@Pattern(regexp = "/^[A-Za-z0-9]{5,20}$/")
	private String mem_id;
	
	@NotEmpty
	@Pattern(regexp = "/^.*(?=^.{8,16}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/")
	private String mem_pw;
	
	private String mem_pw2;
	
	@NotEmpty
	private String mem_name;
	
	@NotEmpty
	@Pattern(regexp = "/^\\d{3}-\\d{3,4}-\\d{4}$/")
	private String mem_phone;
	
	@NotEmpty
	@Pattern(regexp = "/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i")
	private String mem_email;
}
