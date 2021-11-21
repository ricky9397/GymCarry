package com.project.gymcarry.carry;

public class CarryListDto {

	private int cridx;
	private String crnick;
	private int placeidx;
	private String placename;
	private int proprice;
	private String crcerti1;
	private String crcerti2;
	private String crcerti3;
	private String crcerti4;
	private String crcerti5;
	private String crbfphoto;
	
	
	// 기본 생성자
	public CarryListDto() {}


	public CarryListDto(int cridx, String crnick, int placeidx, String placename, int proprice, String crcerti1,
			String crcerti2, String crcerti3, String crcerti4, String crcerti5, String crbfphoto) {
		super();
		this.cridx = cridx;
		this.crnick = crnick;
		this.placeidx = placeidx;
		this.placename = placename;
		this.proprice = proprice;
		this.crcerti1 = crcerti1;
		this.crcerti2 = crcerti2;
		this.crcerti3 = crcerti3;
		this.crcerti4 = crcerti4;
		this.crcerti5 = crcerti5;
		this.crbfphoto = crbfphoto;
	}


	public int getCridx() {
		return cridx;
	}


	public void setCridx(int cridx) {
		this.cridx = cridx;
	}


	public String getCrnick() {
		return crnick;
	}


	public void setCrnick(String crnick) {
		this.crnick = crnick;
	}


	public int getPlaceidx() {
		return placeidx;
	}


	public void setPlaceidx(int placeidx) {
		this.placeidx = placeidx;
	}


	public String getPlacename() {
		return placename;
	}


	public void setPlacename(String placename) {
		this.placename = placename;
	}


	public int getProprice() {
		return proprice;
	}


	public void setProprice(int proprice) {
		this.proprice = proprice;
	}


	public String getCrcerti1() {
		return crcerti1;
	}


	public void setCrcerti1(String crcerti1) {
		this.crcerti1 = crcerti1;
	}


	public String getCrcerti2() {
		return crcerti2;
	}


	public void setCrcerti2(String crcerti2) {
		this.crcerti2 = crcerti2;
	}


	public String getCrcerti3() {
		return crcerti3;
	}


	public void setCrcerti3(String crcerti3) {
		this.crcerti3 = crcerti3;
	}


	public String getCrcerti4() {
		return crcerti4;
	}


	public void setCrcerti4(String crcerti4) {
		this.crcerti4 = crcerti4;
	}


	public String getCrcerti5() {
		return crcerti5;
	}


	public void setCrcerti5(String crcerti5) {
		this.crcerti5 = crcerti5;
	}


	public String getCrbfphoto() {
		return crbfphoto;
	}


	public void setCrbfphoto(String crbfphoto) {
		this.crbfphoto = crbfphoto;
	}


	@Override
	public String toString() {
		return "CarryListDto [cridx=" + cridx + ", crnick=" + crnick + ", placeidx=" + placeidx + ", placename="
				+ placename + ", proprice=" + proprice + ", crcerti1=" + crcerti1 + ", crcerti2=" + crcerti2
				+ ", crcerti3=" + crcerti3 + ", crcerti4=" + crcerti4 + ", crcerti5=" + crcerti5 + ", crbfphoto="
				+ crbfphoto + "]";
	}

	
	
}
