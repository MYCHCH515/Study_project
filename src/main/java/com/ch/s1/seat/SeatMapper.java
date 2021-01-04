package com.ch.s1.seat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatMapper {
	
	public List<SeatVO> getList() throws Exception;

}
