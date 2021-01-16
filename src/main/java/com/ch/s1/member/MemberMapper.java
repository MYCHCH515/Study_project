package com.ch.s1.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.ch.s1.util.Pager;

@Mapper
public interface MemberMapper {

	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberId(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberPhone(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberEmail(MemberVO memberVO) throws Exception;

	public int updatePw(MemberVO memberVO) throws Exception;
	
	public MemberVO getSearchId(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberInfo(MemberVO memberVO) throws Exception;
	
	public int setMemberSecession(MemberVO memberVO) throws Exception;
	
	public int setMemberSelectSecession(long mem_num) throws Exception;
	
	public int setModifyEmail(MemberVO memberVO) throws Exception;
	
	public int setModifyPhone(MemberVO memberVO) throws Exception;
	
	public List<MemberVO> getMemberList(Pager pager) throws Exception;
	
	public long getCount(Pager pager) throws Exception;
}
