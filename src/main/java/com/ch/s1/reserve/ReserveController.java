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

@Controller
@RequestMapping(value = "/reserve/**")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;

	@GetMapping("reserveForm")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = reserveService.getProductList();
		mv.addObject("list", ar);
		mv.setViewName("reserve/reserveForm");
		return mv;
	}

//	@PostMapping("reserveForm")
//	public ModelAndView setInsert(ReserveVO reserveVO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		int result = reserveService.setInsert(reserveVO);
//		
//		System.out.println("======="+reserveVO.getReserve_num());
//		
//		
//		ReserveVO reserveVO2 = new ReserveVO();
//		reserveVO2.setReserve_num(reserveVO.getReserve_num());
//		
//		if (result > 0) {
//			reserveVO2 = reserveService.getOne(reserveVO2);
//			mv.addObject("vo2", reserveVO2);
//			mv.setViewName("reserve/reserveCheckForm");
//		}
//		
//		else {
//			String message = "예약 실패했습니다.";
//			mv.addObject("path", "redirect:../"); 
//			mv.addObject("msg", message);
//			mv.setViewName("common/result");
//		}
//		
//		return mv;
//	}
	
	@PostMapping("reserveForm")
	public ModelAndView setInsert(ReserveVO reserveVO, 	HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		int result = reserveService.setInsert(reserveVO);
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		long mem_num = memberVO.getMem_num();
		
		ReserveVO reserveVO2 = new ReserveVO();
		reserveVO2.setMem_num(mem_num);

		String message = "예약 실패했습니다.";
		if (result > 0) {
			reserveVO2 = reserveService.getLatestOne(reserveVO2);
			System.out.println("성공");
			message = "성공적으로 예약되었습니다.\\n예약내역은 마이페이지에서 확인 가능합니다.";
			mv.addObject("vo2", reserveVO2);
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
	public ModelAndView getLatestOne() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reserve/reserveCheckForm");
		System.out.println("체크폼컨트롤ㄹㄹ");
		return mv;
	}

	@GetMapping("reserveCheckTime")
	public ModelAndView getTime() throws Exception {
		/*
		 * Calendar ca = Calendar.getInstance(); int y = ca.get(Calendar.YEAR); int m =
		 * ca.get(Calendar.MONTH)+1; int d = ca.get(Calendar.DATE); int h =
		 * ca.get(Calendar.HOUR); int mi = ca.get(Calendar.MINUTE);
		 * 
		 * ArrayList<Integer> time = new ArrayList<>(); time.add(y); time.add(m);
		 * time.add(d); time.add(h); time.add(mi);
		 * 
		 * time.toString();
		 */
		System.out.println("c체크아웃ㅅ");

		ModelAndView mv = new ModelAndView();
		// mv.addObject("msg", time);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
}
