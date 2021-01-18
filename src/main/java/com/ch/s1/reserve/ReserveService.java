package com.ch.s1.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.s1.product.ProductMapper;
import com.ch.s1.product.ProductVO;
import com.ch.s1.util.Pager;

@Service
public class ReserveService {

	@Autowired
	private ReserveMapper reserveMapper;

	@Autowired
	private ProductMapper productMapper;

	public List<ReserveVO> getList(Pager pager) throws Exception{
		pager.makeRow();
		long totalCount =  reserveMapper.getCount(pager);
		pager.makePage(totalCount);
		return reserveMapper.getList(pager);
	}
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
	
	public ReserveVO getSeatNum(long mem_num) throws Exception{
		return reserveMapper.getSeatNum(mem_num);
	}
	
	public ReserveVO getMemberSeat(long mem_num) throws Exception{
		return reserveMapper.getMemberSeat(mem_num);
	}
	
	public int setCheckOut(ReserveVO reserveVO) throws Exception{
		return reserveMapper.setCheckOut(reserveVO);
	}
	
	public int setSelectCheckOut(long reserve_num) throws Exception{
		return reserveMapper.setSelectCheckOut(reserve_num);
	}
	
	public ReserveVO getReserveInfo(ReserveVO reserveVO) throws Exception{
		return reserveMapper.getReserveInfo(reserveVO);
	}
	
	public int setChangeSeat(ReserveVO reserveVO) throws Exception{
		return reserveMapper.setChangeSeat(reserveVO);
	}
	
	public int setExtendTime(ReserveVO reserveVO) throws Exception{
		return reserveMapper.setExtendTime(reserveVO);
	}
	
	public List<ReserveVO> getReserveList(Pager pager) throws Exception{
		
		pager.makeRow();
		long totalCount =  reserveMapper.getAllReserveCount(pager);
		pager.makePage(totalCount);

		return reserveMapper.getReserveList(pager);
	}
	
	public List<ReserveVO> getCheckEndTime() throws Exception{
		return reserveMapper.getCheckEndTime();
	}

}
