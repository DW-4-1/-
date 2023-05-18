package kr.or.dw.student.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;

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

	@Override
	public int stuLogin(StudentVO stuVo) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("student.studentLogin", stuVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return cnt;
	}
}
