package com.project.gymcarry.admin;

public class AllSalesDto {
	private long year;
	private int month;
	private int day;
	private String crname;
	private long total;
	private String engmonth;
	private int paynum;
	private String crfield;
	private String crgender;
	public AllSalesDto() {
	}
	public AllSalesDto(long year, int month, int day, String crname, long total, String engmonth, int paynum,
			String crfield, String crgender) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.crname = crname;
		this.total = total;
		this.engmonth = engmonth;
		this.paynum = paynum;
		this.crfield = crfield;
		this.crgender = crgender;
	}
	public long getYear() {
		return year;
	}
	public void setYear(long year) {
		this.year = year;
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
	public String getCrname() {
		return crname;
	}
	public void setCrname(String crname) {
		this.crname = crname;
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
	public int getPaynum() {
		return paynum;
	}
	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}
	public String getCrfield() {
		return crfield;
	}
	public void setCrfield(String crfield) {
		this.crfield = crfield;
	}
	public String getCrgender() {
		return crgender;
	}
	public void setCrgender(String crgender) {
		this.crgender = crgender;
	}
	
	
}
