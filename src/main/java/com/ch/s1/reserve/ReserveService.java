package com.ch.s1.reserve;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.s1.product.ProductMapper;
import com.ch.s1.product.ProductVO;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductVO> getProductList() throws Exception{
		return productMapper.getList();
	}
	
	public int setInsert(ReserveVO reserveVO) throws Exception{
		
		String before_st = reserveVO.getReserve_strt_tm();
	    String before_et = reserveVO.getReserve_end_tm();
	    
	    SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date after_st = transFormat.parse(before_st);
	    Date after_et = transFormat.parse(before_et);

	    System.out.println("-----startDate: " + after_st); // 2019-04-28
	    System.out.println("-----endDate: " + after_et); // 2019-05-05
		
		return reserveMapper.setInsert(reserveVO);
	}

}
