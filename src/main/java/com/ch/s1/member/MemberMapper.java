package com.ch.s1.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

@Mapper
public interface MemberMapper {

	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberId(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberPhone(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberEmail(MemberVO memberVO) throws Exception;

	public int updatePw(MemberVO memberVO) throws Exception;
	
	public MemberVO getSearchId(MemberVO memberVO) throws Exception;
}
