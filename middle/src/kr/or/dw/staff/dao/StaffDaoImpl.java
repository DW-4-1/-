package kr.or.dw.staff.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.StaffVO;

public class StaffDaoImpl implements IStaffDao{
private static StaffDaoImpl dao;
	
	private SqlMapClient smc; 	//ibatis 용 SqlMapClient 객체 변수 선언
	
	private StaffDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static StaffDaoImpl getInstance() {
		if(dao == null) {
			dao = new StaffDaoImpl();
		}
		return dao;
	}

	@Override
	public StaffVO staffLogin(String staff_id) {
		StaffVO vo = null;
		try {
			vo = (StaffVO) smc.queryForObject("staff.staffLogin", staff_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	

}
