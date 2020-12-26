package com.ch.s1.board.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {

	//@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String getBoardName() throws Exception{
		return "notice";
	}
	
	@GetMapping("noticeList")
	public ModelAndView getList()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardList");
		return mv;	
	}
	
	@GetMapping("noticeWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardWrite");
		return mv;
	}
}
