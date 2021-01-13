package com.ch.s1.reserve;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.member.MemberVO;
import com.ch.s1.product.ProductVO;
import com.ch.s1.seat.SeatService;
import com.ch.s1.util.Pager;

@Controller
@RequestMapping(value = "/reserve/**")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private SeatService seatService;

	@GetMapping("reserveForm")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = reserveService.getProductList();
		mv.addObject("list", ar);
		mv.setViewName("reserve/reserveForm");
		return mv;
	}
	
	@PostMapping("reserveForm")
	public ModelAndView setInsert(ReserveVO reserveVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = reserveService.setInsert(reserveVO);
		long seat_num = reserveVO.getSeat_num();
		
		String message = "예약 실패했습니다.";
		if (result > 0) {
			seatService.setSeatEnter(seat_num);
			System.out.println("성공");
			
			message = "성공적으로 예약되었습니다.";
			mv.addObject("path", "./reserveCheckForm");
		}
		
		else {
			mv.addObject("path", "./");
		}
		
		mv.addObject("msg", message);
		mv.setViewName("common/result");
		return mv;
	}

	@GetMapping("reserveCheckForm")
	public ModelAndView getLatestOne(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("체크폼컨트롤");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		long mem_num = memberVO.getMem_num();
		
		ReserveVO reserveVO = new ReserveVO();
		reserveVO.setMem_num(mem_num);
		reserveVO = reserveService.getLatestOne(reserveVO);
		mv.addObject("vo", reserveVO);
		mv.setViewName("reserve/reserveCheckForm");
		System.out.println("체크폼컨트롤ㄹㄹ");
		return mv;
	}
	
	@GetMapping("memberReservation")
	public ModelAndView getMemberReservation(HttpSession session, Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		long mem_num = memberVO.getMem_num();
		pager.setMem_num(mem_num);
		
		List<ReserveVO> ar = reserveService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("reserve/memberReservation");
		return mv;
	}
}
