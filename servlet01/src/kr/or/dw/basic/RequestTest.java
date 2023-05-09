package kr.or.dw.basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/requestTest.do")
public class RequestTest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		// getParameter("파라미터명") ==> 해당 파라미터에 설정된 "값"을 가져온다.
		//							==> 가져오는 "값"의 자료형은 String이다.
		// 이 "파라미터명"은<form> 태그의 하위태그에 만들어진 태그의 "name속성값"을 말한다.
		String userName = req.getParameter("userName");
		String job = req.getParameter("job");
//		String hobby = req.getParameter("hobby");
		
		//getParameterValues("파라미터명") ==> 파라미터명이 같은 것이 여러개일 경우에 사용한다.
		//								==> 가져오는 "값"의 자료형은 String[]이다.
		String[] hobbies = req.getParameterValues("hobby");
		
		System.out.println("userName : " + userName);
		System.out.println("job : " + job);
		System.out.println("hobby : " + Arrays.toString(hobbies));
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");

		PrintWriter out = res.getWriter();
		
		out.println("<html><head><meta charset='utf-8'><title>Request 객체 연습</title>");
		out.println("<body>");
		out.println("<h2>request 객체 테스트 결과</h2><hr>");
		out.println("<table border='1'");
		out.println("<tr><td>이름</td>");
		out.println("<td>" + userName + "</td></tr>");
		out.println("<tr><td>직업</td>");
		out.println("<td>" + job + "</td></tr>");
		out.println("<tr><td>취미</td>");
		out.println("<td>");
		
		// 배열 개수만큼 반복문을 이용해서 출력한다
		for(String hobby : hobbies) {
			out.println(hobby + "<br>");
		}
		out.println("</td></tr>");
		out.println("</table>");

		
		out.println("<hr>");
		
		out.println("<h2>Request 객체 기타 메서드 결과</h2>");
		out.println("<table border='1'><tr><td>");
		out.println("1. 클라이언트의 IP주소 : " + req.getRemoteAddr() + "<br>");
		out.println("2. 요청 메서드 : " + req.getMethod() + "<br>");
		out.println("3. ContextPath : " + req.getContextPath() + "<br>");
		out.println("4. 프로토콜 : " + req.getProtocol() + "<br>");
		out.println("5. 요청 URL : " + req.getRequestURL() + "<br>");
		out.println("6. 요청 URI : " + req.getRequestURI() + "<br>");
		out.println("</td></tr></table>");
		
		out.println("</body></html>");
		
	}

	
}
