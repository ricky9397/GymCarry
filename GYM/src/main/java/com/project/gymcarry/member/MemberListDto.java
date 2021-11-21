package com.project.gymcarry.member;

public class MemberListDto {
	private int memidx;
	private String mememail;
	private String memnick;
	private String memname;
	private String memgender;
	private String memphone;
	private int membirth;
	
	// 기본 생성자 생성
	public MemberListDto() {}
	
	public MemberListDto(int memidx, String mememail, String memnick, String memname, String memgender, String memphone,
			int membirth) {
		super();
		this.memidx = memidx;
		this.mememail = mememail;
		this.memnick = memnick;
		this.memname = memname;
		this.memgender = memgender;
		this.memphone = memphone;
		this.membirth = membirth;
	}
	
	
	public int getMemidx() {
		return memidx;
	}
	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String mememail) {
		this.mememail = mememail;
	}
	public String getMemnick() {
		return memnick;
	}
	public void setMemnick(String memnick) {
		this.memnick = memnick;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemgender() {
		return memgender;
	}
	public void setMemgender(String memgender) {
		this.memgender = memgender;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public int getMembirth() {
		return membirth;
	}
	public void setMembirth(int membirth) {
		this.membirth = membirth;
	}

	
	@Override
	public String toString() {
		return "MemberListDto [memidx=" + memidx + ", mememail=" + mememail + ", memnick=" + memnick + ", memname="
				+ memname + ", memgender=" + memgender + ", memphone=" + memphone + ", membirth=" + membirth + "]";
	}
	
	
	
}
