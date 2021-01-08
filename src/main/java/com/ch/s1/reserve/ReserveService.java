package com.ch.s1.reserve;

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
		return reserveMapper.setInsert(reserveVO);
	}
	
	public ReserveVO getOne(ReserveVO reserveVO) throws Exception{
		return reserveMapper.getOne(reserveVO);
	}
	
	public ReserveVO getLatestOne(ReserveVO reserveVO) throws Exception{
		return reserveMapper.getLatestOne(reserveVO);
	}

}
