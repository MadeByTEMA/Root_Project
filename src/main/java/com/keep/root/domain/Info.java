package com.keep.root.domain;

import java.sql.Date;

public class Info {
  int no;
  Date createdDate;
  int category;
  String title;
  String content;
  String photoFile;
  String mainPhoto;
  String placeName;
  Date startDate;
  Date endDate;
  String basicAddr;
  String detailAddr;
//List<InfoPhotoFile> infoPhotoFiles;
  
  
@Override
public String toString() {
	return "Info [no=" + no + ", createdDate=" + createdDate + ", category=" + category + ", title=" + title
			+ ", content=" + content + ", photoFile=" + photoFile + ", mainPhoto=" + mainPhoto + ", startDate="
			+ startDate + ", endDate=" + endDate + ", placeName=" + placeName + ", basicAddr=" + basicAddr
			+ ", detailAddr=" + detailAddr + "]";
}
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
public String getPhotoFile() {
	return photoFile;
}
public void setPhotoFile(String photoFile) {
	this.photoFile = photoFile;
}
public String getMainPhoto() {
	return mainPhoto;
}
public void setMainPhoto(String mainPhoto) {
	this.mainPhoto = mainPhoto;
}
public Date getStartDate() {
	return startDate;
}
public void setStartDate(Date startDate) {
	this.startDate = startDate;
}
public Date getEndDate() {
	return endDate;
}
public void setEndDate(Date endDate) {
	this.endDate = endDate;
}
public String getPlaceName() {
	return placeName;
}
public void setPlaceName(String placeName) {
	this.placeName = placeName;
}
public String getBasicAddr() {
	return basicAddr;
}
public void setBasicAddr(String basicAddr) {
	this.basicAddr = basicAddr;
}
public String getDetailAddr() {
	return detailAddr;
}
public void setDetailAddr(String detailAddr) {
	this.detailAddr = detailAddr;
}
  
  

 
}
