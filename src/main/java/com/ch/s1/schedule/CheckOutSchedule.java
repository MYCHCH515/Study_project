package com.ch.s1.schedule;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ch.s1.reserve.ReserveMapper;
import com.ch.s1.reserve.ReserveVO;
import com.ch.s1.seat.SeatMapper;

@Component
public class CheckOutSchedule {

	@Autowired
	private ReserveMapper reserveMapper;
	@Autowired
	private SeatMapper seatMapper;
	
	//@Scheduled(cron = "* * * * * * ")
	public void cronTest() throws Exception{
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		List<ReserveVO> ar = reserveMapper.getCheckEndTime();
		for(ReserveVO reserveVO : ar) {
			Calendar ca = Calendar.getInstance();
			
			System.out.println("-------cron Test--------");
			
			String str = sf.format(ca.getTime());
			String end_tm = reserveVO.getReserve_end_tm();
			
			System.out.println(str);
			System.out.println(end_tm);
			
			if(str.equals(end_tm)) {
				long seat_num = reserveVO.getSeat_num();
				reserveMapper.setCheckOut(reserveVO);
				seatMapper.setSeatExit(seat_num);
			}
			else {
				System.out.println("퇴실실패");
			}
		}
	}
	
	
}
