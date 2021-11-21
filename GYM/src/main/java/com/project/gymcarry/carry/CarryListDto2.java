package com.project.gymcarry.carry;

public class CarryListDto2 {

	private int cridx;
	private String cremail;
	private String crnick;
	private String crname;
	private String crgender;
	private String crphone;
	private String placename;
	
	
	// 기본 생성자
	public CarryListDto2() {}


	public CarryListDto2(int cridx, String cremail, String crnick, String crname, String crgender, String crphone,
			String placename) {
		super();
		this.cridx = cridx;
		this.cremail = cremail;
		this.crnick = crnick;
		this.crname = crname;
		this.crgender = crgender;
		this.crphone = crphone;
		this.placename = placename;
	}


	public int getCridx() {
		return cridx;
	}


	public void setCridx(int cridx) {
		this.cridx = cridx;
	}


	public String getCremail() {
		return cremail;
	}


	public void setCremail(String cremail) {
		this.cremail = cremail;
	}


	public String getCrnick() {
		return crnick;
	}


	public void setCrnick(String crnick) {
		this.crnick = crnick;
	}


	public String getCrname() {
		return crname;
	}


	public void setCrname(String crname) {
		this.crname = crname;
	}


	public String getCrgender() {
		return crgender;
	}


	public void setCrgender(String crgender) {
		this.crgender = crgender;
	}


	public String getCrphone() {
		return crphone;
	}


	public void setCrphone(String crphone) {
		this.crphone = crphone;
	}


	public String getPlacename() {
		return placename;
	}


	public void setPlacename(String placename) {
		this.placename = placename;
	}


	@Override
	public String toString() {
		return "CarryListDto2 [cridx=" + cridx + ", cremail=" + cremail + ", crnick=" + crnick + ", crname=" + crname
				+ ", crgender=" + crgender + ", crphone=" + crphone + ", placename=" + placename + "]";
	}


	
}
