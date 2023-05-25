package kr.or.dw.student.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.student.service.IStudentService;
import kr.or.dw.student.service.StudentServiceImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.vo.StudentVO;
import kr.or.dw.web.IAction;

public class StudentLoginAction implements IAction{

	@Override
	public boolean isRedirect() {
	
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IStudentService service = StudentServiceImpl.getInstance();
		
		int cnt = 0;
		String view = "";
		
		String stu_id = req.getParameter("stu_id");
		String stu_pwd = req.getParameter("stu_pwd");

		StudentVO stuVo = new StudentVO();
		stuVo.setStu_id(stu_id);
		stuVo.setStu_pwd(stu_pwd);
		
		cnt = service.stuLogin(stuVo);
		if(cnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("stu_id", stu_id);
			view = "/student/main.jsp";
		}else {
			view = "/index.jsp";
		}
		
		return view;
	}

}
