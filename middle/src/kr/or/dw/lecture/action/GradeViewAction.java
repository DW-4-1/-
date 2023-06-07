package kr.or.dw.lecture.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.lecture.service.ILectureService;
import kr.or.dw.lecture.service.LectureServiceImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.web.IAction;

public class GradeViewAction implements IAction{

	@Override
	public boolean isRedirect() {
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String stu_id = (String) session.getAttribute("stu_id");
		
		ILectureService service = LectureServiceImpl.getInstance();
		int leccnt = 0;
		int evalcnt = 0;
		leccnt = service.getStuLecCnt(stu_id);
		evalcnt = service.getStuEvalCnt(stu_id);
		if(leccnt != evalcnt) {
			return "/student/lecture/gradeFail.jsp";
		}else {
			
		
		
			List<LectureVO> lecList = service.getAllLecture(stu_id);
			
			req.setAttribute("lecList", lecList);
			req.setAttribute("titleName", "성적 조회");
			
			return "/student/lecture/gradeView.jsp";
		}
	}

}
