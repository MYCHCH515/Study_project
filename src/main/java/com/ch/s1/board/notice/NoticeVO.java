package com.ch.s1.board.notice;

import java.util.List;

import com.ch.s1.board.BoardVO;
import com.ch.s1.board.file.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeVO extends BoardVO{

	private List<FileVO> files;
}
