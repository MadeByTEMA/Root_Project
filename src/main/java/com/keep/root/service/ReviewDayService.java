package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.ReviewDay;

public interface ReviewDayService {

  int add(ReviewDay reviewDay) throws Exception;

  List<ReviewDay> list(int reviewNo) throws Exception;

  ReviewDay get(int no) throws Exception;

  int update(ReviewDay reviewDay) throws Exception;

  int delete(int no) throws Exception;
}
