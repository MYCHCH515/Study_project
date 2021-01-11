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
	
	public int setSeatEnter(long seat_num) throws Exception{
		return seatMapper.setSeatEnter(seat_num);
	}
	
	public int setSeatExit(long seat_num) throws Exception{
		return seatMapper.setSeatExit(seat_num);
	}
}
