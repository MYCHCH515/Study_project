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

	public List<ProductVO> getProductList() throws Exception {
		return productMapper.getList();
	}

	public int setInsert(ReserveVO reserveVO) throws Exception {
		
		 String before_st = reserveVO.getReserve_strt_tm(); 
		 String before_et = reserveVO.getReserve_end_tm();
		 
		 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date after_st = sf.parse(before_st); 
		 Date after_et = sf.parse(before_et);
		  
		 System.out.println("-----after_st: " + after_st);
		 System.out.println("-----after_et: " + after_et);
 
		return reserveMapper.setInsert(reserveVO);
	}
	
	public ReserveVO getOne(ReserveVO reserveVO) throws Exception{
		return reserveMapper.getOne(reserveVO);
	}

}
