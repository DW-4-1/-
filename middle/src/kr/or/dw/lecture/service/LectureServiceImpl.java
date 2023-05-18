package kr.or.dw.lecture.service;

import java.util.List;

import kr.or.dw.lecture.dao.ILectureDao;
import kr.or.dw.lecture.dao.LectureDaoImpl;
import kr.or.dw.vo.LectureVO;

public class LectureServiceImpl implements ILectureService{

	// DAO 객체 변수 생성
		private ILectureDao dao;
		private static LectureServiceImpl service;
		
		public static LectureServiceImpl getInstance() {
			if(service == null) {
				service = new LectureServiceImpl();
			}
			return service;
		}
		
		//생성자
		private LectureServiceImpl() {
			dao = LectureDaoImpl.getInstance();
		}

		@Override
		public List<LectureVO> getAllLecture(String stu_id) {
			return dao.getAllLecture(stu_id);
		}
}
