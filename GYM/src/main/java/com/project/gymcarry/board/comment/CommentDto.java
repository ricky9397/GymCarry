package com.project.gymcarry.board.comment;


import java.util.Date;


public class CommentDto {

    private int commentidx;
    private int postidx;
    private String commentnick;
    private String commentcontent;
    private String commentdate;
    private String memphoto;
    
    
	public CommentDto() {

	}

	public CommentDto(int commentidx, int postidx, String commentnick, String commentcontent, String commentdate, String memphoto) {
		this.commentidx = commentidx;
		this.postidx = postidx;
		this.commentnick = commentnick;
		this.commentcontent = commentcontent;
		this.commentdate = commentdate;
		this.memphoto = memphoto;
	}

	public int getCommentidx() {
		return commentidx;
	}

	public void setCommentidx(int commentidx) {
		this.commentidx = commentidx;
	}

	public int getPostidx() {
		return postidx;
	}

	public void setPostidx(int postidx) {
		this.postidx = postidx;
	}

	public String getCommentnick() {
		return commentnick;
	}

	public void setCommentnick(String commentnick) {
		this.commentnick = commentnick;
	}

	public String getCommentcontent() {
		return commentcontent;
	}

	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}

	public String getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(String commentdate) {
		this.commentdate = commentdate;
	}

	public String getMemphoto() {
		return memphoto;
	}

	public void setMemphoto(String memphoto) {
		this.memphoto = memphoto;
	}

	@Override
	public String toString() {
		return "CommentDto{" +
				"commentidx=" + commentidx +
				", postidx=" + postidx +
				", commentnick='" + commentnick + '\'' +
				", commentcontent='" + commentcontent + '\'' +
				", commentdate='" + commentdate + '\'' +
				", memphoto='" + memphoto + '\'' +
				'}';
	}
}