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
	public StudentVO stuLogin(String stu_id) {
		StudentVO vo = null;
		try {
			vo = (StudentVO) smc.queryForObject("student.studentLogin", stu_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return vo;
	}

	@Override
	public List<StudentVO> getAllStudentInfo() {
		
		List<StudentVO> stuInfo = null;
		
		try {
			stuInfo = (List) smc.queryForList("student.studentAllInfo");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return stuInfo;
	}

	@Override
	public StudentVO studentInfo(String stu_id) {
		StudentVO stuVo = new StudentVO();
		try {
			stuVo = (StudentVO) smc.queryForObject("student.studentInfo", stu_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return stuVo;
	}

	@Override
	public int studentInfoUpdate(StudentVO stuVo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("student.stuInfoUpdate", stuVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public int passwordUpdate(StudentVO stuVo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("student.passwordUpdate", stuVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int idEmailCheck(StudentVO stuVo) {
		int result = 0;
		try {
			result = (int) smc.queryForObject("student.idEmailCheck", stuVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	
}
