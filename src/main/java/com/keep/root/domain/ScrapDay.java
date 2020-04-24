package com.keep.root.domain;

public class ScrapDay {
  User user;
  ReviewDay reviewDay;
  
  @Override
  public String toString() {
    return "ScrapDay [user=" + user + ", reviewDay=" + reviewDay + "]";
  }
  
  public User getUser() {
    return user;
  }
  public void setUser(User user) {
    this.user = user;
  }
  public ReviewDay getReviewDay() {
    return reviewDay;
  }
  public void setReviewDay(ReviewDay reviewDay) {
    this.reviewDay = reviewDay;
  }
  
}
