package com.douzone.jblog.vo;

public class CommentVo {
	private Long no;
	private String content;
	private String regDate;
	private String postNo;
	private Long userNo;
	private String id;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "CommentVo [no=" + no + ", content=" + content + ", regDate=" + regDate + ", postNo=" + postNo
				+ ", userNo=" + userNo + "]";
	}
	
}
