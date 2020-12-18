package com.ch.s1.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public int setMemberJoin(MemberVO memberVO) throws Exception;
}
