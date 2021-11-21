package com.project.gymcarry.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.project.gymcarry.member.MemberVO;

public class CommPhotoVO {
	
	@Autowired
	MemberVO vo;
	
	private MultipartFile memPhoto; // 맴버 사진업로드
	private MultipartFile crPhoto;  // 캐리 사진업로드
	
	public MultipartFile getMemPhoto() {
		return memPhoto;
	}

	public void setMemPhoto(MultipartFile memPhoto) {
		this.memPhoto = memPhoto;
	}

	public MemberVO getMemberVO() {
		vo.setMemPhoto(memPhoto.getOriginalFilename());
		return vo;
	}
	
}
