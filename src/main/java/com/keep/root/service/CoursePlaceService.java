package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.CoursePlace;

public interface CoursePlaceService {

  int add(CoursePlace coursePlace) throws Exception;

  List<CoursePlace> list(int courseDayNo) throws Exception;

  CoursePlace get(int no) throws Exception;

  int update(CoursePlace coursePlace) throws Exception;

  int delete(int no) throws Exception;
}
