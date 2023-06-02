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

	@Override
	public int insertAssign(AssignVO assignVo) {
		int assign_no = 0;
		try {
			assign_no = (int) smc.insert("assign.insertAssign", assignVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return assign_no;
	}

	@Override
	public List<AssignVO> getSubStudentList(int assign_no) {
		List<AssignVO> stuList = null;
		try {
			stuList = smc.queryForList("assign.getSubStudent", assign_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stuList;
	}

	@Override
	public List<AssignVO> getStuAssignList(String stu_id) {
		List<AssignVO> assignList = null;
		try {
			assignList = smc.queryForList("assign.getStuAssignList", stu_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return assignList;
	}

	@Override
	public AssignVO viewAssign(int assign_no) {
		AssignVO assignVo = null;
		try {
			assignVo = (AssignVO) smc.queryForObject("assign.viewAssign", assign_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return assignVo;
	}

	@Override
	public int updateAssign(AssignVO assignVo) {
		int result = 0;
		try {
			result = smc.update("assign.updateAssign", assignVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteAssign(int assign_no) {
		int result = 0;
		try {
			result = smc.delete("assign.deleteAssign", assign_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int submitAssignFile(AssignVO assignVo) {
		String result = null;
		try {
			result = (String) smc.insert("assign.insertAssignFile", assignVo);
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




	
}
