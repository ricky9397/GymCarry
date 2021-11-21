package com.project.gymcarry.chatting;

public class MessageDto {
	private int chatidx;
	private String chatcontent;
	private int cridx;
	private int memidx;
	private int contenttype;
	private String crnick;
	private String memnick;
	private String chatdate;
	private int chatread;
	private String chatNick;
	private String to;
	public MessageDto() {}
	public MessageDto(int chatidx, String chatcontent, int cridx, int memidx, int contenttype, String crnick,
			String memnick, String chatdate, int chatread, String chatNick, String to) {
		super();
		this.chatidx = chatidx;
		this.chatcontent = chatcontent;
		this.cridx = cridx;
		this.memidx = memidx;
		this.contenttype = contenttype;
		this.crnick = crnick;
		this.memnick = memnick;
		this.chatdate = chatdate;
		this.chatread = chatread;
		this.chatNick = chatNick;
		this.to = to;
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
	public String getCrnick() {
		return crnick;
	}
	public void setCrnick(String crnick) {
		this.crnick = crnick;
	}
	public String getMemnick() {
		return memnick;
	}
	public void setMemnick(String memnick) {
		this.memnick = memnick;
	}
	public String getChatdate() {
		return chatdate;
	}
	public void setChatdate(String chatdate) {
		this.chatdate = chatdate;
	}
	public int getChatread() {
		return chatread;
	}
	public void setChatread(int chatread) {
		this.chatread = chatread;
	}
	public String getChatNick() {
		return chatNick;
	}
	public void setChatNick(String chatNick) {
		this.chatNick = chatNick;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	@Override
	public String toString() {
		return "MessageDto [chatidx=" + chatidx + ", chatcontent=" + chatcontent + ", cridx=" + cridx + ", memidx="
				+ memidx + ", contenttype=" + contenttype + ", crnick=" + crnick + ", memnick=" + memnick
				+ ", chatdate=" + chatdate + ", chatread=" + chatread + ", chatNick=" + chatNick + ", to=" + to + "]";
	}
	
	
}
