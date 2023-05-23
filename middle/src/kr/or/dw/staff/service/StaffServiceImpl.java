package kr.or.dw.staff.service;

import kr.or.dw.staff.dao.StaffDaoImpl;
import kr.or.dw.staff.dao.IStaffDao;

public class StaffServiceImpl implements IStaffService{
	private IStaffDao dao;
	private static StaffServiceImpl service;
	
	public static StaffServiceImpl getInstance() {
		if(service == null) {
			service = new StaffServiceImpl();
		}
		return service;
	}
	
	//생성자
	private StaffServiceImpl() {
		dao = StaffDaoImpl.getInstance();
	}
}
