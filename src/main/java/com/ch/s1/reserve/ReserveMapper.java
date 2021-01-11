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
}
