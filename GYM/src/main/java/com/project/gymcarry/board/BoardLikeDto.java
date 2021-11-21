package com.project.gymcarry.board;

public class BoardLikeDto {

    private int idx;
    private int postidx;
    private int memidx;
    private int likecheck;
    
    public BoardLikeDto() {
	}
    
	public BoardLikeDto(int idx, int postidx, int memidx, int likecheck) {
		super();
		this.idx = idx;
		this.postidx = postidx;
		this.memidx = memidx;
		this.likecheck = likecheck;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getPostidx() {
		return postidx;
	}

	public void setPostidx(int postidx) {
		this.postidx = postidx;
	}

	public int getMemidx() {
		return memidx;
	}

	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}

	public int getLikecheck() {
		return likecheck;
	}

	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}

	@Override
	public String toString() {
		return "BoardLikeDto [idx=" + idx + ", postidx=" + postidx + ", memidx=" + memidx + ", likecheck=" + likecheck
				+ "]";
	}
    
    
    
    
}
