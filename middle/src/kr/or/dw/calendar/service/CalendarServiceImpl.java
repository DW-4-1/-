package kr.or.dw.calendar.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.calendar.dao.CalendarDaoImpl;
import kr.or.dw.calendar.dao.ICalendarDao;
import kr.or.dw.vo.CalendarVO;

public class CalendarServiceImpl implements ICalendarService{

	private ICalendarDao dao;
	private static CalendarServiceImpl service;
	
	public static CalendarServiceImpl getInstance() {
		if(service == null) {
			service = new CalendarServiceImpl();
		}
		return service;
	}
	
	//생성자
	private CalendarServiceImpl() {
		dao = CalendarDaoImpl.getInstance();
	}

	@Override
	public List<CalendarVO> getAllEvents() {
		return dao.getAllEvents();
	}

	@Override
	public Map<String, CalendarVO> getAllEventsMap() {
		// TODO Auto-generated method stub
		return dao.getAllEventsMap();
	}


}
