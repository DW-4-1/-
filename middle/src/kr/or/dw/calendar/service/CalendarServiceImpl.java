package kr.or.dw.calendar.service;

import kr.or.dw.calendar.dao.CalendarDaoImpl;
import kr.or.dw.calendar.dao.ICalendarDao;

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


}
