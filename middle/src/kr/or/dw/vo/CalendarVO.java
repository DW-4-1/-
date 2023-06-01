package kr.or.dw.vo;

public class CalendarVO {
	private int cal_no;
	private String title;
	private String start;
	private String end;
    private boolean allday;
	public int getCal_no() {
		return cal_no;
	}
	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public boolean isAllday() {
		return allday;
	}
	public void setAllday(boolean allday) {
		this.allday = allday;
	}
    
    
}
