package kr.or.dw.staff.service;

import kr.or.dw.staff.dao.StaffDaoImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StaffVO;
import kr.or.dw.vo.StudentVO;

import java.util.List;

import kr.or.dw.staff.dao.IStaffDao;

public class StaffServiceImpl implements IStaffService{
	private IStaffDao dao;
	private static StaffServiceImpl service;
	
	public static StaffServiceImpl getInstance() {
		if(service == null) {
			service = new StaffServiceImpl();
		}
		return service;
	}
	
	//생성자
	private StaffServiceImpl() {
		dao = StaffDaoImpl.getInstance();
	}

	@Override
	public StaffVO staffLogin(String staff_id) {
		
		return dao.staffLogin(staff_id);
	}

	@Override
	public String getStaffName(String staff_id) {
		return dao.getStaffName(staff_id);
	}

	@Override
	public int idEmailCheck(StaffVO staffVo) {
		return dao.idEmailCheck(staffVo);
	}

	@Override
	public List<StaffVO> getAllProfessorList() {
		return dao.getAllProfessorList();
	}

	@Override
	public List<StaffVO> getDept() {
		return dao.getDept();
	}

	@Override
	public List<StaffVO> professorInsert(StaffVO staVo) {
		return dao.professorInsert(staVo);
	}

	@Override
	public int professorDelete(String id) {
		return dao.professorDelete(id);
	}

	@Override
	public StaffVO getstaffInfo(String sta_id) {
		return dao.getstaffInfo(sta_id);
	}

	@Override
	public int professorUpdate(StaffVO staVo) {
		return dao.professorUpdate(staVo);
	}

	@Override
	public int selectProfessorCount(String search) {
		return dao.selectProfessorCount(search);
	}

}
