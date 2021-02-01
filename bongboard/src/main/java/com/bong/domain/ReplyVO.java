package com.bong.domain;

import java.util.Date;

public class ReplyVO {

/*
 CREATE TABLE tbl_reply (
	rno INT NOT NULL AUTO_INCREMENT,
	bno INT NOT NULL DEFAULT 0,
	replyWriter VARCHAR(30) NOT NULL,
	replyContent TEXT NOT NULL,
	replyRegDate TIMESTAMP NOT NULL DEFAULT NOW(),
	PRIMARY KEY(rno, bno),
	FOREIGN KEY(bno) REFERENCES tbl_board(bno)
)
 */
	
	private int rno;
	private int bno;
	private String replyWriter;
	private String replyContent;
	private Date replyRegDate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}

}
