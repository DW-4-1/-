package kr.or.dw.calendar.service;

import java.util.List;

import kr.or.dw.vo.CalendarVO;

public interface ICalendarService {
	
	/**
	 * 모든 일정 가져오는 메서드
	 * @return
	 */
	List<CalendarVO> getAllEvents();

	
}
