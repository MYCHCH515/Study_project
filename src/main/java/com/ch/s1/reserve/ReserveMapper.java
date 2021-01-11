package com.ch.s1.reserve;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReserveMapper {

	public int setInsert(ReserveVO reserveVO) throws Exception;

	public ReserveVO getOne(ReserveVO reserveVO) throws Exception;
	
	public ReserveVO getLatestOne(ReserveVO reserveVO) throws Exception;
	
	public ReserveVO getSeatNum(long mem_num) throws Exception;
}
