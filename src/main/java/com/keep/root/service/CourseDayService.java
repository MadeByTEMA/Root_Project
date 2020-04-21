package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.CourseDay;

public interface CourseDayService {

  int add(CourseDay courseDay) throws Exception;

  List<CourseDay> list(int courseNo) throws Exception;

  CourseDay get(int no) throws Exception;

  int update(CourseDay courseDay) throws Exception;

  int delete(int no) throws Exception;
}
