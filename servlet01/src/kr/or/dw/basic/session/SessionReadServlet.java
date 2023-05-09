package kr.or.dw.basic.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SessionReadServlet.do")
public class SessionReadServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 저장된 Session정보 읽어오기
		
		// 1. 세션객체 가져오기
		HttpSession session = req.getSession();
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		out.println("<html><head><meta charset='utf-8'><title>Session 연습</title></head>");
		out.println("<body>");
		out.println("<h2>저장된 Session 데이터 확인하기.</h2><br><br>");
		
		// 2. getAttribute()메서드로 Session 값을 읽어온다.
		
		out.println("<a href='" + req.getContextPath() + "/basic/03/sessionTest.jsp'>시작문서로 이동</a>");
		out.println("</body></html>");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
