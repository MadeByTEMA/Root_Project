package com.keep.root.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.keep.root.dao.ReviewDayDao;
import com.keep.root.dao.ReviewPlaceDao;
import com.keep.root.dao.ReviewPlacePhotoDao;
import com.keep.root.domain.Review;
import com.keep.root.domain.ReviewDay;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.domain.ReviewPlacePhoto;
import com.keep.root.service.ReviewDayService;

@Component
public class ReviewDayServiceImpl implements ReviewDayService {

  TransactionTemplate transactionTemplate;
  ReviewDayDao reviewDayDao;
  ReviewPlaceDao reviewPlaceDao;
  ReviewPlacePhotoDao reviewPlacePhotoDao;

  public ReviewDayServiceImpl( //
      PlatformTransactionManager txManager, //
      ReviewDayDao reviewDayDao, //
      ReviewPlaceDao reviewPlaceDao, //
      ReviewPlacePhotoDao reviewPlacePhotoDao //
  ) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.reviewDayDao = reviewDayDao;
    this.reviewPlaceDao = reviewPlaceDao;
    this.reviewPlacePhotoDao = reviewPlacePhotoDao;
  }

  @Transactional
  @Override
  public int add(ReviewDay reviewDay) throws Exception {
    int result = reviewDayDao.insert(reviewDay);
    if (result == 0) {
      throw new Exception("일정 추가에 실패했습니다.");
    } else {
      List<ReviewPlace> reviewPlaces = reviewDay.getReviewPlace();
      for (ReviewPlace reviewPlace : reviewPlaces) {
        reviewPlace.setDay(reviewDay);
        if (reviewPlaceDao.insert(reviewPlace) == 0) {
          throw new Exception("장소 추가에 실패했습니다.");
        } else {
          List<ReviewPlacePhoto> reviewPlacePhotos = reviewPlace.getReviewPlacePhotos();
          for (ReviewPlacePhoto reviewPlacePhoto : reviewPlacePhotos) {
            reviewPlacePhoto.setReviewPlace(reviewPlace);
            if (reviewPlacePhotoDao.insert(reviewPlacePhoto) == 0) {
              throw new Exception("장소사진 추가에 실패했습니다.");
            }
          }
        }
      }
    }
    return result;
  }

  @Transactional
  @Override
  public List<ReviewDay> list(int reviewNo) throws Exception {
    List<ReviewDay> reviewDays = reviewDayDao.findAllByReviewNo(reviewNo);
    for (ReviewDay reviewDay : reviewDays) {
      List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo());
      for (ReviewPlace reviewPlace : reviewPlaces) {
        reviewPlace
            .setReviewPlacePhotos(reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo()));
      }
      reviewDay.setReviewPlace(reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo()));
    }
    return reviewDays;
  }

  @Transactional
  @Override
  public ReviewDay get(int no) throws Exception {
    ReviewDay reviewDay = reviewDayDao.findByNo(no);
    List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo());
    for (ReviewPlace reviewPlace : reviewPlaces) {
      reviewPlace
          .setReviewPlacePhotos(reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo()));
    }
    return reviewDay;
  }

  @Transactional
  @Override
  public int update(ReviewDay reviewDay) throws Exception {
    return reviewDayDao.update(reviewDay);
  }

  @Transactional
  @Override
  public int delete(int no) throws Exception {
    List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(no);
    for (ReviewPlace reviewPlace : reviewPlaces) {
      List<ReviewPlacePhoto> reviewPlacePhotos =
          reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo());
      for (ReviewPlacePhoto reviewPlacePhoto : reviewPlacePhotos) {
        reviewPlacePhotoDao.delete(reviewPlacePhoto.getNo());
      }
      reviewPlaceDao.delete(reviewPlace.getNo());
    }
    return reviewDayDao.delete(no);
  }

  @Override
  public List<ReviewDay> search(String keyword) throws Exception {
    return reviewDayDao.findByKeyword(keyword);
  }
  
  @Override
  public ReviewDay searchDayGet(int no) throws Exception {
    return reviewDayDao.find(no);
  }

@Override
public List<ReviewDay> list() throws Exception {
	// TODO Auto-generated method stub
	return null;
}
}
