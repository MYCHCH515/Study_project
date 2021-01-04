package com.ch.s1.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.product.ProductVO;

@Controller
@RequestMapping(value="/reserve/**")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	@GetMapping("reserveForm")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = reserveService.getProductList();
		mv.addObject("list", ar);
		mv.setViewName("reserve/reserveForm");
		return mv;
	}
	
	@PostMapping("reserveForm")
	public ModelAndView setInsert(ReserveVO reserveVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reserveService.setInsert(reserveVO);
		
		String message="예약 실패했습니다.";
		if(result>0) {
			message = "예약 성공했습니다.";
		}
		mv.addObject("msg", message);
		mv.addObject("path", "./reserveCheckForm");
		
		mv.setViewName("common/result");
		return mv;	
	}
	
	
}
