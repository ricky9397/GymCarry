package com.project.gymcarry.payment;

public class PaymentDto {

	private int payidx;
//	@JsonFormat(pattern = "HH:mm a")
	private String paydate;
	private int memidx;
	private String payname;
	private String payphone;
	private int cridx;
	private int paynum;
	private int payprice;
	
	public PaymentDto() {}

	public PaymentDto(int payidx, String paydate, int memidx, String payname, String payphone, int cridx, int paynum,
			int payprice) {
		this.payidx = payidx;
		this.paydate = paydate;
		this.memidx = memidx;
		this.payname = payname;
		this.payphone = payphone;
		this.cridx = cridx;
		this.paynum = paynum;
		this.payprice = payprice;
	}

	public int getPayidx() {
		return payidx;
	}

	public void setPayidx(int payidx) {
		this.payidx = payidx;
	}

	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}

	public int getMemidx() {
		return memidx;
	}

	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}

	public String getPayname() {
		return payname;
	}

	public void setPayname(String payname) {
		this.payname = payname;
	}

	public String getPayphone() {
		return payphone;
	}

	public void setPayphone(String payphone) {
		this.payphone = payphone;
	}

	public int getCridx() {
		return cridx;
	}

	public void setCridx(int cridx) {
		this.cridx = cridx;
	}

	public int getPaynum() {
		return paynum;
	}

	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}

	public int getPayprice() {
		return payprice;
	}

	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}

	@Override 
	public String toString() {
		return "PaymentDto [payidx=" + payidx + ", paydate=" + paydate + ", memidx=" + memidx + ", payname=" + payname
				+ ", payphone=" + payphone + ", cridx=" + cridx + ", paynum=" + paynum + ", payprice=" + payprice + "]";
	}

	
}
