package kr.or.dw.assign.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.AssignVO;


public class AssignDaoImpl implements IAssignDao{
	
private static AssignDaoImpl dao;
	
	private SqlMapClient smc; 	//ibatis 용 SqlMapClient 객체 변수 선언
	
	private AssignDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static AssignDaoImpl getInstance() {
		if(dao == null) {
			dao = new AssignDaoImpl();
		}
		return dao;
	}

	@Override
	public List<AssignVO> getLectureAssignList(String lec_code) {
		List<AssignVO> assignList = null;
		
		try {
			assignList = smc.queryForList("assign.getLecAssignList", lec_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return assignList;
	}




	
}
