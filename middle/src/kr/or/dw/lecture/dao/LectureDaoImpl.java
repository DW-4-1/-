package kr.or.dw.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;

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

	@Override
	public List<LectureVO> getLectureStudentList(String lec_code) {
		List<LectureVO> lecList = null;
		try {
			lecList = smc.queryForList("lecture.getLectureStudent", lec_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lecList;
	}

	@Override
	public int updateScore(LectureVO lecVo) {
		int result = 0;
		try {
			result = smc.update("lecture.updateScore", lecVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updatePlanFile(LectureVO lecVo) {
		int result = 0;
		try {
			result = smc.update("lecture.updatePlanFile", lecVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public String getPlanPath(String lec_code) {
		String plan_path = null;
		try {
			plan_path = (String) smc.queryForObject("lecture.getPlanPath", lec_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return plan_path;
	}

	@Override
	public List<LectureVO> getAllLectureRegister(LectureVO lecVo) {
		List<LectureVO> lecList = null;
		try {
			lecList = smc.queryForList("lecture.getAllLectureRegister", lecVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lecList;
	}

	@Override
	public int registerLecture(LectureVO lecVo) {
		String result = null;
		try {
			result = (String) smc.insert("lecture.regusterLecture", lecVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int cnt = 0;
		if(result == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteStudentLecture(LectureVO lecVo) {
		int result = 0;
		try {
			result = smc.delete("lecture.deleteStudentLecture", lecVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	@Override
	public int getMaxPeo(String lec_code) {
		int max_peo = 1;
		try {
			max_peo = (int) smc.queryForObject("lecture.getMaxPeo", lec_code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return max_peo;
	}

	@Override
	public int getCurPeo(String lec_code) {
		int cur_peo = 0;
		try {
			cur_peo = (int) smc.queryForObject("lecture.getCurPeo", lec_code);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return cur_peo;
	}

	@Override
	public List<StudentVO> getLectureStudentListForm(String lec_code) {
		List<StudentVO> stuList = null;
		try {
			stuList = smc.queryForList("lecture.lectureStuListForm", lec_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stuList;
	}
	
	
	
}
