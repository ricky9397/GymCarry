package com.project.gymcarry.carry;

public class CarryJoinDto {

	private int cridx;
	private String cremail;
	private String crpw;
	private String crname;
	private String crnick;
	private String crgender;
	private String crphone;
	private String crphoto;
	private String joinkey;
	private String joinkey_status;
	private String crintro;
	private String crbfphoto;
	private String crplace;
	private String crfield;
	private String crdepart;
	private int placeidx;

	public CarryJoinDto() {
	}

	// 캐리정보 전체출력
	public CarryJoinDto(int cridx, String cremail, String crpw, String crname, String crnick, String crgender, String crphone, String crphoto, String joinkey, String joinkey_status, String crintro, String crbfphoto, String crplace, String crfield, String crdepart, int placeidx) {
		this.cridx = cridx;
		this.cremail = cremail;
		this.crpw = crpw;
		this.crname = crname;
		this.crnick = crnick;
		this.crgender = crgender;
		this.crphone = crphone;
		this.crphoto = crphoto;
		this.joinkey = joinkey;
		this.joinkey_status = joinkey_status;
		this.crintro = crintro;
		this.crbfphoto = crbfphoto;
		this.crplace = crplace;
		this.crfield = crfield;
		this.crdepart = crdepart;
		this.placeidx = placeidx;
	}

	// 파일업로드용
	public CarryJoinDto(int cridx, String cremail, String crpw, String crname, String crnick, String crgender, String crphone, String crphoto, String joinkey, String joinkey_status) {
		this.cridx = cridx;
		this.cremail = cremail;
		this.crpw = crpw;
		this.crname = crname;
		this.crnick = crnick;
		this.crgender = crgender;
		this.crphone = crphone;
		this.crphoto = crphoto;
		this.joinkey = joinkey;
		this.joinkey_status = joinkey_status;
	}

	public int getCridx() {
		return cridx;
	}

	public void setCridx(int cridx) {
		this.cridx = cridx;
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

	public String getCrphoto() {
		return crphoto;
	}

	public void setCrphoto(String crphoto) {
		this.crphoto = crphoto;
	}

	public String getJoinkey() {
		return joinkey;
	}

	public void setJoinkey(String joinkey) {
		this.joinkey = joinkey;
	}

	public String getJoinkey_status() {
		return joinkey_status;
	}

	public void setJoinkey_status(String joinkey_status) {
		this.joinkey_status = joinkey_status;
	}

	public String getCrintro() {
		return crintro;
	}

	public void setCrintro(String crintro) {
		this.crintro = crintro;
	}

	public String getCrbfphoto() {
		return crbfphoto;
	}

	public void setCrbfphoto(String crbfphoto) {
		this.crbfphoto = crbfphoto;
	}

	public String getCrplace() {
		return crplace;
	}

	public void setCrplace(String crplace) {
		this.crplace = crplace;
	}

	public String getCrfield() {
		return crfield;
	}

	public void setCrfield(String crfield) {
		this.crfield = crfield;
	}

	public String getCrdepart() {
		return crdepart;
	}

	public void setCrdepart(String crdepart) {
		this.crdepart = crdepart;
	}

	public int getPlaceidx() {
		return placeidx;
	}

	public void setPlaceidx(int placeidx) {
		this.placeidx = placeidx;
	}

	@Override
	public String toString() {
		return "CarryJoinDto{" +
				"cridx=" + cridx +
				", cremail='" + cremail + '\'' +
				", crpw='" + crpw + '\'' +
				", crname='" + crname + '\'' +
				", crnick='" + crnick + '\'' +
				", crgender='" + crgender + '\'' +
				", crphone='" + crphone + '\'' +
				", crphoto='" + crphoto + '\'' +
				", joinkey='" + joinkey + '\'' +
				", joinkey_status='" + joinkey_status + '\'' +
				", crintro='" + crintro + '\'' +
				", crbfphoto='" + crbfphoto + '\'' +
				", crplace='" + crplace + '\'' +
				", crfield='" + crfield + '\'' +
				", crdepart='" + crdepart + '\'' +
				", placeidx=" + placeidx +
				'}';
	}
}