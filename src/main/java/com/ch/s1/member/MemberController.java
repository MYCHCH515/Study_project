package com.ch.s1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		return mv;
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setMemberJoin(memberVO);

		mv.setViewName("redirect:../");
		return mv;
	}
	
	@GetMapping("memberIdCheck")
	public ModelAndView getMemberId(MemberVO memberVO) throws Exception{
		
		memberVO = memberService.getMemberId(memberVO);
		ModelAndView mv = new ModelAndView();
		
		int result=1;
		if(memberVO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;	
	}
	
	@GetMapping("memberPhoneCheck")
	public ModelAndView getMemberPhone(MemberVO memberVO) throws Exception{
		
		memberVO = memberService.getMemberPhone(memberVO);
		ModelAndView mv = new ModelAndView();
		
		int result=1;
		if(memberVO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;	
	}

	
	@GetMapping("memberEmailCheck")
	public ModelAndView getMemberEmail(MemberVO memberVO) throws Exception{
		
		memberVO = memberService.getMemberEmail(memberVO);
		ModelAndView mv = new ModelAndView();
		
		int result=1;
		if(memberVO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
	
		return mv;	
	}


}
