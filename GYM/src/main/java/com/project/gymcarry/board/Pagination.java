package com.project.gymcarry.board;

public class Pagination {

	private int listSize = 5; // 초기값으로 목록개수를 5으로 셋팅
	private int rangeSize = 5; // 초기값으로 페이지범위를 5으로 셋팅
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int memidx;

	public int getMemidx() {
		return memidx;
	}

	public void setMemidx(int memidx) {
		this.memidx = memidx;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getStartList() {
		return startList;
	}

	// 현재페이지정보, 현재페이지범위, 게시물 총 개수
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		// 전체 페이지수
		this.pageCnt = (int)Math.ceil(listCnt/(double)listSize);

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		this.endPage = range * rangeSize;

		// 게시판 시작번호
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
	
	// 현재페이지정보, 현재페이지범위, 게시물 총 개수
	public void pageInfo2(int page, int range, int listCnt, int memidx) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		this.memidx = memidx;

		// 전체 페이지수
		this.pageCnt = (int) Math.ceil(listCnt / listSize);

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		this.endPage = range * rangeSize;

		// 게시판 시작번호
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}
