package com.ch.s1.reserve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/reserve/**")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	@GetMapping("reserveForm")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveForm");
		return mv;
	}
}
