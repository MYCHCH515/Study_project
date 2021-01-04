package com.ch.s1.reserve;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReserveMapper {

	public int setInsert(ReserveVO reserveVO) throws Exception;

}
