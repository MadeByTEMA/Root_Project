package com.keep.root.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Course implements Serializable {

  private static final long serialVersionUID = 20200409L;

  int no;
  User user;
  Date createdDate;
  List<CourseDay> coursewDay;

  @Override
  public String toString() {
    return "Course [no=" + no + ", user=" + user + ", createdDate=" + createdDate + ", coursewDay=" + coursewDay + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public List<CourseDay> getCoursewDay() {
    return coursewDay;
  }

  public void setCoursewDay(List<CourseDay> coursewDay) {
    this.coursewDay = coursewDay;
  }

}
