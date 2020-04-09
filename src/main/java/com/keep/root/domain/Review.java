package com.keep.root.domain;

import java.sql.Date;
import java.util.List;

public class Review {
  int no;
  User user;
  Date createdDate;
  int status;
  List<ReviewDay> reviewDay;
}
