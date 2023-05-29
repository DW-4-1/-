package kr.or.dw.student.action;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.student.service.IStudentService;
import kr.or.dw.student.service.StudentServiceImpl;
import kr.or.dw.util.CryptoUtil;
import kr.or.dw.vo.StudentVO;
import kr.or.dw.web.IAction;

public class PasswordUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IStudentService service = StudentServiceImpl.getInstance();
		
		
		StudentVO stuVo = new StudentVO();
		
		String stu_pass = (String) req.getParameter("pwd");
		
		try {
			stu_pass = CryptoUtil.sha512(stu_pass);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		stuVo.setStu_pwd(stu_pass);
		int stu_pwd = service.passwordUpdate(stuVo);
		req.setAttribute("stu_pwd", stu_pwd);
		
		
		return "/student/studentInfo.do";
	}

}
