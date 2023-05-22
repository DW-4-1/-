package kr.or.dw.admin.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;

public class AdminDaoImpl implements IAdminDao{
private static AdminDaoImpl dao;
	
	private SqlMapClient smc; 	//ibatis 용 SqlMapClient 객체 변수 선언
	
	private AdminDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static AdminDaoImpl getInstance() {
		if(dao == null) {
			dao = new AdminDaoImpl();
		}
		return dao;
	}
	

}
