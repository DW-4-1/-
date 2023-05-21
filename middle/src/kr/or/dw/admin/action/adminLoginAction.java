package kr.or.dw.admin.action;

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

public class adminLoginAction implements IAction{

	@Override
	public boolean isRedirect() {
	
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		return null;
	}

}
