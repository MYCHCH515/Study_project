package com.ch.s1.locker;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ch.s1.reserve.ReserveVO;

@Mapper
public interface LockerMapper {

	public List<LockerVO> getList() throws Exception;
	
	public int setLockerEnter(long locker_num) throws Exception;
	
	public int setLockerExit(long locker_num) throws Exception;
	
	public LockerReserveVO getMemberLocker(long mem_num) throws Exception;
	
	public int setInsert(LockerReserveVO lockerReserveVO) throws Exception;

	public int setLockerCheckOut(LockerReserveVO lockerReserveVO) throws Exception;
}
