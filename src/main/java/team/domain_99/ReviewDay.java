package team.domain_99;

import java.sql.Date;
import java.util.List;

public class ReviewDay {
  int no;
  String mainPhoto;
  String title;
  Date dayDate;
  String text;
  int status;
  Review review;
  List<ReviewPlace> reviewPlace;
}
