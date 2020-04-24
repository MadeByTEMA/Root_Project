package com.keep.root.domain;

import java.sql.Date;

public class Info {
  int no;
  Date createdDate;
  int category;
  String title;
  String content;
  String mainPhoto;
  InfoPlace infoPlace;
  
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public Date getCreatedDate() {
	return createdDate;
}
public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
}
public int getCategory() {
	return category;
}
public void setCategory(int category) {
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
public String getMainPhoto() {
	return mainPhoto;
}
public void setMainPhoto(String mainPhoto) {
	this.mainPhoto = mainPhoto;
}
public InfoPlace getInfoPlace() {
	return infoPlace;
}
public void setInfoPlace(InfoPlace infoPlace) {
	this.infoPlace = infoPlace;
}
@Override
public String toString() {
	return "Info [no=" + no + ", createdDate=" + createdDate + ", category=" + category + ", title=" + title
			+ ", content=" + content + ", mainPhoto=" + mainPhoto + ", infoPlace=" + infoPlace + "]";
}
  
  
}
