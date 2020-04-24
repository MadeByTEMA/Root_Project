package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.keep.root.dao.ReviewPlaceDao;
import com.keep.root.dao.ReviewPlacePhotoDao;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.service.ReviewPlaceService;

@Component
public class ReviewPlaceServiceImpl implements ReviewPlaceService {

  TransactionTemplate transactionTemplate;
  ReviewPlaceDao reviewPlaceDao;
  ReviewPlacePhotoDao reviewPlacePhotoDao;

  public ReviewPlaceServiceImpl( //
      PlatformTransactionManager txManager, //
      ReviewPlaceDao reviewPlaceDao, //
      ReviewPlacePhotoDao reviewPlacePhotoDao //
  ) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.reviewPlaceDao = reviewPlaceDao;
    this.reviewPlacePhotoDao = reviewPlacePhotoDao;
  }

  @Override
  public int add(ReviewPlace reviewPlace) throws Exception {
    return reviewPlaceDao.insert(reviewPlace);
  }

  @Override
  public List<ReviewPlace> list(int reviewDayNo) throws Exception {
    return reviewPlaceDao.findAllByReviewDayNo(reviewDayNo);
  }

  @Override
  public ReviewPlace get(int no) throws Exception {
    return reviewPlaceDao.findByNo(no);
  }

  @Override
  public int update(ReviewPlace reviewPlace) throws Exception {
    return reviewPlaceDao.update(reviewPlace);
  }

  @Override
  public int delete(int no) throws Exception {
    return reviewPlaceDao.delete(no);
  }
}
