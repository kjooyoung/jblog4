package com.douzone.jblog.vo;

public class CategoryVo {
	private Long no;
	private String name;
	private String description;
	private String regDate;
	private Long userNo;
	private Integer totalPost=0;
	
	public CategoryVo() {}

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	
	public Integer getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(Integer totalPost) {
		this.totalPost = totalPost;
	}

	@Override
	public String toString() {
		return "CategoryVo [no=" + no + ", name=" + name + ", description=" + description + ", regDate=" + regDate
				+ ", userNo=" + userNo + "]";
	}
	
}
