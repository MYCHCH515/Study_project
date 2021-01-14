package com.ch.s1.locker;

import java.sql.Date;

import lombok.Data;

@Data
public class LockerReserveVO {

	private long reserve_locker_num;
	private long mem_num;
	private long locker_num;
	private Date reserve_regDate;
	private String reserve_strt_tm;
	private String reserve_end_tm;
	private String payment_option;
	private String check_flag;
}
