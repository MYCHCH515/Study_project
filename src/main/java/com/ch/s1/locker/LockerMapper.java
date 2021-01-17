package com.ch.s1.locker;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ch.s1.util.Pager;

@Mapper
public interface LockerMapper {

	public List<LockerVO> getList() throws Exception;
	
	public int setLockerEnter(long locker_num) throws Exception;
	
	public int setLockerExit(long locker_num) throws Exception;
	
	public LockerReserveVO getMemberLocker(long mem_num) throws Exception;
	
	public int setInsert(LockerReserveVO lockerReserveVO) throws Exception;

	public int setLockerCheckOut(LockerReserveVO lockerReserveVO) throws Exception;
	
	public List<LockerReserveVO> getReserveLockerList(Pager pager) throws Exception;

	public long getAllReserveCount(Pager pager) throws Exception;
	
	public int setSelectCheckOut(long reserve_locker_num) throws Exception;
	
	public LockerReserveVO getReserveInfo(LockerReserveVO lockerReserveVO) throws Exception;
}
