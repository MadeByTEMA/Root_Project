package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import com.keep.root.dao.CourseDao;
import com.keep.root.dao.CourseDayDao;
import com.keep.root.domain.Course;
import com.keep.root.domain.CourseDay;
import com.keep.root.service.CourseService;

@Component
public class CourseServiceImpl implements CourseService {

  TransactionTemplate transactionTemplate;
  CourseDao courseDao;
  CourseDayDao courseDayDao;

  public CourseServiceImpl(PlatformTransactionManager txManager, CourseDao courseDao, CourseDayDao courseDayDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.courseDao = courseDao;
    this.courseDayDao = courseDayDao;
  }

  @Transactional
  @Override
  public int add(Course course) throws Exception {
    int result = courseDao.insert(course);
    if (result == 0) {
      throw new Exception("코스 추가에 실패했습니다.");
    } else {
      List<CourseDay> courseDays = course.getCourseDay();
      for (CourseDay courseDay : courseDays) {
        courseDayDao.insert(courseDay);
      }
    }
    return result;
  }

  @Override
  public List<Course> list(int userNo) throws Exception {
    List<Course> courses = courseDao.findAllByUserNo(userNo);
    for (Course course : courses) {
      course.setCourseDay(courseDayDao.findAllByCourseNo(course.getNo()));
    }
    return courses;
  }

  @Override
  public Course get(int no) throws Exception {
    return courseDao.findByNo(no);
  }

  @Transactional
  @Override
  public int update(Course course) throws Exception {
    return courseDao.update(course);
  }

  @Transactional
  @Override
  public int delete(int no) throws Exception {
    List<CourseDay> courseDays = courseDayDao.findAllByCourseNo(no);
    for (CourseDay courseDay : courseDays) {
      courseDayDao.delete(courseDay.getNo());
    }
    return courseDao.delete(no);
  }
}
