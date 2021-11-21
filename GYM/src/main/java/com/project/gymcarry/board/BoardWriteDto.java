package com.project.gymcarry.board;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class BoardWriteDto {

    private String postname;
    private String postcontent;
    private String postnick;
    private int memidx;
    private String boardcategory;
    
    public BoardWriteDto() {
	}
    
	public BoardWriteDto(String postname, String postcontent, String postnick, int memidx, String boardcategory) {
		super();
		this.postname = postname;
		this.postcontent = postcontent;
		this.postnick = postnick;
		this.memidx = memidx;
		this.boardcategory = boardcategory;
	}

	public String getPostname() {
		return postname;
	}

	public void setPostname(String postname) {
		this.postname = postname;
	}

	public String getPostcontent() {
		return postcontent;
	}

	public void setPostcontent(String postcontent) {
		this.postcontent = postcontent;
	}

	public String getPostnick() {
		return postnick;
	}

	public void setPostnick(String postnick) {
		this.postnick = postnick;
	}

	public int getMemidx() {
		return memidx;
	}

	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}

	public String getBoardcategory() {
		return boardcategory;
	}

	public void setBoardcategory(String boardcategory) {
		this.boardcategory = boardcategory;
	}

	@Override
	public String toString() {
		return "BoardWriteDto [postname=" + postname + ", postcontent=" + postcontent + ", postnick=" + postnick
				+ ", memidx=" + memidx + ", boardcategory=" + boardcategory + "]";
	}
    
    
}
