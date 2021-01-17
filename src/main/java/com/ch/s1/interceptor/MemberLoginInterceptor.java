package com.ch.s1.interceptor;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.ch.s1.board.BoardVO;
import com.ch.s1.board.notice.NoticeMapper;
import com.ch.s1.member.MemberVO;

@Component
public class MemberLoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
	 	
		String path = request.getRequestURI();
		System.out.println(path);
	 
	 	String message = "로그인이 필요한 서비스입니다.";
		
	 	boolean result = false;
	 	if(memberVO != null) {
	 		result = true;
	 	}
	 	
	 	if(!result) {
	 		request.setAttribute("msg", message);
	 		request.setAttribute("path", "../member/memberLogin");
	 		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
	 		view.forward(request, response);
	 	}
	 	return result;
	}
}
