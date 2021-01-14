package com.ch.s1.locker;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.member.MemberVO;
import com.ch.s1.reserve.ReserveVO;

@Controller
@RequestMapping(value="/locker/**")
public class LockerController {
	
	@Autowired
	private LockerService lockerService;
	
	@GetMapping("lockerList")
	public ModelAndView getList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<LockerVO> ar = lockerService.getList();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO!=null) { 
			long mem_num= memberVO.getMem_num(); 
			LockerReserveVO lockerReserveVO;
			if(lockerReserveVO!=null) {
				System.out.println("----"+lockerReserveVO.getReserve_num());
				long seat_num = lockerReserveVO.getSeat_num();
				mv.addObject("seat_num", seat_num);
				mv.addObject("reserveVO", lockerReserveVO); 
			}else {
				System.out.println("일치조건없음");
			}
		}
		mv.addObject("list", ar);
		mv.setViewName("seat/seatList");
		
		return mv;
	}

}
