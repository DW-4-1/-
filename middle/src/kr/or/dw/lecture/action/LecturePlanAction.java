package kr.or.dw.lecture.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;

import kr.or.dw.lecture.service.ILectureService;
import kr.or.dw.lecture.service.LectureServiceImpl;
import kr.or.dw.vo.LectureVO;
import kr.or.dw.web.IAction;

public class LecturePlanAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		LectureVO lecVo = new LectureVO();
		String lec_code = req.getParameter("lec_code");
		lecVo.setLec_code(lec_code);
		System.out.println(lec_code);
		
		String planFoldName = "" + lec_code;
		String realPath = "C:/upload/planFile/" + planFoldName;
		
		String fileName = "";
		
		File fileUploadDirectory = new File(realPath);
		if(!fileUploadDirectory.exists()) {
			fileUploadDirectory.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(req, realPath, 100*1024*1024, "utf-8");
		fileName = multi.getFilesystemName("lec_plan");
		System.out.println(fileName);
		
		lecVo.setPlan_path(planFoldName + "/" + fileName);
		
		ILectureService service = LectureServiceImpl.getInstance();
		int cnt = 0;
		cnt = service.updatePlanFile(lecVo);
		

		Gson gson = new Gson();
		String result = gson.toJson(lecVo);
		PrintWriter out = res.getWriter();
		out.println(result);
		out.flush();
		
		
		return null;
	}

}