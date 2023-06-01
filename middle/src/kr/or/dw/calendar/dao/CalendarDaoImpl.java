package kr.or.dw.calendar.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;


public class CalendarDaoImpl implements ICalendarDao{
	
private static CalendarDaoImpl dao;
	
	private SqlMapClient smc; 	//ibatis 용 SqlMapClient 객체 변수 선언
	
	private CalendarDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static CalendarDaoImpl getInstance() {
		if(dao == null) {
			dao = new CalendarDaoImpl();
		}
		return dao;
	}





	
}
