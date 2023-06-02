package kr.or.dw.assign.service;

import kr.or.dw.assign.dao.AssignDaoImpl;
import kr.or.dw.assign.dao.IAssignDao;

public class AssignServiceImpl implements IAssignService{

	private IAssignDao dao;
	private static AssignServiceImpl service;
	
	public static AssignServiceImpl getInstance() {
		if(service == null) {
			service = new AssignServiceImpl();
		}
		return service;
	}
	
	//생성자
	private AssignServiceImpl() {
		dao = AssignDaoImpl.getInstance();
	}




}
