package kr.or.dw.vo;

public class StudentVO {
	private String stu_id;		//학번, 아이디
	private String stu_name;	//이름
	private String stu_gender;	//성별
	private String stu_resnum;	//주민번호
	private String stu_addr;	//주소		변경가능
	private int stu_zipcode;	//우편번호	변경가능
	private int stu_deptcode;	//학과코드
	private String stu_deptname;//학과명
	private String stu_pwd;		//비밀번호	변경가능	
	private String stu_tel;		//전화번호	변경가능
	private String stu_email;	//이메일		변경가능
	private String stu_state;	//현재 상태 (재학, 휴학, 졸업)
	private String stu_joinDate;	//가입일
	
	
	public String getStu_state() {
		return stu_state;
	}
	public void setStu_state(String stu_state) {
		this.stu_state = stu_state;
	}
	public String getStu_joinDate() {
		return stu_joinDate;
	}
	public void setStu_joinDate(String stu_joinDate) {
		this.stu_joinDate = stu_joinDate;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_gender() {
		return stu_gender;
	}
	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
	}
	public String getStu_resnum() {
		return stu_resnum;
	}
	public void setStu_resnum(String stu_resnum) {
		this.stu_resnum = stu_resnum;
	}
	public String getStu_addr() {
		return stu_addr;
	}
	public void setStu_addr(String stu_addr) {
		this.stu_addr = stu_addr;
	}
	public int getStu_zipcode() {
		return stu_zipcode;
	}
	public void setStu_zipcode(int stu_zipcode) {
		this.stu_zipcode = stu_zipcode;
	}
	public int getStu_deptcode() {
		return stu_deptcode;
	}
	public void setStu_deptcode(int stu_deptcode) {
		this.stu_deptcode = stu_deptcode;
	}
	public String getStu_deptname() {
		return stu_deptname;
	}
	public void setStu_deptname(String stu_deptname) {
		this.stu_deptname = stu_deptname;
	}
	public String getStu_pwd() {
		return stu_pwd;
	}
	public void setStu_pwd(String stu_pwd) {
		this.stu_pwd = stu_pwd;
	}
	public String getStu_tel() {
		return stu_tel;
	}
	public void setStu_tel(String stu_tel) {
		this.stu_tel = stu_tel;
	}
	public String getStu_email() {
		return stu_email;
	}
	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}
	
	
}
