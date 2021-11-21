package com.project.gymcarry.carry;

import org.springframework.web.multipart.MultipartFile;

public class CarryToJoinDto {
	private int cridx;
	private String cremail;
	private String crpw;
	private String crname;
	private String crnick;
	private String crgender;
	private String crphone;
	private MultipartFile crphoto;
	private String joinkey;
	private String joinkey_status;

	public CarryToJoinDto() {
	}



	public CarryToJoinDto(int cridx, String cremail, String crpw, String crname, String crnick, String crgender,
						  String crphone, MultipartFile crphoto, String joinkey, String joinkey_status) {
		super();
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

	public MultipartFile getCrphoto() {
		return crphoto;
	}

	public void setCrphoto(MultipartFile crphoto) {
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

	public CarryJoinDto getCarryJoinDto() {
		return new CarryJoinDto(cridx, cremail, crpw, crname, crnick, crgender, crphone, crphoto.getOriginalFilename(), joinkey, joinkey_status);
	}



	@Override
	public String toString() {
		return "CarryToJoinDto [cridx=" + cridx + ", cremail=" + cremail + ", crpw=" + crpw + ", crname=" + crname
				+ ", crnick=" + crnick + ", crgender=" + crgender + ", crphone=" + crphone + ", crphoto=" + crphoto
				+ ", joinkey=" + joinkey + ", joinkey_status=" + joinkey_status + "]";
	}




}