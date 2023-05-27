package kr.or.dw.lecture.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.lecture.service.ILectureService;
import kr.or.dw.lecture.service.LectureServiceImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;
import kr.or.dw.web.IAction;

public class LectureStudentListAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		List<LectureVO> stuList = null;
		
		String lec_code = req.getParameter("lecCode");
		
		ILectureService service = LectureServiceImpl.getInstance();
		stuList = service.getLectureStudentList(lec_code);
		
		req.setAttribute("stuList", stuList);
		
		return "/staff/score/lectureStudentList.jsp";
	}

}
