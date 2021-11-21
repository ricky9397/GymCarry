package com.project.gymcarry.member;

public class MemberVO {
	
	private String memEmail;		// 이메일(아이디)
	private String memPw;			// 패스워드
	private String memName;			// 이름
	private String memNick;			// 닉네임
	private String memPhone;		// 폰번호
	private int memBirth;			// 생일
	private String memGender;		// 성별
	private String memPhoto; // 프로필사진
	
	public MemberVO() {}
	
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public int getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(int memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemPhoto() {
		return memPhoto;
	}
	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}
}
