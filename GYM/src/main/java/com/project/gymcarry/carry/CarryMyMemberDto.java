package com.project.gymcarry.carry;

public class CarryMyMemberDto {
	
	private String memname;
	private String memnick;
	private int paycount;
	private int totalpay;
	private String date;
	
	// 기본 생성자
	public CarryMyMemberDto() {}

	public CarryMyMemberDto(String memname, String memnick, int paycount, int totalpay, String date) {
		super();
		this.memname = memname;
		this.memnick = memnick;
		this.paycount = paycount;
		this.totalpay = totalpay;
		this.date = date;
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

	public int getPaycount() {
		return paycount;
	}

	public void setPaycount(int paycount) {
		this.paycount = paycount;
	}

	public int getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(int totalpay) {
		this.totalpay = totalpay;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CarryMyMemberDto [memname=" + memname + ", memnick=" + memnick + ", paycount=" + paycount
				+ ", totalpay=" + totalpay + ", date=" + date + "]";
	}

	
}
