package com.keep.root.service;

import java.util.List;
import com.keep.root.domain.Review;

public interface ReviewService {

  int add(Review review) throws Exception;

  List<Review> list(int userNo) throws Exception;

  Review get(int no) throws Exception;

  int update(Review review) throws Exception;

  int delete(int no) throws Exception;
  
  //search
  List<Review> list() throws Exception;
  
  Review getByPlaceNo(int no) throws Exception;
}
