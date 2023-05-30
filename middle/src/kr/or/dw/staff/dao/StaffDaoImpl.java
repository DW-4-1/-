package kr.or.dw.staff.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StaffVO;
import kr.or.dw.vo.StudentVO;

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

	@Override
	public String getStaffName(String staff_id) {
		String staff_name = null;
		try {
			staff_name = (String) smc.queryForObject("staff.getStaffName", staff_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return staff_name;
	}

	@Override
	public int idEmailCheck(StaffVO staffVo) {
		int result = 0;
		try {
			result = (int) smc.queryForObject("staff.idEmailCheck", staffVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<StaffVO> getAllProfessorList() {
		
		List<StaffVO> staVoList = null;
		
		try {
			staVoList = smc.queryForList("staff.getAllProfessorList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staVoList;
	}

	@Override
	public List<StaffVO> getDept() {
		List<StaffVO> staVo = null;
		
		try {
			staVo = smc.queryForList("staff.getDept");
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		
		return staVo;
	}


}
