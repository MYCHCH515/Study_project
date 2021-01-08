package com.ch.s1.board;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class BoardVO {
	
	private long board_num;
	
	@NotEmpty
	private String board_title;
	
	@NotEmpty
	private String board_writer;
	
	private String board_contents;
	
	private Date regDate;
	private long hit;
}
