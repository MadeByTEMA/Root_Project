package com.keep.root.domain;

import java.sql.Date;
import java.util.List;

public class Scrap {
  int no;
  User user;
  Date createdDate;
  int status;
  List<ScrapDay> scrapDay;
}
