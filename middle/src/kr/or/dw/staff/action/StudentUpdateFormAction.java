package kr.or.dw.staff.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.student.service.IStudentService;
import kr.or.dw.student.service.StudentServiceImpl;
import kr.or.dw.vo.StudentVO;
import kr.or.dw.web.IAction;

public class StudentUpdateFormAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String stu_id = req.getParameter("stu_id");
		
		req.setAttribute("stu_id", stu_id);
		IStudentService service = StudentServiceImpl.getInstance();
		
		List<StudentVO> staVo = service.getDept();
		
		req.setAttribute("dept", staVo);
		
		return "/staff/student/studentUpdateForm.jsp";
	}

}