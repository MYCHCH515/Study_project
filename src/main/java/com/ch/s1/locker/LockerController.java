package com.ch.s1.locker;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
			LockerReserveVO lockerReserveVO = lockerService.getMemberLocker(mem_num);
			if(lockerReserveVO!=null) {
				System.out.println("----"+lockerReserveVO.getReserve_locker_num());
				long locker_num = lockerReserveVO.getLocker_num();
				mv.addObject("locker_num", locker_num);
				mv.addObject("lockerReserveVO", lockerReserveVO); 
			}else {
				System.out.println("일치조건없음");
			}
		}	
		mv.addObject("list", ar);
		mv.setViewName("locker/lockerList");
		
		return mv;
	}
	
	@GetMapping("lockerReserveForm")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("locker/lockerReserveForm");
		return mv;
	}
	
	@PostMapping("lockerReserveForm")
	public ModelAndView setInsert(LockerReserveVO lockerReserveVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = lockerService.setInsert(lockerReserveVO);
		long locker_num = lockerReserveVO.getLocker_num();
		
		String message = "예약 실패했습니다.";
		if (result > 0) {
			lockerService.setLockerEnter(locker_num);
			System.out.println("성공");
			
			message = "성공적으로 예약되었습니다.";
			mv.addObject("path", "../");
		}
		
		else {
			mv.addObject("path", "../");
		}
		
		mv.addObject("msg", message);
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("getEndDate")
	public ModelAndView getEndDate(@RequestParam int pd_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(pd_num);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, pd_num*7);	
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = format.format(cal.getTime());
		
		System.out.println("날짜 확인"+strDate);
		
		mv.addObject("msg", strDate);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("selectCheckOut")
	public ModelAndView setSelectCheckOut(HttpSession session, 
			@RequestParam(value ="chkBox[]") List<String> checkArr) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		int result = 0;
		long reserve_locker_num = 0;
		
		for(String i : checkArr) {
			reserve_locker_num = Integer.parseInt(i);
			LockerReserveVO lockerReserveVO = new LockerReserveVO();
			lockerReserveVO.setReserve_locker_num(reserve_locker_num);
			
			lockerReserveVO= lockerService.getReserveInfo(lockerReserveVO);

			System.out.println("-------"+lockerReserveVO.getReserve_locker_num());
			
			if(lockerReserveVO != null) {
				long locker_num = lockerReserveVO.getLocker_num();
				result = lockerService.setLockerCheckOut(lockerReserveVO);
			
				if(result==1) {
					lockerService.setLockerExit(locker_num);
				}
			}
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;	
	}

}
