package com.project.gymcarry.chatting;

public class ChatListDto {
	
	private int chatidx;
	private int cridx;
	private int memidx;
	private String crnick;
	private String memnick;
	private String placename;
	private String chatdate;
	private String chatcontent;
	private int chatread;
	private int messageidx;
	private int outcount;
	private String outdate;
	private String memphoto;
	private String crphoto;
	public ChatListDto() {
	}
	public ChatListDto(int chatidx, int cridx, int memidx, String crnick, String memnick, String placename,
			String chatdate, String chatcontent, int chatread, int messageidx, int outcount, String outdate,
			String memphoto, String crphoto) {
		super();
		this.chatidx = chatidx;
		this.cridx = cridx;
		this.memidx = memidx;
		this.crnick = crnick;
		this.memnick = memnick;
		this.placename = placename;
		this.chatdate = chatdate;
		this.chatcontent = chatcontent;
		this.chatread = chatread;
		this.messageidx = messageidx;
		this.outcount = outcount;
		this.outdate = outdate;
		this.memphoto = memphoto;
		this.crphoto = crphoto;
	}
	public int getChatidx() {
		return chatidx;
	}
	public void setChatidx(int chatidx) {
		this.chatidx = chatidx;
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
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	public String getChatdate() {
		return chatdate;
	}
	public void setChatdate(String chatdate) {
		this.chatdate = chatdate;
	}
	public String getChatcontent() {
		return chatcontent;
	}
	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}
	public int getChatread() {
		return chatread;
	}
	public void setChatread(int chatread) {
		this.chatread = chatread;
	}
	public int getMessageidx() {
		return messageidx;
	}
	public void setMessageidx(int messageidx) {
		this.messageidx = messageidx;
	}
	public int getOutcount() {
		return outcount;
	}
	public void setOutcount(int outcount) {
		this.outcount = outcount;
	}
	public String getOutdate() {
		return outdate;
	}
	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	public String getMemphoto() {
		return memphoto;
	}
	public void setMemphoto(String memphoto) {
		this.memphoto = memphoto;
	}
	public String getCrphoto() {
		return crphoto;
	}
	public void setCrphoto(String crphoto) {
		this.crphoto = crphoto;
	}
	
	
}
