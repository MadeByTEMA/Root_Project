package com.keep.root.domain;

public class ReviewPlacePhoto {
  int no;
  ReviewPlace reviewPlace;
  String photo;

  public ReviewPlacePhoto() {
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public ReviewPlace getReviewPlace() {
    return reviewPlace;
  }

  public void setReviewPlace(ReviewPlace reviewPlace) {
    this.reviewPlace = reviewPlace;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  @Override
  public String toString() {
    return "ReviewPlacePhoto [no=" + no + ", reviewPlace=" + reviewPlace + ", photo=" + photo + "]";
  }

}
