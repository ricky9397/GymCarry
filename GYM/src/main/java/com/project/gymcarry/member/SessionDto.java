package com.project.gymcarry.member;

public class SessionDto {
	private int memidx;
	private String memname;
	private String memnick;
	private int cridx;
	private String crname;
	private String crnick;
	public SessionDto() {
	}
	public SessionDto(int memidx, String memname, String memnick, int cridx, String crname, String crnick) {
		super();
		this.memidx = memidx;
		this.memname = memname;
		this.memnick = memnick;
		this.cridx = cridx;
		this.crname = crname;
		this.crnick = crnick;
	}
	public int getMemidx() {
		return memidx;
	}
	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemnick() {
		return memnick;
	}
	public void setMemnick(String memnick) {
		this.memnick = memnick;
	}
	public int getCridx() {
		return cridx;
	}
	public void setCridx(int cridx) {
		this.cridx = cridx;
	}
	public String getCrname() {
		return crname;
	}
	public void setCrname(String crname) {
		this.crname = crname;
	}
	public String getCrnick() {
		return crnick;
	}
	public void setCrnick(String crnick) {
		this.crnick = crnick;
	}
	
}