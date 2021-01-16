package com.ch.s1.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.member.MemberService;
import com.ch.s1.member.MemberVO;
import com.ch.s1.util.Pager;

@Controller
@RequestMapping(value="/admin/**")
public class AdminController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("adminPage")
	public ModelAndView getMemberList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar =  memberService.getMemberList(pager);
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("admin/adminPage");
		return mv;
	}
}
