package com.ch.s1.member;

import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.locker.LockerReserveVO;
import com.ch.s1.locker.LockerService;
import com.ch.s1.locker.LockerVO;
import com.ch.s1.reserve.ReserveService;
import com.ch.s1.reserve.ReserveVO;
import com.ch.s1.seat.SeatService;


@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private SeatService seatService;
	@Autowired
	private LockerService lockerService;
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberVO memberVO, String remember, HttpServletResponse response, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		if(remember != null) {
			Cookie cookie = new Cookie("remember", memberVO.getMem_id());
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		memberVO = memberService.getMemberLogin(memberVO);
		
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			
			mv.setViewName("redirect:../");
		}
		
		else {
			mv.addObject("msg","아이디 또는 비밀번호를 확인해주세요");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		}
		return mv;	
	}
	
	@GetMapping("memberSearchId")
	public ModelAndView getMemberSearchId() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberSearchId");
		return mv;
	}
	
	@PostMapping("memberSearchId")
	public ModelAndView getMemberSearchId(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO= memberService.getSearchId(memberVO);

		if(memberVO == null) {
			mv.addObject("msg", "가입된 회원정보가 없습니다.");
			mv.setViewName("common/result");
		}
		else { 
			String findId = memberVO.getMem_id();
			
			//정규식 마스킹처리
			if(findId.length()>5) {
				findId = findId.replaceAll("(?<=.{4})." , "*");
			}
			else {
				findId = findId.replaceAll("(?<=.{2})." , "*");
			}
			mv.addObject("findId", findId);
			mv.addObject("vo", memberVO);
			mv.setViewName("member/memberSearchIdResult");
		}
		return mv;	
	}
	
	@GetMapping("memberSearchPw")
	public ModelAndView getMemberSearchPw() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberSearchPw");
		return mv;
	}
	

	@PostMapping("memberSearchPw")
	public ModelAndView getMemberSearchPw(HttpServletResponse response, MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberService.getfindPw(response, memberVO);
		return mv;
	}
	
	@GetMapping("memberSearchIdResult")
	public ModelAndView getIdResult() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberSearchIdResult");
		return mv;
	}
	
	@GetMapping("memberAgree")
	public ModelAndView setMemberAgree() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberAgree");
		return mv;
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(memberService.getMemberError(memberVO, bindingResult)) {
			mv.setViewName("member/memberJoin");
			return mv;
		}
	
		int result = memberService.setMemberJoin(memberVO);
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@GetMapping("memberIdCheck")
	public ModelAndView getMemberId(MemberVO memberVO) throws Exception{
		
		memberVO = memberService.getMemberId(memberVO);
		ModelAndView mv = new ModelAndView();
		
		int result=1;
		if(memberVO == null) {
			result=0;
		}else {
			result=1;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;	
	}
	
	@GetMapping("memberPhoneCheck")
	public ModelAndView getMemberPhone(MemberVO memberVO) throws Exception{
		
		memberVO = memberService.getMemberPhone(memberVO);
		ModelAndView mv = new ModelAndView();
		
		int result=1;
		if(memberVO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;	
	}

	
	@GetMapping("memberEmailCheck")
	public ModelAndView getMemberEmail(MemberVO memberVO) throws Exception{
		
		memberVO = memberService.getMemberEmail(memberVO);
		ModelAndView mv = new ModelAndView();
		
		int result=1;
		if(memberVO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
	
		return mv;	
	}
	
	@PostMapping("memberOriginPwCheck")
	public ModelAndView getMemberOriginPw(MemberVO memberVO, @RequestParam String origin_pw) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(origin_pw);
		memberVO = memberService.getMemberOriginPw(memberVO);

		int result = 0;
		if(memberVO != null) {
			String mem_db_pw = memberVO.getMem_pw();
			System.out.println(mem_db_pw);
			if(origin_pw.equals(mem_db_pw)) {
				result = 1;
				System.out.println("있ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
			}else {
				result = 0;
				System.out.println("없ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
			}
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
	
		return mv;		
	}

	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	@GetMapping("/check/sendSMS")
    public @ResponseBody String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        memberService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
	
	@GetMapping("memberPage")
	public ModelAndView getMemberPage() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberPage");
		return mv;
	}
	
	@PostMapping("memberPage")
	public ModelAndView getMemberInfo(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getMemberInfo(memberVO);
		
		if(memberVO != null) {
			long mem_num = memberVO.getMem_num();
			LockerReserveVO lockerReserveVO= lockerService.getMemberLocker(mem_num);
			if(lockerReserveVO != null) {
				String locker_name = lockerReserveVO.getLockerVOs().getLocker_name();
				mv.addObject("locker_name", locker_name);
			}
			
			mv.addObject("vo", memberVO);
			mv.setViewName("member/memberModify");
		}
		
		else {
			mv.addObject("msg","비밀번호가 일치하지 않습니다.");
			mv.addObject("path", "./memberPage");
			mv.setViewName("common/result");
		}
		return mv;	
	}
	
	@GetMapping("memberModify")
	public ModelAndView getMemberUpdate() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberModify");
		return mv;
	}
	
	@GetMapping("memberInquiry")
	public ModelAndView getMemberInquiry() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberInquiry");
		return mv;
	}
	
	@GetMapping("memberSecession")
	public ModelAndView getMemberSecession() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberSecession");
		return mv;
	}
	
	@PostMapping("memberSecession")
	public ModelAndView setMemberSecession(MemberVO memberVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getMemberInfo(memberVO);
		
		if(memberVO != null) {
			long mem_num =  memberVO.getMem_num();
			ReserveVO reserveVO = new ReserveVO();
			reserveVO.setMem_num(mem_num);
			reserveVO = reserveService.getLatestOne(reserveVO);
			
			if(reserveVO != null) {
				long seat_num = reserveVO.getSeat_num();
				reserveService.setCheckOut(reserveVO);
				seatService.setSeatExit(seat_num);	
			}
			
			LockerReserveVO lockerReserveVO = new LockerReserveVO();
			lockerReserveVO.setMem_num(mem_num);
			lockerReserveVO = lockerService.getMemberLocker(mem_num);
			
			if(lockerReserveVO != null) {
				long locker_num = lockerReserveVO.getLocker_num();
				lockerService.setLockerCheckOut(lockerReserveVO);
				lockerService.setLockerExit(locker_num);
			}
			
			memberService.setMemberSecession(memberVO);
			
			mv.addObject("msg","회원탈퇴 되셨습니다.");
			mv.addObject("path", "../");
			session.invalidate();
			mv.setViewName("common/result");
		}
		
		else {
			mv.addObject("msg","비밀번호가 일치하지 않습니다.");
			mv.addObject("path", "./memberSecession");
			mv.setViewName("common/result");
		}
		return mv;	
	}
	
	@PostMapping("memberSelectSecession")
	public ModelAndView setMemberSelectSecession(HttpSession session, 
			@RequestParam(value ="chkBox[]") List<String> checkArr) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		long mem_num = 0;
		
		for(String i : checkArr) {
			mem_num = Integer.parseInt(i);
			ReserveVO reserveVO = new ReserveVO();
			reserveVO.setMem_num(mem_num);
			reserveVO = reserveService.getLatestOne(reserveVO);
			
			if(reserveVO != null) {
				long seat_num = reserveVO.getSeat_num();
				reserveService.setCheckOut(reserveVO);
				seatService.setSeatExit(seat_num);	
			}
			
			LockerReserveVO lockerReserveVO = new LockerReserveVO();
			lockerReserveVO.setMem_num(mem_num);
			lockerReserveVO = lockerService.getMemberLocker(mem_num);
			
			if(lockerReserveVO != null) {
				long locker_num = lockerReserveVO.getLocker_num();
				lockerService.setLockerCheckOut(lockerReserveVO);
				lockerService.setLockerExit(locker_num);
			}
	
			result = memberService.setMemberSelectSecession(mem_num);
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
	
		return mv;			
	}
	
	@PostMapping("memberModifyEmail")
	public ModelAndView setMemberModifyEmail(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setModifyEmail(memberVO);

		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
	
		return mv;	
	}
	
	@PostMapping("memberModifyPhone")
	public ModelAndView setMemberModifyPhone(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setModifyPhone(memberVO);

		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
	
		return mv;	
	}
	
	@PostMapping("memberModifyPw")
	public ModelAndView setMemberModifyPw(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setModifyPw(memberVO);

		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
	
		return mv;	
	}
	
}
