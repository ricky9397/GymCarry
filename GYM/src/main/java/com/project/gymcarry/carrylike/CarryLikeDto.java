package com.project.gymcarry.carrylike;

public class CarryLikeDto {
	private int likeidx;
	private int memidx;
	private int cridx;
	private int likecheck;
	public CarryLikeDto() {
	}
	public CarryLikeDto(int likeidx, int memidx, int cridx, int likecheck) {
		super();
		this.likeidx = likeidx;
		this.memidx = memidx;
		this.cridx = cridx;
		this.likecheck = likecheck;
	}
	public int getLikeidx() {
		return likeidx;
	}
	public void setLikeidx(int likeidx) {
		this.likeidx = likeidx;
	}
	public int getMemidx() {
		return memidx;
	}
	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}
	public int getCridx() {
		return cridx;
	}
	public void setCridx(int cridx) {
		this.cridx = cridx;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	
}
