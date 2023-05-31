package kr.or.dw.lecture.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.lecture.service.ILectureService;
import kr.or.dw.lecture.service.LectureServiceImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.web.IAction;

public class DeleteStudentLectureAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String stu_id = req.getParameter("stu_id");
		String lec_code = req.getParameter("lec_code");
		
		LectureVO lecVo = new LectureVO();
		
		lecVo.setLec_code(lec_code);
		lecVo.setStu_id(stu_id);
		
		ILectureService service = LectureServiceImpl.getInstance();
		int result = 0;
		result = service.deleteStudentLecture(lecVo);
		
		
		return "/lecture/lectureStudentList.do?lecCode=" + lec_code;
	}

}
