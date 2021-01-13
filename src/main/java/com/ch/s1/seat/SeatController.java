package com.ch.s1.seat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.member.MemberVO;
import com.ch.s1.reserve.ReserveService;
import com.ch.s1.reserve.ReserveVO;

@Controller
@RequestMapping(value = "/seat/**")
public class SeatController {

	@Autowired
	private SeatService seatService;

	@Autowired
	private ReserveService reserveService;

	@GetMapping("seatList")
	public ModelAndView getList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<SeatVO> ar = seatService.getList();

		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO!=null) { 
			long mem_num= memberVO.getMem_num(); 
			ReserveVO reserveVO = reserveService.getMemberSeat(mem_num); 
			if(reserveVO!=null) {
				long seat_num = reserveVO.getSeat_num();
				System.out.println("*********"+seat_num);
				mv.addObject("seat_num", seat_num);
				mv.addObject("reserveVO", reserveVO); 
			}else {
				System.out.println("일치조건없음");
			}
		}
		mv.addObject("list", ar);
		mv.setViewName("seat/seatList");
		return mv;
	}
}
