package com.tour.category.model;

import java.util.Date;

public class Category {
	private int id;
	private String categoryName;
	private String categoryAttr;
	private Date createdAt;
	private Date updatedAt;
	
	// getters and setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryAttr() {
		return categoryAttr;
	}
	public void setCategoryAttr(String categoryAttr) {
		this.categoryAttr = categoryAttr;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
