package com.project.gymcarry.carry;

import org.springframework.web.multipart.MultipartFile;

public class CarryDto {

	private int cridx;
	private String joinkey_status;
	private String joinkey;
	private String crphoto;
	private String crbfphoto;
	private String cremail;
	private String crpw;
	private String crname;
	private String crnick;
	private String crgender;
	private String crphone;
	private String crintro;
	private String crdepart;
	private String crfield;
	private int faceornot;
	private int placeidx;
	private String crplace;
	private String crcerti1;
	private String crcerti2;
	private String crcerti3;
	private String crcerti4;
	private String crcerti5;



	// 기본 생성자
	public CarryDto() {}


	public CarryDto(int cridx, String joinkey_status, String joinkey, String crphoto, String crbfphoto, String cremail, String crpw, String crname, String crnick, String crgender, String crphone, String crintro, String crdepart, String crfield, int faceornot, int placeidx, String crplace, String crcerti1, String crcerti2, String crcerti3, String crcerti4, String crcerti5) {
		this.cridx = cridx;
		this.joinkey_status = joinkey_status;
		this.joinkey = joinkey;
		this.crphoto = crphoto;
		this.crbfphoto = crbfphoto;
		this.cremail = cremail;
		this.crpw = crpw;
		this.crname = crname;
		this.crnick = crnick;
		this.crgender = crgender;
		this.crphone = crphone;
		this.crintro = crintro;
		this.crdepart = crdepart;
		this.crfield = crfield;
		this.faceornot = faceornot;
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

	public String getCrphoto() {
		return crphoto;
	}

	public void setCrphoto(String crphoto) {
		this.crphoto = crphoto;
	}

	public String getCrbfphoto() {
		return crbfphoto;
	}

	public void String(String crbfphoto) {
		this.crbfphoto = crbfphoto;
	}

	public String getCremail() {
		return cremail;
	}

	public void setCremail(String cremail) {
		this.cremail = cremail;
	}

	public String getCrpw() {
		return crpw;
	}

	public void setCrpw(String crpw) {
		this.crpw = crpw;
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

	public String getCrphone() {
		return crphone;
	}

	public void setCrphone(String crphone) {
		this.crphone = crphone;
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

	public int getFaceornot() {
		return faceornot;
	}

	public void setFaceornot(int faceornot) {
		this.faceornot = faceornot;
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
		return "CarryDto{" +
				"cridx=" + cridx +
				", joinkey_status='" + joinkey_status + '\'' +
				", joinkey='" + joinkey + '\'' +
				", crphoto=" + crphoto +
				", crbfphoto=" + crbfphoto +
				", cremail='" + cremail + '\'' +
				", crpw='" + crpw + '\'' +
				", crname='" + crname + '\'' +
				", crnick='" + crnick + '\'' +
				", crgender='" + crgender + '\'' +
				", crphone='" + crphone + '\'' +
				", crintro='" + crintro + '\'' +
				", crdepart='" + crdepart + '\'' +
				", crfield='" + crfield + '\'' +
				", faceornot=" + faceornot +
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
