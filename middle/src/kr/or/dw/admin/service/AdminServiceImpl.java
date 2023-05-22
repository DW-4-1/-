package kr.or.dw.admin.service;

import kr.or.dw.admin.dao.AdminDaoImpl;
import kr.or.dw.admin.dao.IAdminDao;

public class AdminServiceImpl implements IAdminService{
	private IAdminDao dao;
	private static AdminServiceImpl service;
	
	public static AdminServiceImpl getInstance() {
		if(service == null) {
			service = new AdminServiceImpl();
		}
		return service;
	}
	
	//생성자
	private AdminServiceImpl() {
		dao = AdminDaoImpl.getInstance();
	}
}
