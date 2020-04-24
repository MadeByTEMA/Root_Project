package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.ReviewPlace;

public interface ReviewPlaceService {

  int add(ReviewPlace reviewPlace) throws Exception;

  List<ReviewPlace> list(int reviewDayNo) throws Exception;

  ReviewPlace get(int no) throws Exception;

  int update(ReviewPlace reviewPlace) throws Exception;

  int delete(int no) throws Exception;
}
