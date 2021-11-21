package com.project.gymcarry.chatting;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberMessageListDto {
	private int messageidx; 		//메세지번호
	private int chatidx;			//채팅방번호
	private String chatcontent;		//대화내용
	@JsonFormat(pattern = "h:mm a", timezone = "Asia/Seoul")
	private String chatdate;		//대화시간
	private int cridx;				//캐리번호
	private int memidx;				//회원번호
	private int contenttype;		//유저,캐리 대화내용 비교
	private int chatread;			//읽음 안읽음 여부
	private int likecheck;			//하트여부	
	private String outdate;		//나간시점
	public MemberMessageListDto() {
	}
	public MemberMessageListDto(int messageidx, int chatidx, String chatcontent, String chatdate, int cridx, int memidx,
			int contenttype, int chatread, int likecheck, String outdate) {
		super();
		this.messageidx = messageidx;
		this.chatidx = chatidx;
		this.chatcontent = chatcontent;
		this.chatdate = chatdate;
		this.cridx = cridx;
		this.memidx = memidx;
		this.contenttype = contenttype;
		this.chatread = chatread;
		this.likecheck = likecheck;
		this.outdate = outdate;
	}
	public int getMessageidx() {
		return messageidx;
	}
	public void setMessageidx(int messageidx) {
		this.messageidx = messageidx;
	}
	public int getChatidx() {
		return chatidx;
	}
	public void setChatidx(int chatidx) {
		this.chatidx = chatidx;
	}
	public String getChatcontent() {
		return chatcontent;
	}
	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}
	public String getChatdate() {
		return chatdate;
	}
	public void setChatdate(String chatdate) {
		this.chatdate = chatdate;
	}
	public int getCridx() {
		return cridx;
	}
	public void setCridx(int cridx) {
		this.cridx = cridx;
	}
	public int getMemidx() {
		return memidx;
	}
	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}
	public int getContenttype() {
		return contenttype;
	}
	public void setContenttype(int contenttype) {
		this.contenttype = contenttype;
	}
	public int getChatread() {
		return chatread;
	}
	public void setChatread(int chatread) {
		this.chatread = chatread;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	public String getOutdate() {
		return outdate;
	}
	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	@Override
	public String toString() {
		return "ChatRoomDto [messageidx=" + messageidx + ", chatidx=" + chatidx + ", chatcontent=" + chatcontent
				+ ", chatdate=" + chatdate + ", cridx=" + cridx + ", memidx=" + memidx + ", contenttype=" + contenttype
				+ ", chatread=" + chatread + ", likecheck=" + likecheck + ", outdate=" + outdate + "]";
	}
}
