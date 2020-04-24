package com.keep.root.domain;

import java.sql.Date;
import java.util.List;

public class ReviewDay {
  int no;
  String mainPhoto;
  String title;
  Date dayDate;
  String mainReview;
  int status;
  Review review;
  List<ReviewPlace> reviewPlace;
  
  @Override
  public String toString() {
    return "ReviewDay [no=" + no + ", mainPhoto=" + mainPhoto + ", title=" + title + ", dayDate="
        + dayDate + ", mainReview=" + mainReview + ", status=" + status + ", review=" + review
        + ", reviewPlace=" + reviewPlace + "]";
  }
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getMainPhoto() {
    return mainPhoto;
  }
  public void setMainPhoto(String mainPhoto) {
    this.mainPhoto = mainPhoto;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public Date getDayDate() {
    return dayDate;
  }
  public void setDayDate(Date dayDate) {
    this.dayDate = dayDate;
  }
  public String getMainReview() {
    return mainReview;
  }
  public void setMainReview(String mainReview) {
    this.mainReview = mainReview;
  }
  public int getStatus() {
    return status;
  }
  public void setStatus(int status) {
    this.status = status;
  }
  public Review getReview() {
    return review;
  }
  public void setReview(Review review) {
    this.review = review;
  }
  public List<ReviewPlace> getReviewPlace() {
    return reviewPlace;
  }
  public void setReviewPlace(List<ReviewPlace> reviewPlace) {
    this.reviewPlace = reviewPlace;
  }
  
}
