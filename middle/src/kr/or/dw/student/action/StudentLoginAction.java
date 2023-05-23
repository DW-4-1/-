package kr.or.dw.student.action;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.student.service.IStudentService;
import kr.or.dw.student.service.StudentServiceImpl;
import kr.or.dw.util.CryptoUtil;
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
		
		
		String view = "";
		
		String stu_id = req.getParameter("stu_id");
		String stu_pwd = req.getParameter("stu_pwd");
		
		IStudentService service = StudentServiceImpl.getInstance();
		
		System.out.println("action1");
		StudentVO vo = service.stuLogin(stu_id);
		System.out.println("action2");
		
		String cpass = "";
		try {
			cpass = CryptoUtil.sha512(stu_pwd);
			System.out.println("action3");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = 0;
		if(vo != null && (cpass.equals(vo.getStu_pwd()) || stu_pwd.equals(vo.getStu_pwd()))) {
			result = 1;
			System.out.println("action4");
			HttpSession session = req.getSession();
			session.setAttribute("stu_id", stu_id);
		}
		
		req.setAttribute("result", result);

		return "/student/studentLoginResult.jsp";
	}

}
