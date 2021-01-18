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
public class NoticeAdminInterceptor implements HandlerInterceptor {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
	 	
		String path = request.getRequestURI();
	 	String kind = path.substring(path.lastIndexOf("notice")).replace("notice","");
		
	 	String message = "관리자 권한이 필요한 서비스입니다.";
		
	 	boolean result = false;
	 	if(memberVO != null) {
	 		long mem_type = memberVO.getMem_type();
	 		
 			if(mem_type==1) {	
 				result = true;
 				
 				if(kind.equals("Update") || kind.equals("Delete")) {
 					int board_num = Integer.parseInt(request.getParameter("board_num"));
 					BoardVO boardVO = new BoardVO();
 					boardVO.setBoard_num(board_num);
 					boardVO = noticeMapper.getOne(boardVO);
 					
 					if(boardVO.getBoard_writer().equals(memberVO.getMem_id())) {
 						result = true;
 					}
 					else {
 						result = false;
 						message="작성자만 접근이 가능합니다";
 					}
 				}
 			}
 			else {
 				result = false;
 			}
	 	}
	 	
	 	if(!result) {
	 		request.setAttribute("msg", message);
	 		request.setAttribute("path", "../");
	 		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
	 		view.forward(request, response);
	 	}
	 	return result;
	}
}
