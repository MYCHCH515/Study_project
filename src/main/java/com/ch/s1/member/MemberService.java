package com.ch.s1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public int setMemberJoin(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberJoin(memberVO);
	}
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberLogin(memberVO);
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
	
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult) throws Exception{
		
		boolean result = false;
		
		if(bindingResult.hasErrors()){
			result = true;
		}
		
		if(!memberVO.getMem_pw().equals(memberVO.getMem_pw2())) {
			bindingResult.rejectValue("mem_pw2", "memberVO.mem_pw.notEqual");
			result = true;
		}
		
		memberVO = memberMapper.getMemberId(memberVO);
		if(memberVO!=null) {
			bindingResult.rejectValue("mem_id", "memberVO.mem_id.isExist");
			result = true;
		}
		
		memberVO = memberMapper.getMemberPhone(memberVO);
		if(memberVO!=null) {
			bindingResult.rejectValue("mem_phone", "memberVO.mem_phone.isExist");
			result = true;
		}
		
		memberVO = memberMapper.getMemberEmail(memberVO);
		if(memberVO!=null) {
			bindingResult.rejectValue("mem_email", "memberVO.mem_email.isExist");
			result = true;
		}
		return result;
	}

}
