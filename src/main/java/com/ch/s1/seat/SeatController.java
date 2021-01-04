package com.ch.s1.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/seat/**")
public class SeatController {
	
	@Autowired
	private SeatService seatService;
	
	@GetMapping("seatList")
	public ModelAndView getList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<SeatVO> ar = seatService.getList();
		mv.addObject("list", ar);
		mv.setViewName("seat/seatList");
		return mv;
	}
}
