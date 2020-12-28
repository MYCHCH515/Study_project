package com.ch.s1.board.notice;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.board.BoardVO;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String getBoardName() throws Exception{
		return "notice";
	}
	
	@GetMapping("noticeList")
	public ModelAndView getList()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardList");
		return mv;	
	}
	
	@GetMapping("noticeWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardWrite");
		return mv;
	}
	
	@PostMapping("noticeWrite")
	public ModelAndView setInsert(BoardVO boardVO, MultipartFile [] files) throws Exception{
		
		int result = noticeService.setInsert(boardVO, files);
		String message="작성 실패했습니다.";
		if(result>0) {
			message = "작성 성공했습니다.";
		}
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("msg", message);
		mv.addObject("path", "./boardList");
		
		mv.setViewName("common/result");
		return mv;	
	}

}
