package kr.or.dw.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.LectureVO;

public class LectureDaoImpl implements ILectureDao{
	
private static LectureDaoImpl dao;
	
	private SqlMapClient smc; 	//ibatis 용 SqlMapClient 객체 변수 선언
	
	private LectureDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static LectureDaoImpl getInstance() {
		if(dao == null) {
			dao = new LectureDaoImpl();
		}
		return dao;
	}

	@Override
	public List<LectureVO> getAllLecture(String stu_id) {
		List<LectureVO> lecList = null;
		try {
			lecList = smc.queryForList("lecture.getAllLecture", stu_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lecList;
	}
}
