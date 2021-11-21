package com.project.gymcarry.admin;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DashTableAddDto {
	private String payname;
	private String payphone;
	private int paynum;
	private String crname;
	@JsonFormat(pattern = "YYYY-HH-dd")
	private Timestamp paydate;
	private int payprice;
	private int month;
	private int day;
	private long total;
	private String engmonth;
	private long year;
	public DashTableAddDto() {}
	public DashTableAddDto(String payname, String payphone, int paynum, String crname, Timestamp paydate, int payprice,
			int month, int day, long total, String engmonth, long year) {
		this.payname = payname;
		this.payphone = payphone;
		this.paynum = paynum;
		this.crname = crname;
		this.paydate = paydate;
		this.payprice = payprice;
		this.month = month;
		this.day = day;
		this.total = total;
		this.engmonth = engmonth;
		this.year = year;
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
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public String getEngmonth() {
		return engmonth;
	}
	public void setEngmonth(String engmonth) {
		this.engmonth = engmonth;
	}
	public long getYear() {
		return year;
	}
	public void setYear(long year) {
		this.year = year;
	}
	
	
}
