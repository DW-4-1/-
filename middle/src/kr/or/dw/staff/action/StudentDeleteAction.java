package kr.or.dw.staff.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.JsonArray;

import kr.or.dw.student.service.IStudentService;
import kr.or.dw.student.service.StudentServiceImpl;
import kr.or.dw.vo.StudentVO;
import kr.or.dw.web.IAction;import oracle.sql.ARRAY;

public class StudentDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("action");
		IStudentService service = StudentServiceImpl.getInstance();
		String stu_id = req.getParameter("stu_id");
	    
	    JSONArray jsonArr = new JSONArray();
	    
	    // 문자열 형식의 데이터를 JSONArray로 가공
//	    jsonArr =  JSONArray.writeJSONString(stu_id);		
//		for(int i = 0; i < stu_id.length; i++) {
//			System.out.println(stu_id[i]);
//		}
		
//		service.studentDelete(stu_id);
		
		return null;
	}
	

}
