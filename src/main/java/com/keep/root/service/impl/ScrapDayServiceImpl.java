package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.keep.root.dao.ReviewPlaceDao;
import com.keep.root.dao.ReviewPlacePhotoDao;
import com.keep.root.dao.ScrapDayDao;
import com.keep.root.domain.ReviewDay;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.domain.ScrapDay;
import com.keep.root.service.ScrapDayService;

@Component
public class ScrapDayServiceImpl implements ScrapDayService {

  TransactionTemplate transactionTemplate;
  ScrapDayDao scrapDayDao;
  ReviewPlaceDao reviewPlaceDao;
  ReviewPlacePhotoDao reviewPlacePhotoDao;

  public ScrapDayServiceImpl( //
      PlatformTransactionManager txManager, //
      ScrapDayDao scrapDayDao, //
      ReviewPlaceDao reviewPlaceDao, //
      ReviewPlacePhotoDao reviewPlacePhotoDao //
  ) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.scrapDayDao = scrapDayDao;
    this.reviewPlaceDao = reviewPlaceDao;
    this.reviewPlacePhotoDao = reviewPlacePhotoDao;
  }

  @Override
  public int add(ScrapDay scrapDay) throws Exception {
    return scrapDayDao.insert(scrapDay);
  }

  @Override
  public List<ScrapDay> list(int userNo) throws Exception {
    List<ScrapDay> scraps = scrapDayDao.findAll(userNo);
    for (ScrapDay scrapday : scraps) {
      ReviewDay reviewDay = scrapday.getReviewDay();
      List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo());
      for (ReviewPlace reviewPlace : reviewPlaces) {
        reviewPlace.setReviewPlacePhotos(reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo()));
      }
      reviewDay.setReviewPlace(reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo()));
      scrapday.setReviewDay(reviewDay);
    }
    return scraps;
  }

  @Override
  public ScrapDay get(int reviewDayNo) throws Exception {
    return scrapDayDao.findDayNo(reviewDayNo);
  }

  @Override
  public int delete(int reviewDayNo) throws Exception {
    return scrapDayDao.delete(reviewDayNo);
  }

}
