package kr.or.dw.calendar.dao;

import java.util.List;
import java.util.Map;

import kr.or.dw.vo.CalendarVO;

public interface ICalendarDao {
	
	/**
	 * 모든 일정 가져오는 메서드
	 * @return
	 */
	public List<CalendarVO> getAllEvents();

	public Map<String, CalendarVO> getAllEventsMap();

}
