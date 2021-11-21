package com.project.gymcarry.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberJoinDto {
	private String mememail;
	private String mempw;
	private String memname;
	private String memnick;
	private String memphone;
	private int membirth;
	private String memgender;
	private MultipartFile memphoto;
	private String joinkey;
	private String joinkey_status;
	private String snsjoinid;
	public MemberJoinDto() {
	}
	public MemberJoinDto(String mememail, String mempw, String memname, String memnick, String memphone, int membirth,
			String memgender, MultipartFile memphoto, String joinkey, String joinkey_status, String snsjoinid) {
		super();
		this.mememail = mememail;
		this.mempw = mempw;
		this.memname = memname;
		this.memnick = memnick;
		this.memphone = memphone;
		this.membirth = membirth;
		this.memgender = memgender;
		this.memphoto = memphoto;
		this.joinkey = joinkey;
		this.joinkey_status = joinkey_status;
		this.snsjoinid = snsjoinid;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String mememail) {
		this.mememail = mememail;
	}
	public String getMempw() {
		return mempw;
	}
	public void setMempw(String mempw) {
		this.mempw = mempw;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemnick() {
		return memnick;
	}
	public void setMemnick(String memnick) {
		this.memnick = memnick;
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
	public String getMemgender() {
		return memgender;
	}
	public void setMemgender(String memgender) {
		this.memgender = memgender;
	}
	public MultipartFile getMemphoto() {
		return memphoto;
	}
	public void setMemphoto(MultipartFile memphoto) {
		this.memphoto = memphoto;
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
	public String getSnsjoinid() {
		return snsjoinid;
	}
	public void setSnsjoinid(String snsjoinid) {
		this.snsjoinid = snsjoinid;
	}
	public MemberDto getMemberDto() {
		return new MemberDto(0, mememail, mempw, memname, memnick, memphone, membirth, memgender, memphoto.getOriginalFilename(), joinkey, joinkey_status, snsjoinid);
	}
}
