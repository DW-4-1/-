package kr.or.dw.vo;

public class LectureVO {
	private String lec_code;	//강의코드
	private String lec_name;	//강의명
	private String lec_pro;		//교수명
	private String lec_loc;		//강의실
	private String lec_time;	//강의시간
	private String lec_div;		//구분(전공필수, 전공선택, 교양)
	private int lec_credit;		//학점
	private String stu_grade;	//성적(A,B,C,D,F)
	private int stu_year;		//수강년도
	private String stu_term;	//수강학기
	
	public String getLec_grade() {
		return stu_grade;
	}
	public void setLec_grade(String lec_grade) {
		this.stu_grade = lec_grade;
	}
	public int getStu_year() {
		return stu_year;
	}
	public void setStu_year(int stu_year) {
		this.stu_year = stu_year;
	}
	public String getStu_term() {
		return stu_term;
	}
	public void setStu_term(String stu_term) {
		this.stu_term = stu_term;
	}
	public String getLec_code() {
		return lec_code;
	}
	public void setLec_code(String lec_code) {
		this.lec_code = lec_code;
	}
	public String getLec_name() {
		return lec_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public String getLec_pro() {
		return lec_pro;
	}
	public void setLec_pro(String lec_pro) {
		this.lec_pro = lec_pro;
	}
	public String getLec_loc() {
		return lec_loc;
	}
	public void setLec_loc(String lec_loc) {
		this.lec_loc = lec_loc;
	}
	public String getLec_time() {
		return lec_time;
	}
	public void setLec_time(String lec_time) {
		this.lec_time = lec_time;
	}
	public String getLec_div() {
		return lec_div;
	}
	public void setLec_div(String lec_div) {
		this.lec_div = lec_div;
	}
	public int getLec_credit() {
		return lec_credit;
	}
	public void setLec_credit(int lec_credit) {
		this.lec_credit = lec_credit;
	}
	
	
}
