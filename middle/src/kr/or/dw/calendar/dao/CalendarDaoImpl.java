package kr.or.dw.calendar.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.CalendarVO;


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

	@Override
	public List<CalendarVO> getAllEvents() {
		List<CalendarVO> calList = null;
		try {
			calList = smc.queryForList("calendar.calenList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return calList;
	}





	
}
