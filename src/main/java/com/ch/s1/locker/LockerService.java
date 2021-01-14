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
	
	public int setSeatEnter(long locker_num) throws Exception{
		return lockerMapper.setLockerEnter(locker_num);
	}
	
	public int setSeatExit(long locker_num) throws Exception{
		return lockerMapper.setLockerExit(locker_num);
	}
}
