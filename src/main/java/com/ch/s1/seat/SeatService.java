package com.ch.s1.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatService {
	
	@Autowired
	private SeatMapper seatMapper;
	
	public List<SeatVO> getList() throws Exception{
		return seatMapper.getList();
	}

}
