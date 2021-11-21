package com.project.gymcarry.mypage;

public class MypageDto2 {

	private String infoidx;
	private String memidx;
	private String infocontent;
	private String infodate;
	private String infotype;

	public MypageDto2() {
	}

	public String getInfoidx() {
		return infoidx;
	}

	public void setInfoidx(String infoidx) {
		this.infoidx = infoidx;
	}

	public String getMemidx() {
		return memidx;
	}

	public void setMemidx(String memidx) {
		this.memidx = memidx;
	}

	public String getInfocontent() {
		return infocontent;
	}

	public void setInfocontent(String infocontent) {
		this.infocontent = infocontent;
	}

	public String getInfodate() {
		return infodate;
	}

	public void setInfodate(String infodate) {
		this.infodate = infodate;
	}

	public String getInfotype() {
		return infotype;
	}

	public void setInfotype(String infotype) {
		this.infotype = infotype;
	}

	@Override
	public String toString() {
		return "MypageDto [infoidx=" + infoidx + ", memidx=" + memidx + ", infocontent=" + infocontent + ", infodate="
				+ infodate + ", infotype=" + infotype + "]";
	}

	public MypageDto2(String infoidx, String memidx, String infocontent, String infodate, String infotype) {
		super();
		this.infoidx = infoidx;
		this.memidx = memidx;
		this.infocontent = infocontent;
		this.infodate = infodate;
		this.infotype = infotype;
	}

}
