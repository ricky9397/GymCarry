package com.project.gymcarry.chatting;

public class ChatAlarmDto {
	private String chatNick;
	private String to;
	private String alarm;
	public ChatAlarmDto(String chatNick, String to, String alarm) {
		this.chatNick = chatNick;
		this.to = to;
		this.alarm = alarm;
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
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	@Override
	public String toString() {
		return "ChatAlarmDto [chatNick=" + chatNick + ", to=" + to + ", alarm=" + alarm + "]";
	}
	
}
