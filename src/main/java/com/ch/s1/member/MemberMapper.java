package com.ch.s1.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberId(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberPhone(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberEmail(MemberVO memberVO) throws Exception;
}
