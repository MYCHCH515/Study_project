package com.ch.s1.reserve;

import java.sql.Date;

import lombok.Data;

@Data
public class ReserveVO {

	private int reserve_num;
	private int mem_num;
	private int seat_num;
	private int product_num;
	private Date reserve_regDate;
	private String reserve_strt_tm;
	private String reserve_end_tm;
}
