package com.project.gymcarry.mypage;

import org.springframework.web.multipart.MultipartFile;

public class MypagePhotoDto {

	private String infoidx;
	private String memidx;
	private MultipartFile infocontent;
	private String infodate;
	private String infotype;

	public MypagePhotoDto() {
	}

	@Override
	public String toString() {
		return "MypagePhotoDto [infoidx=" + infoidx + ", memidx=" + memidx + ", infocontent=" + infocontent
				+ ", infodate=" + infodate + ", infotype=" + infotype + "]";
	}

	public String getInfoidx() {
		return infoidx;
	}

	public void setInfoidx(String infoidx) {
		this.infoidx = infoidx;
	}

	public String getMemidx() {
		return memidx;
	}

	public void setMemidx(String memidx) {
		this.memidx = memidx;
	}

	public MultipartFile getInfocontent() {
		return infocontent;
	}

	public void setInfocontent(MultipartFile infocontent) {
		this.infocontent = infocontent;
	}

	public String getInfodate() {
		return infodate;
	}

	public void setInfodate(String infodate) {
		this.infodate = infodate;
	}

	public String getInfotype() {
		return infotype;
	}

	public void setInfotype(String infotype) {
		this.infotype = infotype;
	}

	public MypageDto2 getMypageDto2() {
		return new MypageDto2(infoidx, memidx, infocontent.getOriginalFilename(), infodate, infotype);
	}

}
