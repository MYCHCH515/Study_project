package com.ch.s1.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int board_num;
	private String board_title;
	private String board_writer;
	private String board_contents;
	private Date regDate;
	private int hit;
}
