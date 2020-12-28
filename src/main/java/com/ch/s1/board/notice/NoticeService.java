package com.ch.s1.board.notice;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ch.s1.board.BoardService;
import com.ch.s1.board.BoardVO;
import com.ch.s1.board.file.FileVO;
import com.ch.s1.util.FileManager;
import com.ch.s1.util.FilePathGenerator;
import com.ch.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeService implements BoardService{

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private FilePathGenerator filePathGenerator;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${board.notice.filePath}")
	private String filePath;
	
	public String summernote(MultipartFile file, HttpSession session)throws Exception{
		
		String path = session.getServletContext().getRealPath("/upload/notice");
		System.out.println(path);
		File dest = new File(path);
		String fileName = fileManager.saveFileCopy(file, dest);
		return fileName;
	}
	
	public boolean summernoteDelete(String file, HttpSession session)throws Exception{
		String path = session.getServletContext().getRealPath("/resources/upload/dominoNews");
		File file2 = new File(path, file);
		boolean result = false;
		if(file2.exists()) {
			result=file2.delete();
		}
		return result;
	}
		
	@Override
	public int setInsert(BoardVO boardVO, MultipartFile [] files) throws Exception {
		
		int result = noticeMapper.setInsert(boardVO);
		
		File file = filePathGenerator.getUseResourceLoader(this.filePath);
		
		for(MultipartFile multipartFile : files) {
			if(multipartFile.getSize()==0) {
				continue;
			}
			String fileName = fileManager.saveFileCopy(multipartFile, file);
			System.out.println(fileName);
			FileVO fileVO = new FileVO();
			fileVO.setFileName(fileName);
			fileVO.setOriName(multipartFile.getOriginalFilename());
			fileVO.setBoard_num(boardVO.getBoard_num());
			
			result = noticeMapper.setInsertFile(fileVO);
		}
		return result;
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		return noticeMapper.setUpdate(boardVO);
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		return noticeMapper.setDelete(boardVO);
	}

	@Override
	public List<BoardVO> getList(Pager pager) throws Exception {
		
		pager.makeRow();
		long totalCount = noticeMapper.getCount(pager);
		pager.makePage(totalCount);
		return noticeMapper.getList(pager);
	}

	@Override
	public BoardVO getOne(BoardVO boardVO) throws Exception {
		return noticeMapper.getOne(boardVO);
	}

	@Override
	public FileVO getFile(FileVO fileVO) throws Exception {
		return noticeMapper.getFile(fileVO);
	}

	
}
