package com.project.gymcarry.admin;

public class AdminSessionDto {

	private int adminidx;
	private String adminid;
	private String adminpw;
	
	// 기본 생성자
	public AdminSessionDto() {}
	
	public AdminSessionDto(int adminidx, String adminid, String adminpw) {
		this.adminidx = adminidx;
		this.adminid = adminid;
		this.adminpw = adminpw;
	}

	
	
	public int getAdminidx() {
		return adminidx;
	}

	public void setAdminidx(int adminidx) {
		this.adminidx = adminidx;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpw() {
		return adminpw;
	}

	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}

	
	@Override
	public String toString() {
		return "AdminSessionDto [adminidx=" + adminidx + ", adminid=" + adminid + ", adminpw=" + adminpw + "]";
	}
	
	

}
