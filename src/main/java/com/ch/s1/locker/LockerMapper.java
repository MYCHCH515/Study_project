package com.ch.s1.locker;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LockerMapper {

	public List<LockerVO> getList() throws Exception;
	
	public int setLockerEnter(long locker_num) throws Exception;
	
	public int setLockerExit(long locker_num) throws Exception;
}
