package kr.or.dw.student.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;

public class StudentDaoImpl implements IStudentDao{
	
private static StudentDaoImpl dao;
	
	private SqlMapClient smc; 	//ibatis 용 SqlMapClient 객체 변수 선언
	
	private StudentDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static StudentDaoImpl getInstance() {
		if(dao == null) {
			dao = new StudentDaoImpl();
		}
		return dao;
	}
}
