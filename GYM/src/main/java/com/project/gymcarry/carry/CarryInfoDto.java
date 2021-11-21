package com.project.gymcarry.carry;


public class CarryInfoDto {
	private int cridx;
	private String joinkey_status;
	private String joinkey;
	private String crbfphoto;
	private String cremail;
	private String crname;
	private String crnick;
	private String crgender;
	private String crintro;
	private String crdepart;
	private String crfield;
	private int placeidx;
	private String crplace;
	private String crcerti1;
	private String crcerti2;
	private String crcerti3;
	private String crcerti4;
	private String crcerti5;

	// 기본 생성자
	public CarryInfoDto() {}

	public CarryInfoDto(int cridx, String joinkey_status, String joinkey, String crbfphoto, String cremail, String crname,
						String crnick, String crgender, String crintro, String crdepart, String crfield, int placeidx, String crplace,
						String crcerti1, String crcerti2, String crcerti3, String crcerti4, String crcerti5) {
		this.cridx = cridx;
		this.joinkey_status = joinkey_status;
		this.joinkey = joinkey;
		this.crbfphoto = crbfphoto;
		this.cremail = cremail;
		this.crname = crname;
		this.crnick = crnick;
		this.crgender = crgender;
		this.crintro = crintro;
		this.crdepart = crdepart;
		this.crfield = crfield;
		this.placeidx = placeidx;
		this.crplace = crplace;
		this.crcerti1 = crcerti1;
		this.crcerti2 = crcerti2;
		this.crcerti3 = crcerti3;
		this.crcerti4 = crcerti4;
		this.crcerti5 = crcerti5;
	}

	public int getCridx() {
		return cridx;
	}

	public void setCridx(int cridx) {
		this.cridx = cridx;
	}

	public String getJoinkey_status() {
		return joinkey_status;
	}

	public void setJoinkey_status(String joinkey_status) {
		this.joinkey_status = joinkey_status;
	}

	public String getJoinkey() {
		return joinkey;
	}

	public void setJoinkey(String joinkey) {
		this.joinkey = joinkey;
	}

	public String getCrbfphoto() {
		return crbfphoto;
	}

	public void setCrbfphoto(String crbfphoto) {
		this.crbfphoto = crbfphoto;
	}

	public String getCremail() {
		return cremail;
	}

	public void setCremail(String cremail) {
		this.cremail = cremail;
	}

	public String getCrname() {
		return crname;
	}

	public void setCrname(String crname) {
		this.crname = crname;
	}

	public String getCrnick() {
		return crnick;
	}

	public void setCrnick(String crnick) {
		this.crnick = crnick;
	}

	public String getCrgender() {
		return crgender;
	}

	public void setCrgender(String crgender) {
		this.crgender = crgender;
	}

	public String getCrintro() {
		return crintro;
	}

	public void setCrintro(String crintro) {
		this.crintro = crintro;
	}

	public String getCrdepart() {
		return crdepart;
	}

	public void setCrdepart(String crdepart) {
		this.crdepart = crdepart;
	}

	public String getCrfield() {
		return crfield;
	}

	public void setCrfield(String crfield) {
		this.crfield = crfield;
	}

	public int getPlaceidx() {
		return placeidx;
	}

	public void setPlaceidx(int placeidx) {
		this.placeidx = placeidx;
	}

	public String getCrplace() {
		return crplace;
	}

	public void setCrplace(String crplace) {
		this.crplace = crplace;
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

	@Override
	public String toString() {
		return "CarryInfoDto{" +
				"cridx=" + cridx +
				", joinkey_status='" + joinkey_status + '\'' +
				", joinkey='" + joinkey + '\'' +
				", crbfphoto='" + crbfphoto + '\'' +
				", cremail='" + cremail + '\'' +
				", crname='" + crname + '\'' +
				", crnick='" + crnick + '\'' +
				", crgender='" + crgender + '\'' +
				", crintro='" + crintro + '\'' +
				", crdepart='" + crdepart + '\'' +
				", crfield='" + crfield + '\'' +
				", placeidx=" + placeidx +
				", crplace='" + crplace + '\'' +
				", crcerti1='" + crcerti1 + '\'' +
				", crcerti2='" + crcerti2 + '\'' +
				", crcerti3='" + crcerti3 + '\'' +
				", crcerti4='" + crcerti4 + '\'' +
				", crcerti5='" + crcerti5 + '\'' +
				'}';
	}
}

