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

	@Override
	public int insertLecture(LectureVO lecVo) {
		int result = 0;
		String insert = "";
		try {
			insert = (String) smc.insert("lecture.insertLecture", lecVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(insert == null) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public String getLecCode() {
		String lec_code = null;
		try {
			lec_code = (String) smc.queryForObject("lecture.selecteLecCode");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lec_code;
	}

	@Override
	public List<LectureVO> staffLecList(String staff_id) {
		List<LectureVO> lecList = null;
		try {
			lecList = smc.queryForList("lecture.staffLecList", staff_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lecList;
	}

	@Override
	public LectureVO selectLecture(String lec_code) {
		LectureVO lecVo = null;
		try {
			lecVo = (LectureVO) smc.queryForObject("lecture.selectLecture", lec_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lecVo;
	}

	@Override
	public int deleteLecture(String lec_code) {
		int deleteRes = 0;
		try {
			deleteRes = smc.delete("lecture.deleteLecture", lec_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return deleteRes;
	}
	
	
	
}
