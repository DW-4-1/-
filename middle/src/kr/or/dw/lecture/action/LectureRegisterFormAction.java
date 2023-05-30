package kr.or.dw.lecture.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.lecture.service.ILectureService;
import kr.or.dw.lecture.service.LectureServiceImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.web.IAction;

public class LectureRegisterFormAction implements IAction{

	@Override
	public boolean isRedirect() {
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String stu_id = (String) session.getAttribute("stu_id");
		
		List<LectureVO> lecList = null;
		
		ILectureService service = LectureServiceImpl.getInstance();
		Date d = new Date();
		DateFormat yearFormat = new SimpleDateFormat("yyyy");
		DateFormat monthFormat = new SimpleDateFormat("MM");
		int lec_year = Integer.parseInt(yearFormat.format(d));
		int lec_term = Integer.parseInt(monthFormat.format(d));

		if(lec_term <= 7 && lec_term != 1) {
			lec_term = 1;
		}else {
			lec_term = 2;
			
		}
		LectureVO lecVo = new LectureVO();
		lecVo.setLec_term(lec_term);
		lecVo.setLec_year(lec_year);
		
		lecList = service.getAllLectureRegister(lecVo);
		
		List<LectureVO> stuLecList = null;
		stuLecList = service.getAllLecture(stu_id);
		
		List<LectureVO> remove = new ArrayList<>();
		System.out.println(lecList);
		
		for(LectureVO stulec : stuLecList) {
			for(LectureVO lecall : lecList) {
				if(stulec.getLec_code().equals(lecall.getLec_code())) {
					remove.add(lecall);
				}
			}
		}
		System.out.println(remove);
		lecList.removeAll(remove);
		
		System.out.println(lecList);
	
		req.setAttribute("lecList", lecList);
		
		return "/student/lecture/lectureRegister.jsp";
	}

}
