package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.keep.root.dao.CoursePlaceDao;
import com.keep.root.domain.CoursePlace;
import com.keep.root.service.CoursePlaceService;

@Component
public class CoursePlaceServiceImpl implements CoursePlaceService {

  CoursePlaceDao coursePlaceDao;

  public CoursePlaceServiceImpl(CoursePlaceDao coursePlaceDao) {
    this.coursePlaceDao = coursePlaceDao;
  }

  @Override
  public int add(CoursePlace coursePlace) throws Exception {
    return coursePlaceDao.insert(coursePlace);
  }

  @Override
  public List<CoursePlace> list(int courseDayNo) throws Exception {
    return coursePlaceDao.findAllByCourseDayNo(courseDayNo);
  }

  @Override
  public CoursePlace get(int no) throws Exception {
    return coursePlaceDao.findByNo(no);
  }

  @Override
  public int update(CoursePlace coursePlace) throws Exception {
    return coursePlaceDao.update(coursePlace);
  }

  @Override
  public int delete(int no) throws Exception {
    return coursePlaceDao.delete(no);
  }
}
