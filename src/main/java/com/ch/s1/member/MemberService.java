package com.ch.s1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public int setMemberJoin(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberJoin(memberVO);
	}
	
	public MemberVO getMemberId(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberId(memberVO);
	}
	
	public MemberVO getMemberPhone(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberPhone(memberVO);
	}
	
	public MemberVO getMemberEmail(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberEmail(memberVO);
	}
	
	

}
