package kr.or.dw.student.service;

import java.util.List;

import kr.or.dw.student.dao.IStudentDao;
import kr.or.dw.student.dao.StudentDaoImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;

public class StudentServiceImpl implements IStudentService{

	private IStudentDao dao;
	private static StudentServiceImpl service;
	
	public static StudentServiceImpl getInstance() {
		if(service == null) {
			service = new StudentServiceImpl();
		}
		return service;
	}
	
	//생성자
	private StudentServiceImpl() {
		dao = StudentDaoImpl.getInstance();
	}

	@Override
	public int stuLogin(StudentVO stuVo) {
		return dao.stuLogin(stuVo);
	}

	@Override
	public StudentVO getAllStudentInfo(String stu_id) {
		return dao.getAllStudentInfo(stu_id);
	}
}
