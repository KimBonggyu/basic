package com.bong.domain;

public class Page {
	
	// 게시글 총 갯수
	private int count;
	
	//현재 페이지 번호
	private int num;

	// 페이지 한개당 출력될 게시글 갯수
	private int postNum = 10;

	// 페이지 하단에 표시될 페이징번호
	private int pageNum;

	// 출력할 게시글
	private int displayPost;

	// 화면에 표출할 페이징 번호 갯수
	private int pageNumCnt = 10;

	// 화면 마지막 페이징 번호
	private int endPageNum;

	// 화면 첫번째 페이징 번호
	private int startPageNum;

	private boolean prev;
	private boolean next;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		
		dateCalc();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}
	public int getPageNumCnt() {
		return pageNumCnt;
	}
	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void dateCalc() {
		
		// 화면 마지막 페이징 번호
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		
		// 화면 시작 페이징 번호
		startPageNum = endPageNum - (pageNumCnt - 1);
		
		//화면 마지막 페이징 번호 계산_2
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNumCnt >= count ? false : true;
		
		displayPost = (num - 1) * postNum;
	}

}
