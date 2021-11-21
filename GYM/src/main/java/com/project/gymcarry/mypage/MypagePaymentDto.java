package com.project.gymcarry.mypage;

public class MypagePaymentDto {

	private String crname;
	private int paynum;
	private String paydate;
	private int payprice;

	@Override
	public String toString() {
		return "MypagePaymentDto [crname=" + crname + ", paynum=" + paynum + ", paydate=" + paydate + ", payprice="
				+ payprice + "]";
	}

	public String getCrname() {
		return crname;
	}

	public void setCrname(String crname) {
		this.crname = crname;
	}

	public int getPaynum() {
		return paynum;
	}

	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}

	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}

	public int getPayprice() {
		return payprice;
	}

	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}

	public MypagePaymentDto() {

	}

}
