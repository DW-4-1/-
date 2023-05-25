package kr.or.dw.vo;

public class StaffVO {
	private String staff_id;	//아이디
	private String staff_name;	//이름
	private String staff_pwd;	//비밀번호
	private String staff_resnum;	//주민번호
	private String staff_gender;	//성별
	private String staff_div;	//구분 (교수, 관리자)
	private String staff_dept;	//소속 (교수라면 과이름, 관리자면 담당 부서 이름)
	private int staff_deptno;	//소속번호 (교수라면 과번호, 관리자면 담당 부서 번호)
	private String staff_addr;	//주소
	private int staff_zipcode;	//우편번호
	private String staff_email;	//이메일
	private String staff_tel;	//전화번호
	private String staff_auth_cd;	//권한코드
	private String staff_state;	//현재 상태 (재학, 휴학, 졸업)
	private String staff_joinDate;	//가입일
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStaff_pwd() {
		return staff_pwd;
	}
	public void setStaff_pwd(String staff_pwd) {
		this.staff_pwd = staff_pwd;
	}
	public String getStaff_resnum() {
		return staff_resnum;
	}
	public void setStaff_resnum(String staff_resnum) {
		this.staff_resnum = staff_resnum;
	}
	public String getStaff_gender() {
		return staff_gender;
	}
	public void setStaff_gender(String staff_gender) {
		this.staff_gender = staff_gender;
	}
	public String getStaff_div() {
		return staff_div;
	}
	public void setStaff_div(String staff_div) {
		this.staff_div = staff_div;
	}
	public String getStaff_dept() {
		return staff_dept;
	}
	public void setStaff_dept(String staff_dept) {
		this.staff_dept = staff_dept;
	}
	public int getStaff_deptno() {
		return staff_deptno;
	}
	public void setStaff_deptno(int staff_deptno) {
		this.staff_deptno = staff_deptno;
	}
	public String getStaff_addr() {
		return staff_addr;
	}
	public void setStaff_addr(String staff_addr) {
		this.staff_addr = staff_addr;
	}
	public int getStaff_zipcode() {
		return staff_zipcode;
	}
	public void setStaff_zipcode(int staff_zipcode) {
		this.staff_zipcode = staff_zipcode;
	}
	public String getStaff_email() {
		return staff_email;
	}
	public void setStaff_email(String staff_email) {
		this.staff_email = staff_email;
	}
	public String getStaff_tel() {
		return staff_tel;
	}
	public void setStaff_tel(String staff_tel) {
		this.staff_tel = staff_tel;
	}
	public String getStaff_auth_cd() {
		return staff_auth_cd;
	}
	public void setStaff_auth_cd(String staff_auth_cd) {
		this.staff_auth_cd = staff_auth_cd;
	}
	public String getStaff_state() {
		return staff_state;
	}
	public void setStaff_state(String staff_state) {
		this.staff_state = staff_state;
	}
	public String getStaff_joinDate() {
		return staff_joinDate;
	}
	public void setStaff_joinDate(String staff_joinDate) {
		this.staff_joinDate = staff_joinDate;
	}
	
	
}
