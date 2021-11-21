package com.project.gymcarry.carry;

public class CarryReviewIndexDto {
	
	private int reviewidx;
	private String reviewcontent;
	private int cridx;
	private String crbfphoto;
	private String crname;
	// 기본 생성자
	public CarryReviewIndexDto() {}
	public CarryReviewIndexDto(int reviewidx, String reviewcontent, int cridx, String crbfphoto, String crname) {
		super();
		this.reviewidx = reviewidx;
		this.reviewcontent = reviewcontent;
		this.cridx = cridx;
		this.crbfphoto = crbfphoto;
		this.crname = crname;
	}
	public int getReviewidx() {
		return reviewidx;
	}
	public void setReviewidx(int reviewidx) {
		this.reviewidx = reviewidx;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	public int getCridx() {
		return cridx;
	}
	public void setCridx(int cridx) {
		this.cridx = cridx;
	}
	public String getCrbfphoto() {
		return crbfphoto;
	}
	public void setCrbfphoto(String crbfphoto) {
		this.crbfphoto = crbfphoto;
	}
	public String getCrname() {
		return crname;
	}
	public void setCrname(String crname) {
		this.crname = crname;
	}
	@Override
	public String toString() {
		return "CarryReviewIndexDto [reviewidx=" + reviewidx + ", reviewcontent=" + reviewcontent + ", cridx=" + cridx
				+ ", crbfphoto=" + crbfphoto + ", crname=" + crname + "]";
	}

	
	
	
	
	
}
