package com.project.gymcarry.mypage;

import org.springframework.web.multipart.MultipartFile;

import com.project.gymcarry.carry.CarryJoinDto;
import com.project.gymcarry.member.MemberJoinDto;

public class MypageMemberUpdateDto {

	private int memidx;
	private MultipartFile memphoto;
	private String memname;
	private String mememail;
	private String mempw;
	private String memnick;
	private String memphone;
	private String membirth;

	
	
	public MypageMemberUpdateDto(int memidx, MultipartFile memphoto, String memname, String mememail, String mempw,
			String memnick, String memphone, String membirth) {
		super();
		this.memidx = memidx;
		this.memphoto = memphoto;
		this.memname = memname;
		this.mememail = mememail;
		this.mempw = mempw;
		this.memnick = memnick;
		this.memphone = memphone;
		this.membirth = membirth;
	}

	public MypageMemberUpdateDto() {

	}
	
	public int getMemidx() {
		return memidx;
	}

	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}

	public MultipartFile getMemphoto() {
		return memphoto;
	}

	public void setMemphoto(MultipartFile memphoto) {
		this.memphoto = memphoto;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
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

	public String getMembirth() {
		return membirth;
	}

	public void setMembirth(String membirth) {
		this.membirth = membirth;
	}

	@Override
	public String toString() {
		return "MypageMemberUpdateDto [memidx=" + memidx + ", memphoto=" + memphoto + ", memname=" + memname
				+ ", mememail=" + mememail + ", mempw=" + mempw + ", memnick=" + memnick + ", memphone=" + memphone
				+ ", membirth=" + membirth + "]";
	}

	public MypageMemberDto getMemberJoinDto() {
		return new MypageMemberDto(memidx, memphoto.getOriginalFilename(), memname, mememail, mempw, memnick, memphone,
				membirth);
	}



}
