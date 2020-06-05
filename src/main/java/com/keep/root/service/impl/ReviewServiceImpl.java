package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import com.keep.root.dao.ReviewDao;
import com.keep.root.dao.ReviewDayDao;
import com.keep.root.dao.ReviewPlaceDao;
import com.keep.root.dao.ReviewPlacePhotoDao;
import com.keep.root.domain.Review;
import com.keep.root.domain.ReviewDay;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.domain.ReviewPlacePhoto;
import com.keep.root.service.ReviewService;

@Component
public class ReviewServiceImpl implements ReviewService {

  TransactionTemplate transactionTemplate;
  ReviewDao reviewDao;
  ReviewDayDao reviewDayDao;
  ReviewPlaceDao reviewPlaceDao;
  ReviewPlacePhotoDao reviewPlacePhotoDao;

  public ReviewServiceImpl( //
      PlatformTransactionManager txManager, //
      ReviewDao reviewDao, //
      ReviewDayDao reviewDayDao, //
      ReviewPlaceDao reviewPlaceDao, //
      ReviewPlacePhotoDao reviewPlacePhotoDao //
      ) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.reviewDao = reviewDao;
    this.reviewDayDao = reviewDayDao;
    this.reviewPlaceDao = reviewPlaceDao;
    this.reviewPlacePhotoDao = reviewPlacePhotoDao;
  }

  @Transactional
  @Override
  public int add(Review review) throws Exception {
    int result = reviewDao.insert(review);
    if (result == 0) {
      throw new Exception("코스 추가에 실패했습니다.");
    } else {
      List<ReviewDay> reviewDays = review.getReviewDay();
      for (ReviewDay reviewDay : reviewDays) {
        reviewDay.setReview(review);
        if (reviewDayDao.insert(reviewDay) == 0) {
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
      }
    }
    return result;
  }

  @Transactional
  @Override
  public List<Review> list(int userNo) throws Exception {
    List<Review> reviews = reviewDao.findAllByUserNo(userNo);
    for (Review review : reviews) {
      List<ReviewDay> reviewDays = reviewDayDao.findAllByReviewNo(review.getNo());
      for (ReviewDay reviewDay : reviewDays) {
        List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo());
        for (ReviewPlace reviewPlace : reviewPlaces) {
          reviewPlace.setReviewPlacePhotos(
              reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo()));
        }
        reviewDay.setReviewPlace(reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo()));
      }
      review.setReviewDay(reviewDayDao.findAllByReviewNo(review.getNo()));
    }
    return reviews;
  }

  @Transactional
  @Override
  public Review get(int no) throws Exception {
    Review review = reviewDao.findByNo(no);
    List<ReviewDay> reviewDays = reviewDayDao.findAllByReviewNo(review.getNo());
    for (ReviewDay reviewDay : reviewDays) {
      List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo());
      for (ReviewPlace reviewPlace : reviewPlaces) {
        List<ReviewPlacePhoto> reviewPlacePhotos =
            reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo());
        for (ReviewPlacePhoto reviewPlacePhoto : reviewPlacePhotos) {
        }
        reviewPlace.setReviewPlacePhotos(reviewPlacePhotos);
      }
      reviewDay.setReviewPlace(reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo()));
    }
    review.setReviewDay(reviewDayDao.findAllByReviewNo(review.getNo()));
    return review;
  }

  @Transactional
  @Override
  public int update(Review review) throws Exception {
    int result = reviewDao.update(review);
    if (result == 0) {
      throw new Exception("후기 업데이트에 실패했습니다.");
    } else {
      List<ReviewDay> reviewDays = review.getReviewDay();
      for (ReviewDay reviewDay : reviewDays) {
        reviewDay.setReview(review);
        System.out.println(reviewDay.getTitle());
        if (reviewDay.getNo() == 0 && reviewDayDao.insert(reviewDay) == 0) {
          throw new Exception("일정 추가에 실패했습니다.");
        } else if (reviewDayDao.update(reviewDay) == 0) {
          throw new Exception("일정 업데이트에 실패했습니다.");
        } else {
          List<ReviewPlace> reviewPlaces = reviewDay.getReviewPlace();
          for (ReviewPlace reviewPlace : reviewPlaces) {
            System.out.println(reviewPlace.getName());
            reviewPlace.setDay(reviewDay);
            if (reviewPlace.getNo() == 0 && reviewPlaceDao.insert(reviewPlace) == 0) {
              throw new Exception("장소 추가에 실패했습니다.");
            } else if (reviewPlaceDao.update(reviewPlace) == 0) {
              throw new Exception("장소 업데이트에 실패했습니다.");
            }
          }
        }
      }
    }
    return result;
  }

  @Transactional
  @Override
  public int delete(int no) throws Exception {
    List<ReviewDay> reviewDays = reviewDayDao.findAllByReviewNo(no);
    for (ReviewDay reviewDay : reviewDays) {
      List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(reviewDay.getNo());
      for (ReviewPlace reviewPlace : reviewPlaces) {
        List<ReviewPlacePhoto> reviewPlacePhotos =
            reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo());
        for (ReviewPlacePhoto reviewPlacePhoto : reviewPlacePhotos) {
          reviewPlacePhotoDao.delete(reviewPlacePhoto.getNo());
        }
        reviewPlaceDao.delete(reviewPlace.getNo());
      }
      reviewDayDao.delete(reviewDay.getNo());
    }
    return reviewDao.delete(no);
  }

  @Override
  public List<Review> list() throws Exception {
    return null;
  }

  @Override
  public Review getByPlaceNo(int no) throws Exception {
    return reviewDao.find(no);
  }


}
