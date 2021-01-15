package com.ch.s1.locker;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LockerService {

	@Autowired
	private LockerMapper lockerMapper;
	
	public List<LockerVO> getList() throws Exception{
		return lockerMapper.getList();
	}
	
	public int setLockerEnter(long locker_num) throws Exception{
		return lockerMapper.setLockerEnter(locker_num);
	}
	
	public int setLockerExit(long locker_num) throws Exception{
		return lockerMapper.setLockerExit(locker_num);
	}
	
	public LockerReserveVO getMemberLocker(long mem_num) throws Exception{
		return lockerMapper.getMemberLocker(mem_num);
	}
	
	public int setInsert(LockerReserveVO lockerReserveVO) throws Exception{
		return lockerMapper.setInsert(lockerReserveVO);
	}
}
