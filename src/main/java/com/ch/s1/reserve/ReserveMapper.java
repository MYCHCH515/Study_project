package com.ch.s1.reserve;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ch.s1.util.Pager;

@Mapper
public interface ReserveMapper {

	public List<ReserveVO> getList(Pager pager) throws Exception;
	
	public int setInsert(ReserveVO reserveVO) throws Exception;

	public ReserveVO getOne(ReserveVO reserveVO) throws Exception;
	
	public ReserveVO getLatestOne(ReserveVO reserveVO) throws Exception;
	
	public ReserveVO getSeatNum(long mem_num) throws Exception;
	
	public ReserveVO getMemberSeat(long mem_num) throws Exception;
	
	public long getCount(Pager pager) throws Exception;
	
	public int setCheckOut(ReserveVO reserveVO) throws Exception;
	
	public int setSelectCheckOut(long reserve_num) throws Exception;
	
	public ReserveVO getReserveInfo(ReserveVO reserveVO) throws Exception;

	public int setChangeSeat(ReserveVO reserveVO) throws Exception;
	
	public int setExtendTime(ReserveVO reserveVO) throws Exception;
	
	public List<ReserveVO> getReserveList(Pager pager) throws Exception;
	
	public long getAllReserveCount(Pager pager) throws Exception;
	
	public List<ReserveVO> getCheckEndTime() throws Exception;
}
