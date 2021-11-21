package com.project.gymcarry.admin;

import java.sql.Timestamp;

public class DashTableDto {
	private String payname;
	private String payphone;
	private int paynum;
	private String crname;
	private Timestamp paydate;
	private int payprice;
	public DashTableDto() {
	}
	public DashTableDto(String payname, String payphone, int paynum, String crname, Timestamp paydate, int payprice) {
		this.payname = payname;
		this.payphone = payphone;
		this.paynum = paynum;
		this.crname = crname;
		this.paydate = paydate;
		this.payprice = payprice;
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
	public int getPaynum() {
		return paynum;
	}
	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}
	public String getCrname() {
		return crname;
	}
	public void setCrname(String crname) {
		this.crname = crname;
	}
	public Timestamp getPaydate() {
		return paydate;
	}
	public void setPaydate(Timestamp paydate) {
		this.paydate = paydate;
	}
	public int getPayprice() {
		return payprice;
	}
	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}
	
}
