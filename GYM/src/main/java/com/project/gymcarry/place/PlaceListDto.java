package com.project.gymcarry.place;

public class PlaceListDto {

	
	private int placeidx;
	private int placenum;
	private String placename;
	private String placeaddress;
	private String placephone;
	
	// 기본 생성자
	public PlaceListDto() {}
	
	public PlaceListDto(int placeidx, int placenum, String placename, String placeaddress, String placephone) {
		this.placeidx = placeidx;
		this.placenum = placenum;
		this.placename = placename;
		this.placeaddress = placeaddress;
		this.placephone = placephone;
	}
	
	
	
	public int getPlaceidx() {
		return placeidx;
	}
	public void setPlaceidx(int placeidx) {
		this.placeidx = placeidx;
	}
	public int getPlacenum() {
		return placenum;
	}
	public void setPlacenum(int placenum) {
		this.placenum = placenum;
	}
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	public String getPlaceaddress() {
		return placeaddress;
	}
	public void setPlaceaddress(String placeaddress) {
		this.placeaddress = placeaddress;
	}
	public String getPlacephone() {
		return placephone;
	}
	public void setPlacephone(String placephone) {
		this.placephone = placephone;
	}
	
	
	@Override
	public String toString() {
		return "PlaceListDto [placeidx=" + placeidx + ", placenum=" + placenum + ", placename=" + placename
				+ ", placeaddress=" + placeaddress + ", placephone=" + placephone + "]";
	}
	
	
	
	
}
