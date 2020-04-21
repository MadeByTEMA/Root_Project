package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import com.keep.root.dao.CourseDayDao;
import com.keep.root.dao.CoursePlaceDao;
import com.keep.root.domain.CourseDay;
import com.keep.root.domain.CoursePlace;
import com.keep.root.service.CourseDayService;

@Component
public class CourseDayServiceImpl implements CourseDayService {

  TransactionTemplate transactionTemplate;
  CourseDayDao courseDayDao;
  CoursePlaceDao coursePlaceDao;

  public CourseDayServiceImpl(PlatformTransactionManager txManager, CourseDayDao courseDayDao,
      CoursePlaceDao coursePlaceDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.courseDayDao = courseDayDao;
    this.coursePlaceDao = coursePlaceDao;
  }

  @Transactional
  @Override
  public int add(CourseDay courseDay) throws Exception {
    int result = courseDayDao.insert(courseDay);
    if (result == 0) {
      throw new Exception("일정 추가에 실패했습니다.");
    } else {
      List<CoursePlace> coursePlaces = courseDay.getCoursePlace();
      for (CoursePlace coursePlace : coursePlaces) {
        if (coursePlaceDao.insert(coursePlace) == 0) {
          throw new Exception("장소 추가에 실패했습니다.");
        }
      }
    }
    return result;
  }

  @Override
  public List<CourseDay> list(int courseNo) throws Exception {
    List<CourseDay> courseDays = courseDayDao.findAllByCourseNo(courseNo);
    for (CourseDay courseDay : courseDays) {
      courseDay.setCoursePlace(coursePlaceDao.findAllByCourseDayNo(courseDay.getNo()));
    }
    return courseDays;
  }

  @Override
  public CourseDay get(int no) throws Exception {
    return courseDayDao.findByNo(no);
  }

  @Transactional
  @Override
  public int update(CourseDay courseDay) throws Exception {
    return courseDayDao.update(courseDay);
  }

  @Transactional
  @Override
  public int delete(int no) throws Exception {
    List<CoursePlace> coursePlaces = coursePlaceDao.findAllByCourseDayNo(no);
    for (CoursePlace coursePlace : coursePlaces) {
      coursePlaceDao.delete(coursePlace.getNo());
    }
    return courseDayDao.delete(no);
  }
}
