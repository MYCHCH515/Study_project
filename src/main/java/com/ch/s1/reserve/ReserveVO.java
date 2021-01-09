package com.ch.s1.reserve;

import java.sql.Date;
import java.util.List;

import com.ch.s1.product.ProductVO;

import lombok.Data;

@Data
public class ReserveVO {

	private long reserve_num;
	private long mem_num;
	private long seat_num;
	private long product_num;
	private Date reserve_regDate;
	private String reserve_strt_tm;
	private String reserve_end_tm;
	private String payment_option;
	
	private ProductVO productVOs;
}
