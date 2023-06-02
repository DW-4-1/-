package kr.or.dw.assign.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;


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




	
}
