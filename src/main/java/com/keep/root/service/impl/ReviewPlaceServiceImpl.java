package com.keep.root.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.keep.root.dao.ReviewPlaceDao;
import com.keep.root.dao.ReviewPlacePhotoDao;
import com.keep.root.domain.ReviewDay;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.domain.ReviewPlacePhoto;
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

  @Transactional
  @Override
  public int add(ReviewPlace reviewPlace) throws Exception {
    int result = reviewPlaceDao.insert(reviewPlace);
    if (result == 0) {
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
    return result;
  }

  @Transactional
  @Override
  public List<ReviewPlace> list(int reviewDayNo) throws Exception {
    List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAllByReviewDayNo(reviewDayNo);
    for (ReviewPlace reviewPlace : reviewPlaces) {
      reviewPlace
          .setReviewPlacePhotos(reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo()));
    }
    return reviewPlaces;
  }

  @Transactional
  @Override
  public ReviewPlace get(int no) throws Exception {
    ReviewPlace reviewPlace = reviewPlaceDao.findByNo(no);
    reviewPlace
        .setReviewPlacePhotos(reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlace.getNo()));
    return reviewPlaceDao.findByNo(no);
  }

  @Transactional
  @Override
  public int update(ReviewPlace reviewPlace) throws Exception {
    return reviewPlaceDao.update(reviewPlace);
  }

  @Transactional
  @Override
  public int delete(int no) throws Exception {
    List<ReviewPlacePhoto> reviewPlacePhotos = reviewPlacePhotoDao.findAllByReviewPlaceNo(no);
    for (ReviewPlacePhoto reviewPlacePhoto : reviewPlacePhotos) {
      reviewPlacePhotoDao.delete(reviewPlacePhoto.getNo());
    }
    return reviewPlaceDao.delete(no);
  }

  
  // search
//  @Transactional
//  @Override
//  public List<ReviewPlace> list() throws Exception {
//    List<ReviewPlace> reviewPlaces = reviewPlaceDao.findAll();
//    for (ReviewPlace reviewPlace : reviewPlaces) {
//      reviewPlace
//          .setReviewPlacePhotos(reviewPlacePhotoDao.findAll());
//    }
//    return reviewPlaces;
//  }
  
  @Override
  public List<ReviewPlace> search(String keyword) throws Exception {
    return reviewPlaceDao.findByKeyword(keyword);
  }
  
  @Override
  public ReviewPlace searchPlaceGet(int no) throws Exception {
    return reviewPlaceDao.find(no);
  }

@Override
public List<ReviewPlace> list() throws Exception {
	// TODO Auto-generated method stub
	return null;
}

}
