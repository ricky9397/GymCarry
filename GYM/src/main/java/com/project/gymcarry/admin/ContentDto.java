package com.project.gymcarry.admin;

public class ContentDto {

	private String title;
	private String content;
	private String date;
	private String category;
	
	// 기본 생성자
	public ContentDto() {}

	
	public ContentDto(String title, String content, String date, String category) {
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
	}

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
	@Override
	public String toString() {
		return "TermNoticeDto [title=" + title + ", content=" + content + ", date=" + date + ", category=" + category
				+ ", getTitle()=" + getTitle() + ", getContent()=" + getContent() + ", getDate()=" + getDate()
				+ ", getCategory()=" + getCategory() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
}
