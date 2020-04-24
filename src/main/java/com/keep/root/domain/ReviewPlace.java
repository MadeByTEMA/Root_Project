package com.keep.root.domain;

import java.util.List;

public class ReviewPlace {
  int no;
  String name;
  String basicAddr;
  String detailAddr;
  String placeReview;
  String mainPhoto;
  int status;
  ReviewDay day;
  List<ReviewPlacePhoto> reviewPlacePhotos;
  
  @Override
  public String toString() {
    return "ReviewPlace [no=" + no + ", name=" + name + ", basicAddr=" + basicAddr + ", detailAddr="
        + detailAddr + ", placeReview=" + placeReview + ", mainPhoto=" + mainPhoto + ", status="
        + status + ", day=" + day + ", reviewPlacePhotos=" + reviewPlacePhotos + "]";
  }
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
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
  public String getPlaceReview() {
    return placeReview;
  }
  public void setPlaceReview(String placeReview) {
    this.placeReview = placeReview;
  }
  public String getMainPhoto() {
    return mainPhoto;
  }
  public void setMainPhoto(String mainPhoto) {
    this.mainPhoto = mainPhoto;
  }
  public int getStatus() {
    return status;
  }
  public void setStatus(int status) {
    this.status = status;
  }
  public ReviewDay getDay() {
    return day;
  }
  public void setDay(ReviewDay day) {
    this.day = day;
  }
  public List<ReviewPlacePhoto> getReviewPlacePhotos() {
    return reviewPlacePhotos;
  }
  public void setReviewPlacePhotos(List<ReviewPlacePhoto> reviewPlacePhotos) {
    this.reviewPlacePhotos = reviewPlacePhotos;
  }
  
  
}
