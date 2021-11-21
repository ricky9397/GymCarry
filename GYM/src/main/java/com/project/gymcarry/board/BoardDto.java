package com.project.gymcarry.board;


import java.util.Date;


public class BoardDto {

    private int postidx;
    private String postname;
    private String postcontent;
    private String postnick;
    private int memidx;
    private String postdate;
    private int postview;
    private String boardcategory;
    private int commentCnt;        //댓글 개수
    private int likeCnt;
    private String memphoto;


    public BoardDto() {

    }


	public BoardDto(int postidx, String postname, String postcontent, String postnick, int memidx, String postdate, int postview, String boardcategory, int commentCnt, int likeCnt, String memphoto) {
		this.postidx = postidx;
		this.postname = postname;
		this.postcontent = postcontent;
		this.postnick = postnick;
		this.memidx = memidx;
		this.postdate = postdate;
		this.postview = postview;
		this.boardcategory = boardcategory;
		this.commentCnt = commentCnt;
		this.likeCnt = likeCnt;
		this.memphoto = memphoto;
	}

	public int getPostidx() {
		return postidx;
	}

	public void setPostidx(int postidx) {
		this.postidx = postidx;
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

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	public int getPostview() {
		return postview;
	}

	public void setPostview(int postview) {
		this.postview = postview;
	}

	public String getBoardcategory() {
		return boardcategory;
	}

	public void setBoardcategory(String boardcategory) {
		this.boardcategory = boardcategory;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public String getMemphoto() {
		return memphoto;
	}

	public void setMemphoto(String memphoto) {
		this.memphoto = memphoto;
	}

	@Override
	public String toString() {
		return "BoardDto{" +
				"postidx=" + postidx +
				", postname='" + postname + '\'' +
				", postcontent='" + postcontent + '\'' +
				", postnick='" + postnick + '\'' +
				", memidx=" + memidx +
				", postdate='" + postdate + '\'' +
				", postview=" + postview +
				", boardcategory='" + boardcategory + '\'' +
				", commentCnt=" + commentCnt +
				", likeCnt=" + likeCnt +
				", memphoto='" + memphoto + '\'' +
				'}';
	}
}