package kr.or.dw.vo;

import java.util.Date;

public class BoardVO {
private int bd_no;
private String bd_title;
private String staff_id;
private String bd_content;
private Date bd_wdt;
private int bd_hit;
private String gb_del;
private int att_no;
private String att_nm;
public int getBd_no() {
	return bd_no;
}
public void setBd_no(int bd_no) {
	this.bd_no = bd_no;
}
public String getBd_title() {
	return bd_title;
}
public void setBd_title(String bd_title) {
	this.bd_title = bd_title;
}
public String getStaff_id() {
	return staff_id;
}
public void setStaff_id(String staff_id) {
	this.staff_id = staff_id;
}
public String getBd_content() {
	return bd_content;
}
public void setBd_content(String bd_content) {
	this.bd_content = bd_content;
}
public Date getBd_wdt() {
	return bd_wdt;
}
public void setBd_wdt(Date bd_wdt) {
	this.bd_wdt = bd_wdt;
}
public int getBd_hit() {
	return bd_hit;
}
public void setBd_hit(int bd_hit) {
	this.bd_hit = bd_hit;
}
public String getGb_del() {
	return gb_del;
}
public void setGb_del(String gb_del) {
	this.gb_del = gb_del;
}
public int getAtt_no() {
	return att_no;
}
public void setAtt_no(int att_no) {
	this.att_no = att_no;
}
public String getAtt_nm() {
	return att_nm;
}
public void setAtt_nm(String att_nm) {
	this.att_nm = att_nm;
}



}
