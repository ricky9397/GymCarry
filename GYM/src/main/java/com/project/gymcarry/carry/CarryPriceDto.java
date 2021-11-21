package com.project.gymcarry.carry;

public class CarryPriceDto {
	
	private int cridx;
	private int procount;
	private int proprice;
	
	
	// 기본 생성자
	public CarryPriceDto() {}


	public CarryPriceDto(int cridx, int procount, int proprice) {
		super();
		this.cridx = cridx;
		this.procount = procount;
		this.proprice = proprice;
	}


	public int getCridx() {
		return cridx;
	}


	public void setCridx(int cridx) {
		this.cridx = cridx;
	}


	public int getProcount() {
		return procount;
	}


	public void setProcount(int procount) {
		this.procount = procount;
	}


	public int getProprice() {
		return proprice;
	}


	public void setProprice(int proprice) {
		this.proprice = proprice;
	}


	@Override
	public String toString() {
		return "CarryPriceDto [cridx=" + cridx + ", procount=" + procount + ", proprice=" + proprice + "]";
	}

	
}
