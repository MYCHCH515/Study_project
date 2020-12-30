package com.ch.s1.board.notice;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ch.s1.board.BoardVO;
import com.ch.s1.util.Pager;

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
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardVO> ar = noticeService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/boardList");
		return mv;	
	}
	
	@GetMapping("noticeWrite")
	public ModelAndView setInsert(BoardVO boardVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardWrite");
		return mv;
	}
	
	@PostMapping("noticeWrite")
	public ModelAndView setInsert(@Valid BoardVO boardVO, BindingResult bindingResult, MultipartFile [] files) throws Exception{
		ModelAndView mv = new ModelAndView();
	
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/boardWrite");
			return mv;
		}
		
		else {
			int result = noticeService.setInsert(boardVO, files);
			
			if(result>0) {
				String message = "작성 성공했습니다.";
				mv.addObject("path", "./noticeList");
				mv.addObject("msg", message);
				mv.setViewName("common/result");
			}
			return mv;	
		}		
	}
	
	@PostMapping("summernote")
	public ModelAndView summernote(MultipartFile file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();

		String fileName = noticeService.summernote(file, session);
		
		String name = session.getServletContext().getContextPath()+File.separator;
		name = name+"upload"+File.separator+"notice"+File.separator+fileName;
		System.out.println(name);
		mv.addObject("msg", name);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("summernoteDelete")
	public ModelAndView summernoteDelete(String file, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = noticeService.summernoteDelete(file, session);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("noticeSelect")
	public ModelAndView getOne(BoardVO boardVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		noticeService.setInsertHits(boardVO.getBoard_num());
		boardVO =  noticeService.getOne(boardVO);
	
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		
		return mv;
	}

}
